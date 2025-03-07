import {
  useCurrentAccount,
  useSignAndExecuteTransaction,
} from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { Button, Flex } from "@radix-ui/themes";
import dayjs from "dayjs";
import {
  depositCoin,
  pool,
  borrowCoin,
  repayDebt,
  nUSDC,
  withdrawCoin,
} from "navi-sdk";
import { useState } from "react";

const getAmount = () => {
  const time = dayjs().format("MMDDHH");
  return Number(`0.${time}`) * 10 ** nUSDC.decimal;
};

export function Task() {
  const [digest, setDigest] = useState<string | null>(null);
  const account = useCurrentAccount();
  const { mutate: signAndExecuteTransaction, isPending } =
    useSignAndExecuteTransaction({
      onSuccess: (res) => {
        console.log("交易成功", res.digest);
        setDigest(res.digest);
      },
      onError: (error) => {
        console.log(">>>>>>交易失败<<<<<<");
        console.error(error.message);
      },
    });

  const completeTransaction = async () => {
    if (!account) return;

    const tx = new Transaction();
    const [coin] = tx.splitCoins(tx.gas, [tx.pure.u64(1e9)]);
    console.log("coin:", coin);

    await depositCoin(tx, pool.Sui, coin, 1e9);

    const amount = getAmount();
    console.log("amount:", amount);

    const [borrowedCoin] = await borrowCoin(tx, pool.nUSDC, amount);
    console.log("borrowedCoin:", borrowedCoin);

    const t = await repayDebt(tx, pool.nUSDC, borrowedCoin, amount);
    console.log("t:", t);
    signAndExecuteTransaction({ transaction: tx });
  };

  const withdrawTransaction = async () => {
    if (!account) return;
    const tx = new Transaction();

    const [returnedCoin] = await withdrawCoin(tx, pool.Sui, 9e8);
    console.log("returnedCoin:", returnedCoin);

    tx.transferObjects([returnedCoin], account.address);
    signAndExecuteTransaction({ transaction: tx });
  };
  return (
    <>
      <Flex gap="3">
        <Button
          disabled={!account}
          size="4"
          onClick={completeTransaction}
          loading={isPending}
        >
          {account ? "完成交易" : "请先连接钱包"}
        </Button>
        <Button
          disabled={!account}
          size="4"
          onClick={withdrawTransaction}
          loading={isPending}
        >
          取钱
        </Button>
      </Flex>
      <p>{digest}</p>
    </>
  );
}
