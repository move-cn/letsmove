import { useState } from 'react';
import {useCurrentAccount, useSignAndExecuteTransaction} from '@mysten/dapp-kit';
import { Transaction } from '@mysten/sui/transactions';
import {pool, Sui, wUSDC} from "navi-sdk/dist/address";
import {Pool, PoolConfig} from "navi-sdk/dist/types";
import {borrowCoin, depositCoin} from "navi-sdk/dist/libs/PTB";

export function SdkPtbNavi() {
    const {mutate: handleSignAndExecuteTransaction } = useSignAndExecuteTransaction();
    const [isLoading, setLoading] = useState(false);
    //获取钱包链接用户
    const account = useCurrentAccount();
    const executeTransaction = async () => {
        const transaction = new Transaction();
        // 设置交易的详细信息
        transaction.setSender(account!.address);
        const now = new Date();
        const hour= now.getHours();
        const day = now.getDate();
        const month = now.getMonth() + 1; // 月份是从0开始的，所以需要+1
        // 将时间格式化为 0.[月][天][小时] 的形式，如 "0.421" 代表4月21日15时
        const borrow_amount = parseFloat(`0.${month.toString().padStart(2, '0')}${day.toString().padStart(2, '0')}${hour.toString().padStart(2, '0')}`) * (10 ** wUSDC.decimal);
        setLoading(true);
        try {
            const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
            const [suiCoin] = transaction.splitCoins(transaction.gas, [1_000_000_000]); // 1 SUI = 10^9 MIST
            await depositCoin(transaction, suiPool, suiCoin, 1_000_000_000);
            console.log('deposit_amount count', suiCoin.NestedResult);
            console.log('borrow count', borrow_amount);
            const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];
            const [toBorrowCoin] = await borrowCoin(transaction, wusdcPool, borrow_amount);
            await depositCoin(transaction, wusdcPool,toBorrowCoin, borrow_amount);
            console.log('signAndExecuteTransaction');
            //const result = await handleSignAndExecuteTransaction(transaction, 'sdk-ptb-navi', setLoading);
           // console.log('Transaction executed successfully',result);
            handleSignAndExecuteTransaction(
                {transaction: transaction,}, {
                    onError: (err) => {
                        console.log('Transaction failed', err);
                    },
                    onSuccess: (result) => {
                        console.log('signAndExecuteTransaction',result);
                    },
                })
            setLoading(true);
        } catch (error) {
            console.error('Transaction failed', error);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div>
            <button onClick={executeTransaction} disabled={isLoading}>
                {isLoading ? 'Executing...' : 'Execute Transaction'}
            </button>
        </div>
    );
}