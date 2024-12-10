import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text, Button, Spinner } from "@radix-ui/themes";
import { ConnectButton, useConnectWallet, useWallets } from '@mysten/dapp-kit';
import { wUSDC } from "navi-sdk/dist/address";
import { mainAction } from "./NAVI.ts";
import { withdrawSUI } from "./withdrawSUI";  // 引入取出 SUI 的功能模块
import { useState } from "react";

// 计算借出的 USDC 数量
const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
    const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
    return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

const Execute = () => {

    // State 管理
    const [transactionStatus, setTransactionStatus] = useState<string | null>(null);
    const [errorMessage, setErrorMessage] = useState<string | null>(null);

    const wallets = useWallets();
    const { mutate: connect } = useConnectWallet();

    const account = useCurrentAccount();
    const { mutate: signAndExecute } = useSignAndExecuteTransaction();

    const date = new Date();
    const usdcAmount = calculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());

    // 处理交易执行
    const handleTransaction = async () => {
        setTransactionStatus("Executing transaction...");  // 更新交易状态

        try {
            await mainAction(account, {
                signAndExecute,
                usdcAmount,
                onSuccess(result) {
                    setTransactionStatus("Transaction successful!");  // 成功消息
                    console.log(result, 'Transaction success!');
                },
                onError(error) {
                    setTransactionStatus("Transaction failed");  // 失败消息
                    setErrorMessage(error.message || "An unknown error occurred");
                    console.log(error, 'Something went wrong!');
                },
            });
        } catch (error) {
            setTransactionStatus("Transaction failed");
            setErrorMessage(error instanceof Error ? error.message : "An unknown error occurred");
        }
    };

    // 处理取出 SUI
    const handleWithdrawSUI = async () => {
        setTransactionStatus("Executing SUI withdrawal...");

        try {
            await withdrawSUI(account, {
                signAndExecute,
                suiAmount: 1, // 假设取出 1 SUI
                onSuccess(result) {
                    setTransactionStatus("SUI withdrawal successful!");
                    console.log(result, 'SUI withdrawal success!');
                },
                onError(error) {
                    setTransactionStatus("SUI withdrawal failed");
                    setErrorMessage(error.message || "An unknown error occurred");
                    console.log(error, 'SUI withdrawal failed!');
                },
            });
        } catch (error) {
            setTransactionStatus("SUI withdrawal failed");
            setErrorMessage(error instanceof Error ? error.message : "An unknown error occurred");
        }
    };

    return (
        <Container my="2">
            <Heading mb="2">Wallet Status</Heading>

            <div style={{ padding: 20 }}>
                <ConnectButton />
                <ul>
                    {wallets.map((wallet) => (
                        <li key={wallet.name}>
                            <button
                                onClick={() => {
                                    connect(
                                        { wallet },
                                        {
                                            onSuccess: () => console.log('connected'),
                                        },
                                    );
                                }}
                            >
                                Connect to {wallet.name}
                            </button>
                        </li>
                    ))}
                </ul>
            </div>

            {account ? (
                <Flex direction="column">
                    <Text>Wallet connected</Text>
                    <Text>Address: {account.address}</Text>
                </Flex>
            ) : (
                <Text>Wallet not connected</Text>
            )}

            <Heading mb="2">Transaction Action</Heading>
            {account ? (
                <Flex direction="column">
                    <Heading mb="2">执行交易</Heading>
                    <Flex direction="column">
                        <Text>1. [存入Navi Protocol 1 SUI] </Text>
                        <Text>{`2.[借出当前日期的USDC ${usdcAmount} 的 USDC ]`}</Text>
                        <Text>3.[然后在存入等额的USDC]</Text>
                    </Flex>
                    <Button
                        size="3"
                        onClick={handleTransaction}
                        style={{ cursor: 'pointer' }}
                    >
                        <Text>点击执行此交易</Text>
                    </Button>
                </Flex>
            ) : null}

            {/* 取出 SUI 的操作 */}
            {account ? (
                <Flex direction="column" mt="4">
                    <Heading mb="2">SUI 取出操作</Heading>
                    <Text>4. [取出 1 SUI]</Text>
                    <Button
                        size="3"
                        onClick={handleWithdrawSUI}
                        style={{ cursor: 'pointer' }}
                    >
                        <Text>点击取出 1 SUI</Text>
                    </Button>
                </Flex>
            ) : null}

            {/* 交易状态和加载指示 */}
            {transactionStatus && (
                <Flex direction="column" mt="4">
                    <Text>{transactionStatus}</Text>
                    {transactionStatus === "Executing transaction..." && (
                        <Spinner size="2" style={{ marginTop: "10px" }} />
                    )}
                </Flex>
            )}

            {/* 错误消息 */}
            {errorMessage && (
                <Flex direction="column" mt="4" style={{ color: 'red' }}>
                    <Text>Error: {errorMessage}</Text>
                </Flex>
            )}
        </Container>
    );
};

export default Execute;
