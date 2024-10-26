import {useCurrentAccount, useSignAndExecuteTransaction} from "@mysten/dapp-kit";
import {Container, Flex, Heading, Text, Button} from "@radix-ui/themes";
import {supply_borrow_supply} from "./transactions/navi.ts";

const formatDateNumber = (num: number) => {
    return num < 10 ? `0${num}` : num;
}

const Execute = () => {
    const account = useCurrentAccount();
    const {mutate: signAndExecute} = useSignAndExecuteTransaction();

    const date = new Date();
    const month = formatDateNumber(date.getMonth() + 1);
    const day = formatDateNumber(date.getDate());
    const hour = formatDateNumber(date.getHours());
    const usdcAmt = Number(`0.${month}${day}${hour}`);

    return (
        <Container my="2">
            <Heading mb="2">Wallet Status</Heading>

            {account ? (
                <Flex direction="column">
                    <Text>Wallet connected</Text>
                    <Text>Address: {account.address}</Text>
                </Flex>
            ) : (
                <Text>Wallet not connected</Text>
            )}

            {account ? (
                <Flex direction="column">
                    <Heading mb="2">执行交易</Heading>
                    <Flex direction="column">
                        <Text>1. [存入Navi Protocol 1 SUI] </Text>
                        <Text>{`2.[借出当前日期的USDC ${usdcAmt} 的 USDC ]`}</Text>
                        <Text>3.[然后在存入等额的USDC]</Text>
                    </Flex>
                    <Button
                        size="3"
                        onClick={() => {
                            supply_borrow_supply({
                                signAndExecute, usdcAmt, onSuccess(result) {
                                    console.log(result, '++++success++++')
                                }, onError(error) {
                                    console.log(error, '++++error++++')
                                },
                            });
                        }}
                        style={{cursor: 'pointer'}}
                    >
                        <Text>点击执行此交易</Text>
                    </Button>
                </Flex>
            ) : null}
        </Container>
    );
}

export default Execute;
