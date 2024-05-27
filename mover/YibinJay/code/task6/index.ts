import { TransactionBlock } from "@mysten/sui.js/transactions";
import { NAVISDKClient } from "navi-sdk";
import type { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from "navi-sdk/dist/address";
import {
  Sui,
  NAVX,
  USDC
} from "navi-sdk/dist/address";
import { SignAndSubmitTXB } from "navi-sdk/dist/libs/PTB";

const client = new NAVISDKClient({
  mnemonic: process.env.MNEMONIC,
  networkType: "mainnet",
  numberOfAccounts: 1,
});
const account = client.accounts[0];

(async () => {
  let txb = new TransactionBlock();
  txb.setSender(account.address);
  txb.setGasBudget(500000000);

  const SUI_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];
  const USDC_Pool: PoolConfig = pool[USDC.symbol as keyof Pool];

  const to_deposit = txb.splitCoins(txb.gas, [txb.pure(1000_000_000)]);
  
  await txb.moveCall({
    target: `${process.env.Package}::incentive_v2::entry_deposit`,
    arguments: [
      txb.object("0x06"),
      txb.object(process.env.Storage!),
      txb.object(SUI_Pool.poolId),
      txb.pure(SUI_Pool.assetId),
      to_deposit,
      txb.pure(1000_000_000),
      txb.object(process.env.IncentiveV1!),
      txb.object(process.env.IncentiveV2!),
    ],
    typeArguments: [SUI_Pool.type],
  });

  const borrowAmount = 5_162_2000;
  let borrowed = await txb.moveCall({
    target: `${process.env.Package}::incentive_v2::borrow`,
    arguments: [
      txb.object("0x06"),
      txb.object(process.env.Oracle_Price!), 
      txb.object(process.env.Storage!),
      txb.object(USDC_Pool.poolId),
      txb.pure(USDC_Pool.assetId),
      txb.pure(borrowAmount), 
      txb.object(process.env.IncentiveV2!),
    ],
    typeArguments: [USDC_Pool.type],
  });

  const extra_coin = txb.moveCall({
    target: "0x2::coin::from_balance",
    arguments: [borrowed],
    typeArguments: [USDC_Pool.type],
  });

  await txb.moveCall({
    target: `${process.env.Package}::incentive_v2::entry_deposit`,
    arguments: [
      txb.object("0x06"),
      txb.object(process.env.Storage!),
      txb.object(USDC_Pool.poolId),
      txb.pure(USDC_Pool.assetId),
      extra_coin,
      txb.pure(borrowAmount),
      txb.object(process.env.IncentiveV1!),
      txb.object(process.env.IncentiveV2!),
    ],
    typeArguments: [USDC_Pool.type],
  });

  const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
  console.log(result);
})();