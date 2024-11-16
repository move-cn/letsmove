import { useCurrentAccount, useSignAndExecuteTransaction, useSuiClient } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { Button } from "@radix-ui/themes";
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB'
import { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address';
import dayjs from 'dayjs'

export function NaviDeposit() {
    const account = useCurrentAccount();
    const suiClient = useSuiClient();

    const { mutate: signAndExecute } = useSignAndExecuteTransaction({
        execute: async ({ bytes, signature }) =>
          await suiClient.executeTransactionBlock({
            transactionBlock: bytes,
            signature,
            options: {
              // Raw effects are required so the effects can be reported back to the wallet
              showRawEffects: true,
              showEffects: true,
            },
          }),
      });

    const depositAndBorrow = async () => {
        console.log('deposit')
        if (!account) {
            return
        }
        try {
            const txb = new Transaction();
            txb.setGasBudget(1e9);

            const deposit_amount = 1e9;
            const pool_sui: PoolConfig = pool['Sui'];
            const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
            await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

            const dateTime = parseFloat('0.' + dayjs(new Date()).format('MMDDHH'))
            console.log('dateTime = ', dateTime)
            const borrow_amount = Math.round(dateTime * 1e6);
            const pool_usdc: PoolConfig = pool['wUSDC'];
            const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);

            await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);

            signAndExecute(
                {
                    transaction: txb,
                },
                {
                    onSuccess: async (data) => {
                        console.log("transaction digest: " + JSON.stringify(data));
                    },
                    onError: (err) => {
                        console.log("transaction error: " + err);
                    }
                },
            );
        } catch (e) {
            console.error("failed", e);
            alert("failed (see response in the console)");
        }
    }

    return (<div>
        <Button onClick={ depositAndBorrow }>depositAndBorrow</Button>
    </div>)
}