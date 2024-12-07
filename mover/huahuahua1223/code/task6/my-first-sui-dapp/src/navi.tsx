import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes"; // 导入 Radix UI 组件
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit"; // 导入 Mysten DApp Kit 钩子
import { Transaction } from "@mysten/sui/transactions"; // 导入 Sui 交易类
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 导入 Navi SDK 中的池和池配置类型
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"; // 导入 Navi SDK 中的池地址和代币信息
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB"; // 导入 Navi SDK 中的借币和存币函数
import { useState } from "react";

// 1.[Deposit 1 SUI into Navi Protocol]
// 2.[Borrow USDC of the current date 0.[month][day][hour]]
// 3.[Then deposit an equivalent amount of USDC]
export function Navi() {
  // 当前连接的钱包账户
  const account = useCurrentAccount();

  // 获取用于签名和执行交易的函数
  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

  // 用于存储交易摘要和消息的状态
  const [digest, setDigest] = useState<string>(""); // 存储交易摘要
  const [message, setMessage] = useState<string>(""); // 存储错误或成功消息

  // 处理存款和借款的异步函数
  const deposit_borrow_Sui = async () => {
    if (!account) {
      setMessage("Please connect your wallet first"); // 如果没有连接钱包，提示用户
      return;
    }

    try {
      const date = new Date(); // 获取当前日期
      const month = date.getMonth() + 1; // 获取月份
      const day = date.getDate(); // 获取日期
      const hour = date.getHours(); // 获取小时

      // 计算借款金额
      const borrow_amount =
        parseFloat(
          `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`,
        ) *
        10 ** wUSDC.decimal;
      console.log(borrow_amount);

      const tx = new Transaction(); // 创建新的交易对象
      tx.setSender(account.address); // 设置交易发送者

      // 确保池配置有效
      const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
      const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

      if (!suiPool || !wusdcPool) {
        throw new Error("Invalid pool configuration"); // 如果池配置无效，抛出错误
      }

      // 存款 SUI
      const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // 分割 SUI 代币
      if (!suiCoin) throw new Error("Failed to split SUI coins"); // 如果分割失败，抛出错误

      await depositCoin(tx, suiPool, suiCoin, 1_000_000_000); // 存款 SUI

      // 借款和存款 USDC
      const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrow_amount); // 借款 USDC
      if (!toBorrowCoin) throw new Error("Failed to borrow USDC"); // 如果借款失败，抛出错误

      await depositCoin(tx, wusdcPool, toBorrowCoin, borrow_amount); // 存款 USDC

      // 清除之前的消息
      setMessage("");
      setDigest("");

      // 签名并执行交易
      signAndExecuteTransaction(
        { transaction: tx, chain: "sui:testnet" },
        {
          onSuccess: (result) => {
            console.log("Transaction successful:", result); // 成功时打印结果
            setDigest(result.digest); // 设置交易摘要
          },
          onError: (error) => {
            console.error("Transaction failed:", error); // 失败时打印错误
            setMessage(error.message || "Transaction failed"); // 设置错误消息
          },
        },
      );
    } catch (error) {
      console.error("Error in deposit_borrow_Sui:", error); // 捕获并打印错误
      setMessage(error instanceof Error ? error.message : "An unknown error occurred"); // 设置错误消息
    }
  };

  return (
    <Container>
      <Box>
        <Heading as="h2">Navi Protocol Task</Heading>
        <Text>
        此任务将向 Navi 协议存入 1 个 SUI,根据当前日期借入 USDC,然后存入等值的 USDC。
        </Text>
        <Flex gap="3" direction={"column"}>
          <Button onClick={deposit_borrow_Sui} variant="solid">开始交易</Button>
          {digest && (
            <Text >Transaction submitted: {digest}</Text> // 显示交易摘要
          )}
          {message && (
            <Text>Error: {message}</Text> // 显示错误消息
          )}
        </Flex>
      </Box>
    </Container>
  );
}

export default Navi; // 导出组件