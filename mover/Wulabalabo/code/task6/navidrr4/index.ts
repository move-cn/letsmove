import { TransactionBlock } from "@mysten/sui.js/transactions";
import { NAVISDKClient } from "navi-sdk";
import type { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from "navi-sdk/dist/address";
import {
  Sui,
  NAVX,
} from "navi-sdk/dist/address";
import { SignAndSubmitTXB } from "navi-sdk/dist/libs/PTB";

//initialize the client
const client = new NAVISDKClient({
  mnemonic: process.env.MNEMONIC,
  networkType: "mainnet",
  numberOfAccounts: 1,
});
const account = client.accounts[0];

//const accountCap = await account.createAccountCap();

interface depositCoinSturct {
  balance: number;
  coinObjectId: string;
}

//caculate the deposit value, 0.5 Sui will keep in the account for the transaction fee
const getDepositCoin = async (deposit: number) => {
  return await account.getCoins(Sui).then((coins) => {
    let coinBalance = Number(coins.data[0].balance);
    let depositCoin: depositCoinSturct = {
      balance: coinBalance > deposit + 500_000_000 ? deposit : 0,
      coinObjectId: coins.data[0].coinObjectId,
    };
    return depositCoin;
  });
};
// Navi DDR 4 Task
(async () => {
  let txb = new TransactionBlock();
  txb.setSender(account.address);
  txb.setGasBudget(500000000);

  const SUI_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];
  const NAVX_Pool: PoolConfig = pool[NAVX.symbol as keyof Pool];

  // Step 1 Deposit
  const to_deposit = txb.splitCoins(txb.gas, [txb.pure(100_000_000)]);
  await txb.moveCall({
    target: `${process.env.Package}::incentive_v2::entry_deposit`,
    arguments: [
      txb.object("0x06"),
      txb.object(process.env.Storage!),
      txb.object(SUI_Pool.poolId),
      txb.pure(SUI_Pool.assetId),
      to_deposit,
      txb.pure(100_000_000),
      txb.object(process.env.IncentiveV1!),
      txb.object(process.env.IncentiveV2!),
    ],
    typeArguments: [SUI_Pool.type],
  });

  //Step 2 Borrow
  const borrowAmount = 4_261_20000;
  let borrowed = await txb.moveCall({
    target: `${process.env.Package}::incentive_v2::borrow`,
    arguments: [
      txb.object("0x06"), // clock object id
      txb.object(process.env.Oracle_Price!), // The object id of the price oracle
      txb.object(process.env.Storage!), // Object id of storage
      txb.object(NAVX_Pool.poolId), // pool id of the asset
      txb.pure(NAVX_Pool.assetId), // The id of the asset in the protocol
      txb.pure(borrowAmount), // The amount you want to borrow
      txb.object(process.env.IncentiveV2!), // The incentive object v2
    ],
    typeArguments: [NAVX_Pool.type], // type arguments, for this just the coin type
  });

  //Step 3 Re-Borrow
  const extra_coin = txb.moveCall({
    target: "0x2::coin::from_balance",
    arguments: [borrowed],
    typeArguments: [NAVX_Pool.type],
  });

  //3 Re-supply the borrowed asset from step 2.
  await txb.moveCall({
    target: `${process.env.Package}::incentive_v2::entry_deposit`,
    arguments: [
      txb.object("0x06"),
      txb.object(process.env.Storage!),
      txb.object(NAVX_Pool.poolId),
      txb.pure(NAVX_Pool.assetId),
      extra_coin,
      txb.pure(4_261_20000),
      txb.object(process.env.IncentiveV1!),
      txb.object(process.env.IncentiveV2!),
    ],
    typeArguments: [NAVX_Pool.type],
  });

  const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
  console.log(result);
})();
