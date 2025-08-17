import { Button, Container, Flex, Text, Box, Heading } from "@radix-ui/themes";
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { pool, Sui, wUSDC } from "navi-sdk/dist/address";
import { borrowCoin, depositCoin, withdrawCoin } from "navi-sdk/dist/libs/PTB";
import { useState } from "react";

function NaviPTB() {
    const account = useCurrentAccount();
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
    const [message, setMessage] = useState<string>("");

    const handleTransaction = async () => {
        if (!account) {
            setMessage("請先連接錢包");
            return;
        }

        try {
            // 計算借款金額
            const date = new Date();
            const month = (date.getMonth() + 1).toString().padStart(2, "0");
            const day = date.getDate().toString().padStart(2, "0");
            const hour = date.getHours().toString().padStart(2, "0");
            const borrowAmountStr = `0.${month}${day}${hour}`;
            const borrowAmount = parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
            
            console.log(borrowAmountStr, borrowAmount);

            // 建立交易
            const tx = new Transaction();
            tx.setSender(account.address);

            // 存款 1 SUI
            const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]);
            await depositCoin(tx, pool[Sui.symbol], suiCoin, 1_000_000_000);

            // 借款 wUSDC
            const [borrowedCoin] = await borrowCoin(tx, pool[wUSDC.symbol], borrowAmount);

            // 存入借來的 wUSDC
            await depositCoin(tx, pool[wUSDC.symbol], borrowedCoin, borrowAmount);

            // 執行交易
            signAndExecuteTransaction(
                { transaction: tx, chain: "sui:mainnet" },
                {
                    onSuccess: () => setMessage("交易成功！"),
                    onError: (error) => setMessage(`交易失敗: ${error.message}`),
                }
            );
        } catch (error) {
            setMessage(`錯誤: ${error instanceof Error ? error.message : "未知錯誤"}`);
        }
    };

    // 贖回 1 SUI
    const handleWithdraw = async () => {
        if (!account) {
            setMessage("請先連接錢包");
            return;
        }
        try {
            const tx = new Transaction();
            tx.setSender(account.address);
            // 贖回 1 SUI (1_000_000_000 = 1 SUI)
            await withdrawCoin(tx, pool[Sui.symbol], 1_000_000_000);
            signAndExecuteTransaction(
                { transaction: tx, chain: "sui:mainnet" },
                {
                    onSuccess: () => setMessage("贖回成功！1 SUI 已回到錢包"),
                    onError: (error) => setMessage(`贖回失敗: ${error.message}`),
                }
            );
        } catch (error) {
            setMessage(`錯誤: ${error instanceof Error ? error.message : "未知錯誤"}`);
        }
    };

    return (
        <Container>
            <Box>
                <Heading as="h2">Navi Protocol 任務</Heading>
                <Text>存入 1 SUI，借出相應數量的 wUSDC，再存入借來的 wUSDC</Text>
                <Flex gap="3" direction="column">
                    <Button onClick={handleTransaction} variant="solid">
                        Demo開始交易
                    </Button>
                    <Button onClick={handleWithdraw} variant="outline">
                        贖回 1 SUI
                    </Button>
                    {message && <Text>{message}</Text>}
                </Flex>
            </Box>
        </Container>
    );
}

export default NaviPTB;
