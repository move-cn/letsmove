import { Transaction } from '@mysten/sui/transactions';
import { depositCoin, borrowCoin, } from 'navi-sdk/dist/libs/PTB'
import { Sui, wUSDC } from "navi-sdk/dist/address";
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'


export const mainAction = async (account: any, { signAndExecute, usdcAmount, onSuccess = () => { } }: {
    signAndExecute: any;
    usdcAmount: number;
    onSuccess?: (result: any) => void;
    onError?: (result: any) => void;
}) => {

    if (!account) {
        postMessage("Please connect your wallet first");
        return;
    }


    const tx = new Transaction();

    tx.setSender(account.address);

    // 获取池配置
    const SuiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wUSDCPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

    if (!SuiPool || !wUSDCPool) {
        throw new Error("Invalid pool configuration");
    }

    // 设置gas
    tx.setGasBudget(1e9);

    try {
        // 分离出1sui
        const [sui] = tx.splitCoins(tx.gas, [1e9]);

        console.log("Checking object existence...");
        const suiObject = await tx.object(sui);
        if (!suiObject) {
            throw new Error(`Object ${sui} does not exist`);
        }

        // 将其存入navi
        await depositCoin(tx as any, SuiPool, sui, 1e9);

        // 借出 usdc
        const [usdc_coin] = await borrowCoin(tx as any, wUSDCPool, usdcAmount);

        // 存入 usdc
        await depositCoin(tx as any, wUSDCPool, usdc_coin, usdcAmount);

        // 签名执行交易
        await signAndExecute({
            transaction: tx, chain: "sui:mainnet"
        }, {
            onSuccess,
            onError: (error: any) => { // 为 error 参数指定类型
                console.error("Transaction failed:", error);
                postMessage(error.message || "Transaction failed");
            },
        });
    } catch (error) {
        console.error("Transaction failed:", error);
        postMessage(error instanceof Error ? error.message : "An unknown error occurred");
    }

}