import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes";
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, wUSDC } from "navi-sdk/dist/address";
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";
import { useState } from "react";


export function MyPtb(){
    const account = useCurrentAccount();

    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

    const [digest, setDigest] = useState<string>("");
    const [message, setMessage] = useState<string>("");
    const deposit_borrow_Sui = async () => {
        if (!account) {
            setMessage("Please connect your wallet first");
            return;
        }

        try {
            const date = new Date(); // 获取当前日期
            const month = date.getMonth() + 1; // 获取月份
            const day = date.getDate(); // 获取日期
            const hour = date.getHours(); // 获取小时

            // 计算借款金额
            const borrow_amount =
                parseFloat(
                    `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`,
                ) *
                10 ** wUSDC.decimal;
            console.log("borrow:"+borrow_amount);

            // 创建新的交易对象
            const tx = new Transaction();
            // 设置交易发送者
            tx.setSender(account.address);

            // 确保池配置有效
            const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
            const wusdcPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];


            // 存款 SUI
            const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // 分割 SUI 代币
            if (!suiCoin) throw new Error("Failed to split SUI coins"); // 如果分割失败，抛出错误

            await depositCoin(tx, suiPool, suiCoin, 1_000_000_000); // 存款 SUI

            // 借款和存款 USDC
            const [toBorrowCoin] = await borrowCoin(tx, wusdcPool, borrow_amount); // 借款 USDC
            if (!toBorrowCoin) throw new Error("Failed to borrow USDC"); // 如果借款失败，抛出错误

            await depositCoin(tx, wusdcPool, toBorrowCoin, borrow_amount); // 存款 USDC

            // 清除之前的消息
            setMessage("");
            setDigest("");

            // 签名并执行交易
            signAndExecuteTransaction(
                { transaction: tx, chain: "sui:mainnet" },
                {
                    onSuccess: (result) => {
                        // 成功时打印结果
                        console.log("Transaction successful:", result);
                        // 设置交易摘要
                        setDigest(result.digest);
                    },
                    onError: (error) => {
                        console.error("Transaction failed:", error);
                        setMessage(error.message || "Transaction failed");
                    },
                },
            );
        } catch (error) {
            console.error("Error in deposit_borrow_Sui:", error);
            setMessage(error instanceof Error ? error.message : "An unknown error occurred");
        }
    };
    return (
        <Container>
            <Box>
                <Heading as="h2">task6</Heading>
                <Text>
                    存入1Sui,并且在借当前日期的usdt是，还相同数量的回去
                </Text>
                <Flex gap="3" direction={"column"}>
                    <Button onClick={deposit_borrow_Sui} variant="solid">交易</Button>
                    {digest && (
                        <Text >Transaction submitted: {digest}</Text>
                    )}
                    {message && (
                        <Text>Error: {message}</Text>
                    )}
                </Flex>
            </Box>
        </Container>
    );
}