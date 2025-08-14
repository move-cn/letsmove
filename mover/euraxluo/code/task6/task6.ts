import { NAVISDKClient } from 'navi-sdk'
import { Sui, USDC, getConfig, pool } from 'navi-sdk/dist/address.js';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB'
import { PoolConfig, Pool, CoinInfo } from 'navi-sdk/dist/types';

const run = async () => {
    const mnemonic = ''
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


    let deposit_sui_amount = 0.042515 * 1_000_000_000;
    const deposit_coin = txb.splitCoins(txb.gas, [txb.pure(deposit_sui_amount)]);
    const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];

    await txb.moveCall({
        target: `${config.ProtocolPackage}::incentive_v2::entry_deposit`,
        arguments: [
            txb.object('0x06'),
            txb.object(config.StorageId),
            txb.object(Sui_Pool.poolId),
            txb.pure(Sui_Pool.assetId),
            deposit_coin,
            txb.pure(deposit_sui_amount),
            txb.object(config.Incentive),
            txb.object(config.IncentiveV2),
        ],
        typeArguments: [Sui_Pool.type],
    });

    const USDC_pool: PoolConfig = pool[USDC.symbol as keyof Pool];
    let borrow_usdc_amount = 0.050102*1_000_000;

    let borrowed_coin = await txb.moveCall({
        target: `${config.ProtocolPackage}::incentive_v2::borrow`,
        arguments: [
            txb.object('0x06'), // clock object id
            txb.object(config.PriceOracle), // The object id of the price oracle
            txb.object(config.StorageId), // Object id of storage
            txb.object(USDC_pool.poolId), // pool id of the asset
            txb.pure(USDC_pool.assetId), // The id of the asset in the protocol
            txb.pure(borrow_usdc_amount), // The amount you want to borrow
            txb.object(config.IncentiveV2), // The incentive object v2
        ],
        typeArguments: [USDC_pool.type] // type arguments, for this just the coin type
    });


    const extra_coin = txb.moveCall({
        target: '0x2::coin::from_balance',
        arguments: [borrowed_coin],
        typeArguments: [USDC_pool.type],
    });

    await txb.moveCall({
        target: `${config.ProtocolPackage}::incentive_v2::entry_deposit`,
        arguments: [
            txb.object('0x06'),
            txb.object(config.StorageId),
            txb.object(USDC_pool.poolId),
            txb.pure(USDC_pool.assetId),
            extra_coin,
            txb.pure(borrow_usdc_amount),
            txb.object(config.Incentive),
            txb.object(config.IncentiveV2),
        ],
        typeArguments: [USDC_pool.type],
    });


    const res = await SignAndSubmitTXB(txb, account.client, account.keypair)

    console.log('result:', res)
}

run()