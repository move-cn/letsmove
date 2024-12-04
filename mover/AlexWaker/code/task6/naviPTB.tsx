import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes"; // 导入 Radix UI 组件
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit"; // 导入 Mysten DApp Kit 钩子
import { Transaction } from "@mysten/sui/transactions"; // 导入 Sui 交易类
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 导入 Navi SDK 中的池和池配置类型
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"; // 导入 Navi SDK 中的池地址和代币信息
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB"; // 导入 Navi SDK 中的借币和存币函数
import { useState } from "react";

// 计算借款金额
const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
  const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
  return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

// 处理存款和借款的异步函数
const depositAndBorrowSui = async (account: any, signAndExecuteTransaction: any, setMessage: any, setDigest: any) => {
  if (!account) {
    setMessage("Please connect your wallet first");
    return;
  }

  try {
    const date = new Date(); // 获取当前日期
    const borrowAmount = calculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());

    // 创建新的交易对象
    const tx = new Transaction();
    tx.setSender(account.address);

    // 获取池配置
    const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

    if (!suiPool || !wusdcPool) {
      throw new Error("Invalid pool configuration");
    }

    // 存款 SUI
    const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // 分割 SUI 代币
    if (!suiCoin) throw new Error("Failed to split SUI coins");

    await depositCoin(tx, suiPool, suiCoin, 1_000_000_000); // 存款 SUI

    // 借款 USDC
    const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrowAmount);
    if (!toBorrowCoin) throw new Error("Failed to borrow USDC");

    // 存款借出的 USDC
    await depositCoin(tx, wusdcPool, toBorrowCoin, borrowAmount);

    // 清除之前的消息
    setMessage("");
    setDigest("");

    // 签名并执行交易
    signAndExecuteTransaction(
        { transaction: tx, chain: "sui:mainnet" },
        {
          // onSuccess: (result: any) => { // 移除或注释掉
          //   console.log("Transaction successful:", result);
          //   setDigest(result.digest);
          // },
          onError: (error: any) => { // 为 error 参数指定类型
            console.error("Transaction failed:", error);
            setMessage(error.message || "Transaction failed");
          },
        }
    );
  } catch (error) {
    console.error("Error in depositAndBorrowSui:", error);
    setMessage(error instanceof Error ? error.message : "An unknown error occurred");
  }
};

export function NaviPTB() {
  const account = useCurrentAccount();
  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
  const [digest, setDigest] = useState<string>("");
  const [message, setMessage] = useState<string>("");

  return (
      <Container>
        <Box>
          <Heading as="h2">Navi Protocol 任务</Heading>
          <Text>
            任务将会把 1 SUI 存入 Navi 协议，根据当前日期借出相应数量的 USDC，然后存入等额的 USDC。
          </Text>
          <Flex gap="3" direction={"column"}>
            <Button onClick={() => depositAndBorrowSui(account, signAndExecuteTransaction, setMessage, setDigest)} variant="solid">
              开始交易
            </Button>
            {digest && <Text>Transaction submitted: {digest}</Text>} {/* 显示交易摘要 */}
            {message && <Text>Error: {message}</Text>} {/* 显示错误消息 */}
          </Flex>
        </Box>
      </Container>
  );
}

export default NaviPTB;

