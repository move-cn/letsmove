import { Transaction } from "@mysten/sui/transactions"; // 导入 Sui 交易类
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB'; // 导入存款和借款功能
import { Sui, wUSDC } from "navi-sdk/dist/address"; // 导入 Sui 和 wUSDC 的地址配置
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 导入池的类型定义
import { pool } from "navi-sdk/dist/address"; // 导入池的地址配置

// 主交易逻辑函数
export const mainAction = async (
    account: any, // 当前用户账户信息
    {
        signAndExecute, // 用于签名并执行交易的函数
        usdcAmount, // 借款的 USDC 数量
        onSuccess = () => {}, // 交易成功的回调函数
        onError = () => {}, // 交易失败的回调函数
    }: {
        signAndExecute: any;
        usedAmount: number;
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
    tx.setSender(account.address); // 设置交易发送者为当前账户地址
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
    tx.setGasBudget(1e8); // 设置为 1e8（100,000,000）

    try {
        // 先分离出1个Sui
        const [sui] = tx.splitCoins(tx.gas, [1e9]);

        // 检查是否成功分离出 Sui
        const suiObj = await tx.object(sui);

        if (!suiObj) {
            throw new Error(`${sui} is not a valid Sui object`);
        }

        // 第一步：将 1 个 Sui 存入 Navi 协议
        await depositCoin(tx as any, SuiPool, sui, 1e9);
        console.log('here, deposit sui success');

        // 第二步：从池中借出 USDC
        const [usdc_coin] = await borrowCoin(tx as any, wUSDCPool, usdcAmount);
        console.log('here, borrow usdc success');

        // 第三步：将借出的 USDC 再次存入池中
        await depositCoin(tx as any, wUSDCPool, usdc_coin, usdcAmount);
        console.log('here, deposit usdc success');

        // 第四步：签名并执行交易(这个时候应该会触发钱包弹出弹窗要求用户签名。)
        await signAndExecute(
            {
                transaction: tx,            // 交易事务对象
                chain: "sui:mainnet",      // 指定交易的链为 Sui 主网
            },
            {
                onSuccess: (result: any) => {
                    // 成功时打印提示消息
                    console.log("Transaction successful");
                    onSuccess(result); // 调用传入的成功回调函数
                }, 
                onError: (error: any) => {
                    console.log(error)
                    console.log(typeof error)
                    console.log("Transaction failed: " + error.message); // 失败时发送错误消息
                    onError(error); // 调用传入的失败回调函数
                },
            }
        );
    } catch (error) {
        // 捕获异常并发送错误消息
        console.log(error instanceof Error ? error.message : "Transaction failed");
    }
};