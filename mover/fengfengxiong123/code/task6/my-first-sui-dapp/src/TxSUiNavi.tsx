import { useCurrentAccount, useSignAndExecuteTransaction } from '@mysten/dapp-kit';
import { Transaction } from '@mysten/sui/transactions';
import { useState } from 'react';
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";


export function TxSUiNavi() {
    const [addr, setAddr] = useState('');
    const [err, setErr] = useState('---');
    const currentAccount = useCurrentAccount();
    const tx = new Transaction();
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
    const myfun = (async () => {
            
        if (currentAccount) {
            setAddr(currentAccount.address);
            tx.setSender(currentAccount.address);
            const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]);
            const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
            const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];
            await depositCoin(tx, suiPool, suiCoin, 1_000_000_000);
            
            const now = new Date();
            // 获取月份（0-11），所以需要加1
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0'); 
            const hours = String(now.getHours()).padStart(2, '0');
            const amt = parseFloat(`0.${month}${day}${hours}`) * 10 ** wUSDC.decimal;
            console.log(1111,amt)

            const [borrowed_wusdc] = await borrowCoin(tx, wusdcPool, amt);
            await depositCoin(tx, wusdcPool, borrowed_wusdc, amt);

            signAndExecuteTransaction(
                { transaction: tx, chain: "sui:mainnet" },
                {
                    onError: (error: any) => { // 为 error 参数指定类型
                        console.error("Transaction failed:", error);
                        setErr(error);
                    },
                }
            )
        }

    })

    return (
        <div>
            <p>{addr}</p>
            <p>{err}</p>
            <button onClick={()=>{myfun()}}>与navi交互</button>
        </div>
    );
}