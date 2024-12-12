import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text, Button } from "@radix-ui/themes";
import { loan } from "./transaction/navi.ts";

const DateNumber = (num: number) => {
    let new_num;
    if( num < 10 ) {
        new_num = `0${num}`;
    } else {
        new_num = num;
    }
    return new_num;
}

const Exec = () => {
    const account = useCurrentAccount();
    const {  mutate: signAndExecute } = useSignAndExecuteTransaction();

    const date = new Date();                                // 获取当前的日期和时间
    const month = DateNumber(date.getMonth() + 1);          // 获取月份并格式化，`getMonth()` 返回的范围是 0-11，所以要加 1
    const day = DateNumber(date.getDate());                 // 获取日期并格式化
    const hour = DateNumber(date.getHours());               // 获取小时并格式化
    const usdc_amt = Number(`0.${month}${day}${hour}`);     // 拼接出一个形如 '0.051215' 的字符串，并转换为数字

    return(
        <Container my={"2"}>    
            <Heading mb={"2"}>Wallet Status</Heading>


            { account ? (
                <Flex direction={"column"}>
                <Text>Wallet connected</Text>
                <Text>Address: {account.address}</Text>
                </Flex>
            ): (
                <Text>Wallet not Connected</Text>
            ) }


            { account ? (
                <Flex direction="column">
                    <Flex direction={"column"}>
                        <Text>1、存入 1 SUI</Text>
                        <Text>2、借出当前日期 {`${usdc_amt}`} 的 USDC </Text>
                        <Text>3、存入等额的USDC</Text>
                    </Flex>

                    <Button 
                        onClick={ () => {
                            loan({signAndExecute, 
                                  usdc_amt, 
                                  onError(error) {
                                    console.log(error, '++++error++++')
                                  },
                            });
                        }} 
                        style={{cursor: 'pointer'}}     // 将鼠标变为小手
                    >
                        <Text>执行交易</Text>
                    </Button>
                </Flex>
            ): null}
                
        </Container>
    );
}
export default Exec;