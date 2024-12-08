import { Transaction } from '@mysten/sui/transactions';
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { pool, wUSDC } from 'navi-sdk/dist/address';
import type { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { useSignAndExecuteTransaction, useCurrentAccount } from "@mysten/dapp-kit";
import { Button } from "@radix-ui/themes";

const NaviPage = () => {

    const account = useCurrentAccount()
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

    async function doNaviTask(){
    
        if(!account ){
            alert("Please connect to your wallet first")
            return;
        }

        try {
            const tx = new Transaction();
            tx.setSender(account.address);
    
            const splitCoin = tx.splitCoins(tx.gas, [1_000_000_000])
            console.log('first step: split 1 sui from tx.gas');
    
            const suiPoolConfig: PoolConfig = pool['Sui'];
            console.log('second step: prepare sui pool config');
    
            // 1. 存入Navi Protocol 1 SUI
            await depositCoin(tx, suiPoolConfig, splitCoin, 1_000_000_000);
            console.log('third step: depositCoin to sui pool in navi protocol');
    
            const borrowAmount  =  caculateBorrowAmount();
            console.log(borrowAmount)
    
            const toBorrowCoin: CoinInfo = wUSDC;
            const loanPoolConfig: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];
    
            //将wUSDC的borrowAmount转为正确精度
            const borrowAmountInCorrectPrecision = borrowAmount * Math.pow(10, wUSDC.decimal);
    
            console.log(borrowAmountInCorrectPrecision);
            // 借出wUSDC
            const [borrowedUSDC] = await borrowCoin(tx, loanPoolConfig, borrowAmountInCorrectPrecision);
    
            // 3. 然后在存入等额的wUSDC
            await depositCoin(tx, loanPoolConfig, borrowedUSDC, borrowAmountInCorrectPrecision);
            // 签名并执行交易
    
            signAndExecuteTransaction({ transaction: tx });
    
            console.log('mission complete');
        }
        catch (err) {
            console.log(err);
        }
    }
    
    function caculateBorrowAmount() : number{
        // 借出当前日期的USDC 0.[月][天][小时] 的 USDC    
        const currentDate = new Date();
        const month = currentDate.getMonth() + 1;
        const day = currentDate.getDate();
        const hour = currentDate.getHours();
        return parseFloat(`0.${month}${day}${hour}`);
    }

    
    return (
        <div>
            <Button color='gold' onClick={()=>doNaviTask()}>execute</Button>
        </div>
    );
}

export default NaviPage;