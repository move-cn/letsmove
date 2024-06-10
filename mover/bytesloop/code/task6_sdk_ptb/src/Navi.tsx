import { useAccountBalance, useWallet } from "@suiet/wallet-kit";
import { Button } from "@radix-ui/themes";

import { depositCoin, borrowCoin } from "navi-sdk/dist/libs/PTB";
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from "navi-sdk/dist/address";
import { Sui, USDC } from "navi-sdk/dist/address";
import { TransactionBlock } from "@mysten/sui.js/transactions";

export function Navi() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();

  async function handleNAVISDK() {
    if (!wallet.account) return;
    const account = wallet.account;
    const sender = account.address;
    try {
      let txb = new TransactionBlock();
      txb.setSender(sender);

      let getCoinInfo = balance;
      if (!getCoinInfo) {
        throw new Error("Insufficient balance");
      }

      let deposit_amount = 1e9;
      let sui_symbol = Sui.symbol;
      const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];
      const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
      await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

      let borrow_amount = 0.053117 * 1e6;
      let usdc_symbol = USDC.symbol;
      const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
      const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);

      await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);

      const resData = await wallet.signAndExecuteTransactionBlock({
        transactionBlock: txb,
      });
      console.log("transaction digest: " + JSON.stringify(resData));
    } catch (e) {
      console.error("Operation failed (see response in the console)", e);
    }
  }

  if (!wallet.account) {
    return;
  }

  return (
    <Button my="9" onClick={handleNAVISDK}>
      Start Navi Transfer
    </Button>
  );
}