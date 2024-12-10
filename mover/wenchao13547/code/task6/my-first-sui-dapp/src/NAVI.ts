// 导入所需模块和依赖
import { Transaction } from '@mysten/sui/transactions'; // 引入 Transaction 类，用于构建交易
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB'; // 引入存入和借出币的功能
import { Sui, wUSDC } from "navi-sdk/dist/address"; // 引入 SUI 和 wUSDC 地址配置
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 引入池配置类型定义
import { pool } from 'navi-sdk/dist/address'; // 引入池配置数据

// 定义一个异步的主操作函数 mainAction，传入账户、signAndExecute 函数、借出的 USDC 数量以及成功回调等
export const mainAction = async (account: any, { signAndExecute, usdcAmount, onSuccess = () => { } }: {
    signAndExecute: any; // 签名并执行交易的函数
    usdcAmount: number; // 借出 USDC 的金额
    onSuccess?: (result: any) => void; // 成功后的回调函数（默认空函数）
    onError?: (result: any) => void; // 错误时的回调函数（默认空函数）
}) => {

    // 检查账户是否已连接，如果没有连接钱包，发送提示信息
    if (!account) {
        postMessage("Please connect your wallet first"); // 向前端发送提示消息
        return; // 如果没有连接钱包，退出函数
    }

    // 创建一个新的交易对象
    const tx = new Transaction();

    // 设置交易的发送者为当前账户的地址
    tx.setSender(account.address);

    // 获取池的配置，SUI 池和 wUSDC 池的配置
    const SuiPool: PoolConfig = pool[Sui.symbol as keyof Pool]; // 获取 SUI 池的配置
    const wUSDCPool: PoolConfig = pool[wUSDC.symbol as keyof Pool]; // 获取 wUSDC 池的配置

    // 如果池配置无效，抛出错误
    if (!SuiPool || !wUSDCPool) {
        throw new Error("Invalid pool configuration"); // 如果池配置无效，则抛出异常
    }

    // 设置交易的 Gas 预算为 1e9，确保交易能够正常执行
    tx.setGasBudget(1e9);

    try {
        // 从 Gas 账户中分离出 1 SUI，用于后续操作
        const [sui] = tx.splitCoins(tx.gas, [1e9]);

        // 打印日志，表示正在检查对象的存在性
        console.log("Checking object existence...");

        // 检查分离出的 SUI 是否是有效对象
        const suiObject = await tx.object(sui);
        if (!suiObject) {
            throw new Error(`Object ${sui} does not exist`); // 如果 SUI 对象不存在，则抛出错误
        }

        // 将 SUI 存入 Navi 平台的池中
        await depositCoin(tx as any, SuiPool, sui, 1e9); // 调用存币功能，存入指定的池

        // 借出指定数量的 wUSDC
        const [usdc_coin] = await borrowCoin(tx as any, wUSDCPool, usdcAmount); // 借出 USDC

        // 将借出的 USDC 存入 wUSDC 池中
        await depositCoin(tx as any, wUSDCPool, usdc_coin, usdcAmount); // 将借出的 USDC 存入池

        // 签名并执行交易
        await signAndExecute({
            transaction: tx, // 要执行的交易对象
            chain: "sui:mainnet" // 指定链为 SUI 主网
        }, {
            onSuccess, // 成功时执行传入的回调函数
            onError: (error: any) => { // 错误时执行传入的错误回调
                console.error("Transaction failed:", error); // 打印错误日志
                postMessage(error.message || "Transaction failed"); // 向前端发送错误信息
            },
        });
    } catch (error) {
        // 捕获任何可能的错误
        console.error("Transaction failed:", error); // 打印捕获到的错误
        postMessage(error instanceof Error ? error.message : "An unknown error occurred"); // 发送错误信息给前端
    }

}
