import { useCurrentAccount, useSuiClient, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Button, Flex, Heading } from "@radix-ui/themes";
import { Transaction } from "@mysten/sui/transactions";
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { pool, wUSDC } from 'navi-sdk/dist/address';
import type { Pool, PoolConfig } from "navi-sdk/dist/types";
import { useState } from "react";
import ClipLoader from "react-spinners/ClipLoader";

export function SaveToNavi() {
  const currentAccount = useCurrentAccount();
  const suiClient = useSuiClient();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();
  const [isLoading, setIsLoading] = useState(false);

  const handleSave = async () => {
    try {
      if (!currentAccount) {
        console.error("请先连接钱包");
        return;
      }

      setIsLoading(true);
      const txb = new Transaction();
      txb.setSender(currentAccount.address);
      
      // 获取当前日期和时间
      const now = new Date();
      const month = now.getMonth() + 1;
      const day = now.getDate();
      const hour = now.getHours();
      
      // 计算wUSDC借贷金额 (格式: 0.MMDDHHUSDC)
      const borrowAmount = parseFloat(`0.${month.toString().padStart(2, '0')}${day.toString().padStart(2, '0')}${hour.toString().padStart(2, '0')}`);
      
      // 转换为正确的精度
      const borrowAmountWithDecimals = borrowAmount * (10 ** wUSDC.decimal);
      
      // 1. 存入1 SUI
      const suiPoolConfig: PoolConfig = pool['Sui'];
      const [suiCoin] = txb.splitCoins(txb.gas, [1_000_000_000]); // 1 SUI = 10^9 MIST
      await depositCoin(txb, suiPoolConfig, suiCoin, 1_000_000_000);
      
      // 2. 借出wUSDC
      const wusdcPoolConfig: PoolConfig = pool[wUSDC.symbol as keyof Pool];
      const [borrowedUSDC] = await borrowCoin(txb, wusdcPoolConfig, borrowAmountWithDecimals);
      
      // 3. 存入相同金额的wUSDC
      await depositCoin(txb, wusdcPoolConfig, borrowedUSDC, borrowAmountWithDecimals);

      // 发送交易
      signAndExecute(
        {
          transaction: txb,
        },
        {
          onSuccess: (tx) => {
            suiClient.waitForTransaction({ digest: tx.digest }).then(() => {
              console.log("交易成功:", tx);
              setIsLoading(false);
            });
          },
          onError: (error) => {
            console.error("交易失败:", error);
            setIsLoading(false);
          },
        },
      );

    } catch (error) {
      console.error("交易失败:", error);
      setIsLoading(false);
    }
  };

  return (
    <Flex direction="column" gap="2">
      <Heading size="3">Navi Protocol</Heading>
      <Flex direction="column" gap="2">
        <Button 
          onClick={handleSave} 
          disabled={!currentAccount || isLoading}
          size="3"
          style={{ width: '200px' }}
        >
          {isLoading ? <ClipLoader size={20} /> : "Save"}
        </Button>
      </Flex>
    </Flex>
  );
} 