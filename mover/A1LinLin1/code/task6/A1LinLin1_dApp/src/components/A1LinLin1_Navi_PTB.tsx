import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes";
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, wUSDC } from "navi-sdk/dist/address";
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";
import { useState } from "react";

// 计算借款金额：确保返回整数
const calculateBorrowAmount = (date: Date): number => {
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  const hour = String(date.getHours()).padStart(2, "0");
  const borrowAmountStr = `0.${month}${day}${hour}`;
  return Math.floor(parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal); // 转换为整数的 USDC 最小单位
};

// 处理存款和借款的异步函数
const depositAndBorrowSui = async (
  account: any,
  signAndExecuteTransaction: any,
  setMessage: (msg: string) => void,
  setDigest: (digest: string) => void,
  date: Date
) => {
  if (!account) {
    setMessage("Please connect your wallet first");
    return;
  }

  try {
    const borrowAmount = calculateBorrowAmount(date);

    // 创建新的交易对象
    const tx = new Transaction();
    tx.setSender(account.address);

    // 获取池配置
    const suiPool: PoolConfig = pool[Sui.symbol as keyof typeof pool];
    const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof typeof pool];

    if (!suiPool || !wusdcPool) {
      throw new Error("Invalid pool configuration");
    }

    // 1. 存款 1 SUI
    const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // 1 SUI = 10^9 MIST
    if (!suiCoin) throw new Error("Failed to split SUI coins");
    await depositCoin(tx, suiPool, suiCoin, 1_000_000_000);

    // 2. 借款 USDC
    const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrowAmount);
    if (!toBorrowCoin) throw new Error("Failed to borrow USDC");

    // 3. 存款借出的 USDC
    await depositCoin(tx, wusdcPool, toBorrowCoin, borrowAmount);

    // 签名并执行交易
    signAndExecuteTransaction(
      { transaction: tx, chain: "sui:mainnet" },
      {
        onSuccess: (result: { digest: string }) => {
          console.log("Transaction successful:", result);
          setDigest(result.digest);
          setMessage(`Transaction completed successfully! Borrowed ${borrowAmount / 10 ** wUSDC.decimal} USDC`);
          localStorage.setItem("lastTransactionDigest", result.digest);
        },
        onError: (error: Error) => {
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

  const currentDate = new Date();

  const copyDigest = () => {
    if (digest) {
      navigator.clipboard.writeText(digest);
      setMessage("Digest copied to clipboard!");
    }
  };

  return (
    <Container>
      <Box>
        <Heading as="h2">Navi Protocol 任务</Heading>
        <Text>
          任务将会把 1 SUI 存入 Navi 协议，根据指定日期借出相应数量的 USDC（格式：0.MMDDHH），然后存入等额的 USDC。
        </Text>
        <Flex gap="3" direction="column">
          <Button
            onClick={() =>
              depositAndBorrowSui(account, signAndExecuteTransaction, setMessage, setDigest, currentDate)
            }
            variant="solid"
            disabled={!account}
          >
            执行交易 (当前时间)
          </Button>
          {digest && (
            <Flex gap="2" align="center">
              <Text>Transaction submitted: {digest}</Text>
              <Button size="1" variant="soft" onClick={copyDigest}>
                Copy Digest
              </Button>
            </Flex>
          )}
          {message && <Text>{message.startsWith("Error") ? `Error: ${message}` : message}</Text>}
        </Flex>
      </Box>
    </Container>
  );
}

export default NaviPTB;