// 创建与navi协议交互的页面
import { useCurrentAccount, useSignAndExecuteTransaction, useSuiClient } from "@mysten/dapp-kit";
import { Button, Flex, Heading } from "@radix-ui/themes";
import { Transaction } from "@mysten/sui/transactions";
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { pool, wUSDC } from 'navi-sdk/dist/address';
import type { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";

const NaviPage = () => {
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
    const client = useSuiClient();
    const currentAccount = useCurrentAccount();

    const handleButtonClick = async () => {
        // 如果当前账户为空，则提示用户先连接钱包
        if (!currentAccount) {
            alert("请先连接钱包");
            return;
        }

        // 获得当前sui的钱包账户
        console.log(currentAccount);

        // 创建一个sui 交易
        const tx = new Transaction();
        // 设置交易的发送者
        tx.setSender(currentAccount.address);

        try {
            const suiPoolConfig: PoolConfig = pool['Sui'];
            // 从钱包中拆分出1SUI，注意不是MIST

             const splitCoin = tx.splitCoins(tx.gas, [1_000_000_000])
             console.log(1);

            // 1. 存入Navi Protocol 1 SUI
             await depositCoin(tx, suiPoolConfig, splitCoin, 1_000_000_000);
             console.log(2);
            // 2. 借出当前日期的USDC 0.[月][天][小时] 的 USDC
            // 创建usdc的pool
            const toBorrowCoin: CoinInfo = wUSDC;
            const loanPoolConfig: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];
            const currentDate = new Date();
            const month = currentDate.getMonth() + 1;
            const day = currentDate.getDate();
            const hour = currentDate.getHours();
            const borrowAmount = parseFloat(`0.${month}${day}${hour}`);

            //将wUSDC的borrowAmount转为正确精度
            const borrowAmountInCorrectPrecision = borrowAmount * Math.pow(10, wUSDC.decimal);

            console.log(borrowAmountInCorrectPrecision);
            // 借出wUSDC
             const [borrowedUSDC] = await borrowCoin(tx, loanPoolConfig, borrowAmountInCorrectPrecision);
             console.log(3);
            // 3. 然后在存入等额的wUSDC
             await depositCoin(tx, loanPoolConfig, borrowedUSDC, borrowAmountInCorrectPrecision);
            // 签名并执行交易
            console.log(4);
             signAndExecuteTransaction({ transaction: tx });

            alert("任务完成！");
        } catch (error) {
            console.error("交易执行失败:", error);
            alert("交易执行失败，请查看控制台日志。");
        }
    };

    return (
        <div>
            <button onClick={handleButtonClick}>执行task6的任务</button>
        </div>
    );
};

export default NaviPage;