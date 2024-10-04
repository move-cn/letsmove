import { useState } from "react";
import { Transaction } from "@mysten/sui/transactions";
import { useCurrentAccount, useSignAndExecuteTransaction, useSuiClient } from "@mysten/dapp-kit";
import { borrowCoin, depositCoin } from 'navi-sdk/dist/libs/PTB';
import { CoinInfo, PoolConfig } from "navi-sdk/dist/types";
import { USDC, Sui, pool } from "navi-sdk/dist/address";
import { Button, Code, Flex, Heading } from "@radix-ui/themes";

export const NaviTransaction: React.FC = () => {
    const suiClient = useSuiClient();
    const account = useCurrentAccount();
    const sender = account?.address;

    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

    const [loading, setLoading] = useState(false);
    const [digest, setDigest] = useState('');
    const [error, setError] = useState('');

    const submitTransaction = async () => {
        if (!sender) {
            console.error('No account connected');
            return;
        }

        setLoading(true);

        // 初始化 TransactionBlock
        const txb = new Transaction();
        txb.setSender(sender);

        try {
            // 同一个PTB完成 Navi SDK 调用下面的交易
            // 1. 存入 1 SUI 到 Navi Protocol
            const depositCoinInfo: CoinInfo = Sui;
            const depositAmount = 1 * 10 ** depositCoinInfo.decimal;
            const depositCoinDetails = await getCoins(depositCoinInfo);
            
            if (!depositCoinDetails || !depositCoinDetails.data.length) {
                throw new Error(`No ${depositCoinInfo.symbol} found`);
            }

            const depositPoolConfig: PoolConfig = pool.Sui;
            const [depositCoinObject] = txb.splitCoins(txb.gas, [depositAmount]);
            
            await depositCoin(txb, depositPoolConfig, depositCoinObject, depositAmount);
            
            // 2. 借出当前日期的 USDC 0.[月][天][小时] 个 USDC
            const toBorrowCoinInfo: CoinInfo = USDC;
            // 代币数量为当前日期的 0.[月][天][小时]
            // 如果当前时间是2024年4月25日15点 借出的金额就是 0.042515 月 天 小时 必须是两位数 2024年5月1日2点 0.050102
            const date = new Date();
            const month = date.getMonth() + 1;
            const day = date.getDate();
            const hour = date.getHours();
            const amountToBorrow = `0.${month.toString().padStart(2, '0')}${day.toString().padStart(2, '0')}${hour.toString().padStart(2, '0')}`;
            const toBorrowAmount = parseFloat(amountToBorrow) * 10 ** toBorrowCoinInfo.decimal;
            const borrowPoolConfig = pool.USDC;
            
            const [toBorrowCoinObject] = await borrowCoin(txb, borrowPoolConfig, toBorrowAmount);

            // 3. 还款，存入等额的 USDC
            await depositCoin(txb, borrowPoolConfig, toBorrowCoinObject, toBorrowAmount);
            
            signAndExecuteTransaction({
                transaction: txb,
            }, {
                onSuccess(result) {
                    console.log('Transaction submitted', result);
                    setDigest(result.digest);
                },
                onError(error) {
                    console.error('Transaction failed', error);
                    setError(error.message);
                },
                onSettled() {
                    console.log('Transaction settled');
                }
            });
        } catch (error: any) {
            console.error(error);
            setError(error.message);
        }

        setLoading(false);
    }

    /**
   * Retrieves coin objects based on the specified coin type.
   * @param coinType - The coin type to retrieve coin objects for. Defaults to "0x2::sui::SUI".
   * @returns A Promise that resolves to the retrieved coin objects.
   */
    async function getCoins(coinType: any = "0x2::sui::SUI") {
        const coinAddress = coinType.address ? coinType.address : coinType;

        const coinDetails = await suiClient.getCoins({
            owner: sender!,
            coinType: coinAddress
        });
        return coinDetails;
    }

    return (
        <Flex direction="column" gap="5">
            <Heading mb="2" size="4">Current Address: {account?.address}</Heading>
            <Flex gap="5" align="center">
                <Button onClick={submitTransaction}>
                    Sign And Submit TXB
                </Button>
                {loading && <span>Loading...</span>}
                {!!error && <Code color="red">{error}</Code>}
                {!!digest && <Code variant="soft">{digest}</Code>}
            </Flex>
        </Flex>
    );
};