import { Button, Container, Flex, Text } from "@radix-ui/themes";
import {
  useCurrentAccount,
  useSignAndExecuteTransaction,
} from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";

import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, wUSDC } from "navi-sdk/dist/address";
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";
import { useState } from "react";

// 1.[存入Navi Protocol 1 SUI]
// 2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
// 3.[然后在存入等额的USDC]
export function NaviTask() {
  //当前连接钱包账户
  const account = useCurrentAccount();

  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
  const [digest, setDigest] = useState("");
  const [message, setMessage] = useState("");

  const deposit_borrow_Sui = async () => {
    const date = new Date();
    const month = date.getMonth() + 1; // getMonth() returns 0-11
    const day = date.getDate();
    const hour = date.getHours();

    // 确保每个数字都是两位数
    const borrow_amount =
      parseFloat(
        `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`,
      ) *
      10 ** wUSDC.decimal;
    console.log("borrow_amount: " + borrow_amount);

    const tx = new Transaction();
    tx.setSender(account!.address);

    //存入1Sui
    // 获取Sui池子配置
    // @ts-ignore
    const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // 1 SUI = 10^9 MIST
    await depositCoin(tx, suiPool, suiCoin, 1_000_000_000);
    console.log("deposit_amount count", suiCoin.NestedResult);

    // 借出USDC
    console.log("borrow count", borrow_amount);
    const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];
    const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrow_amount);

    // 存入USDC
    await depositCoin(tx, wusdcPool, toBorrowCoin, borrow_amount);

    // 提交交易
    console.log("signAndExecuteTransaction");

    await signAndExecuteTransaction(
      { transaction: tx, chain: "sui:mainnet" },
      {
        onSuccess: (result) => {
          console.log("executed transaction success", result);
          setDigest(result.digest);
        },
        onError: (error) => {
          console.log("executed transaction error", error);
          setMessage(error.message);
        },
      },
    );
  };
  return (
    <Container>
      <Flex gap="3" direction={"column"}>
        <Button onClick={deposit_borrow_Sui}>Deposit and Borrow Sui</Button>
        <Text>{digest ? `Transaction submitted: ${digest}` : message}</Text>
      </Flex>
    </Container>
  );
}

export default NaviTask;
