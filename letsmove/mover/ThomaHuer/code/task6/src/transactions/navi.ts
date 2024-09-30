import { TransactionBlock } from '@mysten/sui.js/transactions';
import { Transaction } from '@mysten/sui/transactions';
import { depositCoin, borrowCoin, } from 'navi-sdk/dist/libs/PTB'
import { Sui, USDC } from "navi-sdk/dist/address";
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'


export const supply_borrow_supply = async ({ signAndExecute, usdcAmt, onSuccess = () => { }, onError = () => { } }: {
    signAndExecute: any;
    usdcAmt: number;
    onSuccess?: (result: any) => void;
    onError?: (result: any) => void;
}) => {
    let tx = new Transaction();

    // 设置gas
    tx.setGasBudget(1e9);

    // 分离出1sui
    const [sui_1] = tx.splitCoins(tx.gas, [1e9]);

    // // 存入navi
    const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    await depositCoin(tx as any as TransactionBlock, Sui_Pool, sui_1, 1e9);

    // // 借出 usdc
    const USDC_Pool: PoolConfig = pool[USDC.symbol as keyof Pool];
    const [usdc_coin] = await borrowCoin(tx as any as TransactionBlock, USDC_Pool, usdcAmt * 1e6);

    // // 存入 usdc
    await depositCoin(tx as any as TransactionBlock, USDC_Pool, usdc_coin, usdcAmt * 1e6);

    // 签名执行交易
    await signAndExecute({
        transaction: tx,
    }, {
        onSuccess,
        onError,
    });

}

