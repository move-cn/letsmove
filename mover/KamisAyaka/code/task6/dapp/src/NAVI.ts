import { Transaction } from "@mysten/sui/transactions"; 
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB'; 
import { Sui, wUSDC } from "navi-sdk/dist/address"; 
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from "navi-sdk/dist/address"; 

export const mainAction = async (
    account: any, 
    {
        signAndExecute, 
        usdcAmount, 
        onSuccess = () => {}, 
        onError = () => {},
    }: {
        signAndExecute: any;
        usdcAmount: number;
        onSuccess?: (result: any) => void;
        onError?: (result: any) => void;
    }
) => {
    // 如果账户未连接，提示用户连接钱包
    if (!account) {
        postMessage("Please connect your wallet first");
        return;
    }

    // 创建一个新的交易实例
    const tx = new Transaction();
    tx.setSender(account.address);
    console.log(tx.toJSON());

    // 获取 Sui 和 wUSDC 的池配置
    const SuiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wUSDCPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

    // 如果池配置不存在，提示错误
    if (!SuiPool || !wUSDCPool) {
        postMessage("SuiPool Or wUSDCPool configuration not found, please check");
        return;
    }

    // 设置交易的 Gas 预算
    tx.setGasBudget(1e8); 

    try {
        const [sui] = tx.splitCoins(tx.gas, [1e9]);

        // 第一步：将 1 个 Sui 存入 Navi 协议
        await depositCoin(tx as any, SuiPool, sui, 1e9);
        console.log('here, deposit sui success');

        // 第二步：从池中借出 USDC
        const [usdc_coin] = await borrowCoin(tx as any, wUSDCPool, usdcAmount);
        console.log('here, borrow usdc success');

        // 第三步：将借出的 USDC 再次存入池中
        await depositCoin(tx as any, wUSDCPool, usdc_coin, usdcAmount);
        console.log('here, deposit usdc success');

        // 第四步：签名并执行交易
        await signAndExecute(
            {
                transaction: tx,            
                chain: "sui:mainnet",     
            },
            {
                onSuccess: (result: any) => {
                    console.log("Transaction successful");
                    onSuccess(result); 
                }, 
                onError: (error: any) => {
                    console.log(error)
                    console.log(typeof error)
                    console.log("Transaction failed: " + error.message); 
                    onError(error); 
                },
            }
        );
    } catch (error) {
        // 捕获异常并发送错误消息
        console.log(error instanceof Error ? error.message : "Transaction failed");
    }
};