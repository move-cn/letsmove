import { NAVISDKClient } from 'navi-sdk'
import { Sui, NAVX, getConfig, pool } from 'navi-sdk/dist/address.js';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB'
import { PoolConfig, Pool, CoinInfo } from 'navi-sdk/dist/types';

const run = async () => {
  const mnemonic = '' // Use an existing mnemonic or leave empty to generate a new one
  const client = new NAVISDKClient({
    mnemonic,
    networkType: 'mainnet',
    numberOfAccounts: 1
  })

  const account = client.accounts[0]
  const address = account.address
  console.log('address:', address)

  const config = await getConfig();
  console.log('config:', config)

  const txb = new TransactionBlock()
  txb.setGasBudget(1_000_000_000)
  txb.setSender(address)


  let deposit_amount = 5000;
  const deposit_coin = txb.splitCoins(txb.gas, [txb.pure(deposit_amount)]);
  const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];

  await txb.moveCall({
    target: `${config.ProtocolPackage}::incentive_v2::entry_deposit`,
    arguments: [
      txb.object('0x06'),
      txb.object(config.StorageId),
      txb.object(Sui_Pool.poolId),
      txb.pure(Sui_Pool.assetId),
      deposit_coin,
      txb.pure(deposit_amount),
      txb.object(config.Incentive),
      txb.object(config.IncentiveV2),
    ],
    typeArguments: [Sui_Pool.type],
  });



  const NAVX_pool: PoolConfig = pool[NAVX.symbol as keyof Pool];
  let borrowamount = 1000;

  let borrowed_coin = await txb.moveCall({
    target: `${config.ProtocolPackage}::incentive_v2::borrow`,
    arguments: [
      txb.object('0x06'), // clock object id
      txb.object(config.PriceOracle), // The object id of the price oracle
      txb.object(config.StorageId), // Object id of storage
      txb.object(NAVX_pool.poolId), // pool id of the asset
      txb.pure(NAVX_pool.assetId), // The id of the asset in the protocol
      txb.pure(borrowamount), // The amount you want to borrow
      txb.object(config.IncentiveV2), // The incentive object v2
    ],
    typeArguments: [NAVX_pool.type] // type arguments, for this just the coin type
  });


  const extra_coin = txb.moveCall({
    target: '0x2::coin::from_balance',
    arguments: [borrowed_coin],
    typeArguments: [NAVX_pool.type],
  });

  await txb.moveCall({
    target: `${config.ProtocolPackage}::incentive_v2::entry_deposit`,
    arguments: [
      txb.object('0x06'),
      txb.object(config.StorageId),
      txb.object(NAVX_pool.poolId),
      txb.pure(NAVX_pool.assetId),
      extra_coin,
      txb.pure(borrowamount),
      txb.object(config.Incentive),
      txb.object(config.IncentiveV2),
    ],
    typeArguments: [NAVX_pool.type],
  });


  const res = await SignAndSubmitTXB(txb, account.client, account.keypair)

  console.log('result:', res)
}

run()