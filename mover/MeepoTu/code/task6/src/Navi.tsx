import { Container, Button, Text, Flex } from "@radix-ui/themes";
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Sui, nUSDC, pool } from 'navi-sdk/dist/address'
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { depositCoin, borrowCoin, SignAndSubmitTXB } from "navi-sdk/dist/libs/PTB"

import { Transaction } from "@mysten/sui/transactions";
import { SuiClient } from "@mysten/sui/client";
import { networkConfig } from "./networkConfig";

export function Navi() {
  // 当前账户
  const account = useCurrentAccount();
  const client = new SuiClient({url: networkConfig.mainnet.url})

  let depositAmountInWei = 1.5 * (10 ** Sui.decimal)

  // 获取用于签名和执行交易的函数
  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

  function prefixInteger(num: number, length: number): string {
    return (num / Math.pow(10, length)).toFixed(length).substring(2)
  }
  
  function borrowAmountFromDate(): number {
    const time = new Date()
    const amountStr = "0." + prefixInteger(time.getMonth(), 2) + prefixInteger(time.getDay() , 2) + prefixInteger(time.getHours(), 2)
    return Number(amountStr)
  }

  function createCoinFromBalance(tx: Transaction, balance: any, type: string) {
    return tx.moveCall({
      target: "0x2::coin::from_balance",
      arguments: [balance],
      typeArguments: [type]
    })
  }

  function createCoinIntoBalance(tx: Transaction, coin: any, type: string) {
    return tx.moveCall({
        target: "0x2::coin::into_balance",
        arguments: [coin],
        typeArguments: [type],
    });
}

  async function excute() {

    if (!account) {
      console.log("请链接钱包")
      return;
    }

    const sender = account!.address;
    const tx = new Transaction()
    tx.setSender(sender)
    try {


      var to_deposit_sui = tx.splitCoins(tx.gas, [depositAmountInWei])
      const suidepositPool: PoolConfig = pool[Sui.symbol as keyof Pool]
      await depositCoin(tx, suidepositPool, to_deposit_sui, depositAmountInWei)

      // 借
      const borrowAmountInWei: number = borrowAmountFromDate() * (10 ** nUSDC.decimal)
      const borrowPool: PoolConfig = pool[nUSDC.symbol as keyof Pool]
      const [borrowedCoin] = await borrowCoin(tx, borrowPool, borrowAmountInWei)
      if (!borrowedCoin) {
        throw new Error(`借出 ${nUSDC.symbol}失败`)
      }

      await depositCoin(tx, borrowPool, borrowedCoin, borrowAmountInWei)

      // tx.setGasBudget(0.2 * (10 ** Sui.decimal))

      signAndExecuteTransaction({ transaction: tx, chain: "sui:mainnet" },
        {
          onSuccess: (result) => {
            console.log(`执行成功${result}`)
          },
          onError: (error) => {
            console.log(`执行失败${error}`)
          }
        }
      )
    } catch (error) {
      console.error("Error occur:", error)
    }
  } 

  return (
    <Container>
      <Flex direction={"column"}>
      <Button variant="solid" onClick={excute} > Excute Navi TX </Button>
      <Text>
        本次交易会存入 1sui， 并且借出当前时间的0.
      </Text>
      </Flex>
      
    </Container>
  )
}