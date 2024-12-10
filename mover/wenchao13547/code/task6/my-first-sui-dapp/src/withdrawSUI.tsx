// 引入必要的模块
import { Transaction } from '@mysten/sui/transactions'; // 引入交易相关类
import { withdrawCoin } from 'navi-sdk/dist/libs/PTB'; // 引入存币、借币和取币函数
import { Sui } from "navi-sdk/dist/address"; // 引入 SUI 和 wUSDC 地址配置
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 引入池配置类型
import { pool } from 'navi-sdk/dist/address'; // 引入池配置数据

// 定义取出 SUI 的操作函数
export const withdrawSUI = async (account: any, { signAndExecute, suiAmount, onSuccess = () => { } }: {
    signAndExecute: any; // 签名并执行交易的函数
    suiAmount: number;   // 取出 SUI 的金额
    onSuccess?: (result: any) => void; // 成功后的回调函数（默认空函数）
    onError?: (result: any) => void;  // 错误时的回调函数（默认空函数）
}) => {

    if (!account) {
        postMessage("Please connect your wallet first");
        return; // 如果没有连接钱包，退出函数
    }

    const tx = new Transaction();
    tx.setSender(account.address); // 设置交易的发送者为当前账户地址

    // 获取 SUI 池的配置
    const SuiPool: PoolConfig = pool[Sui.symbol as keyof Pool];

    if (!SuiPool) {
        throw new Error("Invalid pool configuration");
    }

    tx.setGasBudget(1e9); // 设置交易的 Gas 预算为 1e9

    try {
        // 从池中取出指定数量的 SUI，确保丢弃不需要的返回值
        const [ ] = await withdrawCoin(tx as any, SuiPool, suiAmount); // 丢弃不需要的返回值
        console.log([ ])
        // 执行签名并执行交易
        await signAndExecute({
            transaction: tx,
            chain: "sui:mainnet"
        }, {
            onSuccess, // 成功时执行传入的回调函数
            onError: (error: any) => { // 错误时执行传入的错误回调
                console.error("Transaction failed:", error);
                postMessage(error.message || "Transaction failed");
            },
        });
    } catch (error) {
        console.error("Transaction failed:", error);
        postMessage(error instanceof Error ? error.message : "An unknown error occurred");
    }
};