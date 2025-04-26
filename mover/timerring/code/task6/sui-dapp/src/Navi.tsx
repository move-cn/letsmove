import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes"; // import UI
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit"; // import DApp Kit
import { Transaction } from "@mysten/sui/transactions"; // import Sui
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // import Navi SDK
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"; // import Navi SDK
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB"; // import Navi SDK
import { useState } from "react";

// calculate borrow amount
const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
  const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
  return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

// handle deposit and borrow async function
const depositAndBorrowSui = async (account: any, signAndExecuteTransaction: any, setMessage: any, setDigest: any) => {
  if (!account) {
    setMessage("Please connect your wallet first");
    return;
  }

  try {
    const date = new Date(); // get current date
    const borrowAmount = calculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());

    // create new transaction object
    const tx = new Transaction();
    tx.setSender(account.address);

    // get pool config
    const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

    if (!suiPool || !wusdcPool) {
      throw new Error("Invalid pool configuration");
    }

    // deposit SUI
    const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // split SUI coins
    if (!suiCoin) throw new Error("Failed to split SUI coins");

    await depositCoin(tx, suiPool, suiCoin, 1_000_000_000); // deposit SUI

    // borrow USDC
    const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrowAmount);
    if (!toBorrowCoin) throw new Error("Failed to borrow USDC");

    // deposit borrowed USDC
    await depositCoin(tx, wusdcPool, toBorrowCoin, borrowAmount);

    // clear previous messages
    setMessage("");
    setDigest("");

    // sign and execute transaction
    signAndExecuteTransaction(
        { transaction: tx, chain: "sui:mainnet" },
        {
          onSuccess: (result: any) => { // remove or comment out
            console.log("Transaction successful:", result);
            setDigest(result.digest);
          },
          onError: (error: any) => { // specify type for error parameter
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

export function Navi() {
  const account = useCurrentAccount();
  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
  const [digest, setDigest] = useState<string>("");
  const [message, setMessage] = useState<string>("");

  return (
      <Container>
        <Box>
          <Heading as="h2">Navi Protocol Task</Heading>
          <Text>
            Save 1 SUI into Navi protocol, borrow the corresponding amount of USDC based on the current date, then deposit the same amount of USDC.
          </Text>
          <Flex gap="3" direction={"column"}>
            <Button onClick={() => depositAndBorrowSui(account, signAndExecuteTransaction, setMessage, setDigest)} variant="solid">
              Start Transaction
            </Button>
            {digest && <Text>Transaction submitted: {digest}</Text>} {/* print digest */}
            {message && <Text>Error: {message}</Text>} {/* print error message */}
          </Flex>
        </Box>
      </Container>
  );
}

export default Navi;

