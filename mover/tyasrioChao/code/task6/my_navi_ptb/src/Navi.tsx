import {
  useCurrentAccount,
  useSignAndExecuteTransaction,
} from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { Box, Button, Container, Flex, Heading, Text } from "@radix-ui/themes";
import { borrowCoin, depositCoin, pool, Pool, Sui, wUSDC } from "navi-sdk";
import { useState } from "react";

export function Navi() {
  const account = useCurrentAccount();
  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

  const [digest, setDigest] = useState("");
  const [message, setMessage] = useState("");

  const borrow_and_deposit = async () => {
    if (!account) {
      setMessage("Please connect your wallet first");
      return;
    }

    try {
      const borrow_amount: number = parseInt(
        (0.0323 * 10 ** wUSDC.decimal).toFixed(0),
      );
      console.log(borrow_amount);

      const tx = new Transaction();
      tx.setSender(account.address);

      const suiPool = pool[Sui.symbol as keyof Pool];
      const wusdcPool = pool[wUSDC.symbol as keyof Pool];

      if (!suiPool || !wusdcPool) {
        setMessage("Invalid pool configuration");
        return;
      }

      const [suicoin] = tx.splitCoins(tx.gas, [1_000_000_000]);
      if (!suicoin) throw new Error("Fail to split sui coin");
      console.log("success split!");

      await depositCoin(tx, suiPool, suicoin, 1_000_000_000);
      console.log("success deposit sui!");

      const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrow_amount);
      if (!toBorrowCoin) throw new Error("Fail to borrow coin");
      console.log("success borrow usdc!");

      await depositCoin(tx, wusdcPool, toBorrowCoin, borrow_amount);
      console.log("success deposit usdc!");

      setMessage("");
      setDigest("");

      console.log("start PTB");

      signAndExecuteTransaction(
        { transaction: tx, chain: "sui:mainnet" },
        {
          onSuccess: (result) => {
            console.log("Transaction success:", result);
            setDigest(result.digest);
          },
          onError: (error) => {
            console.log("Transaction error:", error);
            setMessage(error.message || "Transaction failed");
          },
        },
      );
    } catch (error) {
      console.error(error);
      if (error instanceof Error) {
        setMessage(error.message || "Transaction failed");
      } else {
        setMessage("Transaction failed");
      }
    }
  };

  return (
    <Container>
      <Box>
        <Heading>Borrow</Heading>
        <Text>
          必须在同一个PTB完成 Navi SDK 1.[存入Navi Protocol 1 SUI]
          2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
          3.[然后在存入等额的USDC]
        </Text>
        <Flex gap="3" direction={"column"}>
          <Button onClick={borrow_and_deposit}>start PTB</Button>
          {digest && <Text>Transaction subbmited: {digest}</Text>}
          {message && <Text>Error: {message}</Text>}
        </Flex>
      </Box>
    </Container>
  );
}
