import {Box, Button, Container, Flex, Text} from "@radix-ui/themes";
import {useCurrentAccount, useSignAndExecuteTransactionBlock} from "@mysten/dapp-kit";
import {TransactionBlock} from "@mysten/sui.js/transactions";
import {Pool, PoolConfig} from "navi-sdk/dist/types";
import {pool, Sui, USDC} from "navi-sdk/dist/address";
import {borrowCoin, depositCoin} from "navi-sdk/dist/libs/PTB";
import {useState} from "react";

// 任务 必须在同一个PTB完成 Navi SDK
// 1.[存入Navi Protocol 1 SUI]
// 2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
// 3.[然后在存入等额的USDC]
export function MyTask() {
    // 当前用户对象
    const account = useCurrentAccount()!;

    const {mutate: signAndExecuteTransaction} = useSignAndExecuteTransactionBlock();
    const [digest, setDigest] = useState('');
    const [message, setMessage] = useState('');

    function prefixInteger(num: number, length: number): string {
        return (num / Math.pow(10, length)).toFixed(length).substring(2)
    }

    const shouldBorrowAmount = () => {
        const time = new Date()
        const transactionAmount = "0." + prefixInteger(time.getMonth() + 1, 2) + prefixInteger(time.getDate(), 2) + prefixInteger(time.getHours(), 2);
        // console.log('borrow', transactionAmount)
        return Number(transactionAmount)
    }

    const deposit_borrow = async () => {
        // 待存入的SUI币数量
        const depostSuiAmount = 10 ** Sui.decimal;
        // 待借入的USDC币数量
        const borrowAmount = shouldBorrowAmount() * (10 ** USDC.decimal)

        const txb = new TransactionBlock();
        txb.setSender(account!.address);

        //
        // step 1: 存入1个SUI
        //
        txb.setSender(account!.address);
        const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];

        // 需要存入的代币
        console.log('deposit count', depostSuiAmount);
        const [deposit_coin] = txb.splitCoins(txb.gas, [txb.pure(depostSuiAmount)]);
        await depositCoin(txb, suiPool, deposit_coin, depostSuiAmount);

        //
        // step 2：借出USDC
        //
        console.log('borrow count', borrowAmount);
        const usdcPool: PoolConfig = pool[USDC.symbol as keyof Pool];
        const [toBorrowCoin] = await borrowCoin(txb, usdcPool, borrowAmount);

        //
        // step 3：将借到的USDC存入NAVI pool，否则该PTB无效（对象没有存放）
        //
        await depositCoin(txb, usdcPool, toBorrowCoin, borrowAmount);

        // 将PTB签名上链
        console.log('signAndExecuteTransaction');
        signAndExecuteTransaction(
            {
                transactionBlock: txb,
                chain: 'sui:mainnet',
            },
            {
                onSuccess: (result) => {
                    console.log('executed transaction', result);
                    setDigest(result.digest);
                },
                onError: (result) => {
                    console.log('trans error', result.message);
                    setMessage(result.message);
                }
            },
        );
    }
    return (
        <Container>
            <Flex gap="3" direction={"column"}>
                <Text>钱包地址:{account.address}</Text>
                <Button onClick={deposit_borrow}>存入代币 & 借出USDC</Button>
                <Text>数字签名: {digest}</Text>
                <Text>错误信息: {message}</Text>
            </Flex>
        </Container>
    )
}