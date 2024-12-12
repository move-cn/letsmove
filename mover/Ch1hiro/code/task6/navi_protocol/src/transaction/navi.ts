import { Transaction } from "@mysten/sui/transactions";
import { depositCoin, borrowCoin } from "navi-sdk/dist/libs/PTB";
import { Sui, wUSDC, pool } from "navi-sdk/dist/address";
import { Pool, PoolConfig } from "navi-sdk/dist/types";

export const loan = async ( { 
    signAndExecute, 
    usdc_amt, 
    onError = () => { }
}: { 
    signAndExecute: any; 
    usdc_amt: number; 
    onError?: (result: any) => void;
} ) => {
    let tx = new Transaction();
        console.log(usdc_amt);
        // 分离出 Sui
        const [sp_sui] = tx.splitCoins(tx.gas, [1_000_000_000]);
    
        // 将sui存入navi
        const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];
        await depositCoin(tx as any, Sui_Pool, sp_sui, 1_000_000_000);                // await 用于异步处理
    
        // 借出USDC 
        const USDC_Pool: PoolConfig = pool[wUSDC.symbol as keyof Pool];
        const [usdc_coin] = await borrowCoin(tx as any, USDC_Pool, usdc_amt * Math.pow(10, wUSDC.decimal));
    
        // 存入 USDC
        await depositCoin(tx as any, USDC_Pool, usdc_coin, usdc_amt * Math.pow(10,wUSDC.decimal));
    
    
        // 进行签名交易
        await signAndExecute({
            transaction: tx,
        }, {
            onError,
        });
}
