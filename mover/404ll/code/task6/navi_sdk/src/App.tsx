import { NAVISDKClient } from 'navi-sdk';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { depositCoin, borrowCoin, SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB/index.js';
import { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, wUSDC, Sui } from 'navi-sdk/dist/address.js';
import { Transaction } from '@mysten/sui/transactions';


async function navi() {
    // 格式化日期数字，确保为两位数格式（如 01, 02）
    const formatDateNumber = (num: number) => (num < 10 ? `0${num}` : `${num}`);

    // 获取当前时间信息并计算 `amount`
    const date = new Date();
    const day = formatDateNumber(date.getDate());
    const month = formatDateNumber(date.getMonth() + 1); // 注意月份从 0 开始，需要 +1
    const hour = formatDateNumber(date.getHours());
    const amount = Number(`${month}${day}${hour}`);

    // 初始化
    const mnemonic = process.env.mnemonic;
    const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 });

    //const txb = new TransactionBlock();
    const txb = new Transaction();
    const account = client.accounts[0];
    const sender = account.address;
    txb.setSender(sender);
    txb.setGasBudget(100000000);


    console.log("账户地址: ", sender);

    // 获取账户中的 SUI 资产
    const allCoins = await account.getCoins(Sui);
    console.log("账户中的 SUI: ", allCoins);

    // 存入 SUI
    const depositAmount = 1e9; // 1 SUI
    const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const [toDeposit] = txb.splitCoins(txb.gas, [depositAmount]);
    depositCoin(txb, suiPool, toDeposit, depositAmount);
    console.log("存入 SUI: ", depositAmount);

    // 借出 wUSDC
    const usdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];
    const toBorrowCoin: CoinInfo = wUSDC;
    const borrowAmount = amount * 10 ** toBorrowCoin.decimal;
    const [usdcBorrowCoinObj] = await borrowCoin(txb, usdcPool, borrowAmount);
    console.log(`借出 USDC: ${borrowAmount / 10 ** toBorrowCoin.decimal}`);

    // 归还 USDC
    depositCoin(txb, usdcPool, usdcBorrowCoinObj, borrowAmount);
    console.log("归还 USDC: ", borrowAmount);

    // 签名并提交交易
    const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
    console.log("交易结果: ", result);

    return result;
}

// 执行任务
navi().then((result) => {
    console.log("任务执行成功，结果为: ", result);
}).catch((error) => {
    console.error("任务执行失败: ", error);
});
