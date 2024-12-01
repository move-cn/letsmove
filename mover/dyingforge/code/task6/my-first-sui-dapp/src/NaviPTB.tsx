import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes"; 
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit"; 
import { Transaction } from "@mysten/sui/transactions"; 
import { Pool, PoolConfig } from "navi-sdk/dist/types"; 
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"; 
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB"; 
import { useState } from "react";


export function NaviPTB() {
  const account = useCurrentAccount();

  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();


  const [, setDigest] = useState<string>("");
  const [, setMessage] = useState<string>("");

  const deposit_borrow_Sui = async () => {
    if (!account) {
      setMessage("Please connect your wallet first");
      return;
    }

    //获取日期
    try {
      const date = new Date(); 
      const month = date.getMonth() + 1; 
      const day = date.getDate(); 
      const hour = date.getHours(); 

      // 计算借款金额
      const borrowAmount = parseFloat(`0.${month}${day}${hour}`);

      console.log(borrowAmount);

      // 创建新的交易对象
      const tx = new Transaction();
      // 设置交易发送者
      tx.setSender(account.address);

      // 确保池配置有效
      const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
      const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];


      // 存入SUI
      const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); 
      if (!suiCoin) throw new Error("Failed to split SUI coins"); 

      await depositCoin(tx, suiPool, suiCoin, 1_000_000_000); 

      // 借出并存储usdt
      const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrowAmount); 
      if (!toBorrowCoin) throw new Error("Failed to borrow USDC"); 

      await depositCoin(tx, wusdcPool, toBorrowCoin, borrowAmount); 

      //执行交易
      signAndExecuteTransaction(
          { transaction: tx, chain: "sui:mainnet" },
          {
            onSuccess: (result) => {
              console.log("Transaction successful:", result);
              setDigest(result.digest);
            },
            onError: (error) => {
              console.error("Transaction failed:", error);
              setMessage(error.message || "Transaction failed");
            },
          },
      );
    } catch (error) {
      console.error("Error in deposit_borrow_Sui:", error);
      setMessage(error instanceof Error ? error.message : "An unknown error occurred");
    }
  };

  return (
      <Container>
        <Box>
          <Heading as="h2">task6</Heading>
          <Text>
            存入1Sui,并且在借当前日期的usdt是,还相同数量的回去
          </Text>
          <Flex gap="3" direction={"column"}>
            <Button onClick={deposit_borrow_Sui} variant="solid">交易</Button>
          </Flex>
        </Box>
      </Container>
  );
}

export default NaviPTB; // 导出组件