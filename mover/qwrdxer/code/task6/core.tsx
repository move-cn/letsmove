
import { useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { Box, Button, Container, Text } from "@radix-ui/themes";
import { nUSDC, pool } from 'navi-sdk/dist/address';
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB";

//构建交易
// 1.[存入Navi Protocol 1 SUI]
// 2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
// 3.[然后在存入等额的USDC]


//计算借款金额的函数
const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
    const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
    return parseFloat(borrowAmountStr) * 10 ** nUSDC.decimal;
};
export function Navitask() {

    // const currentAccount = useCurrentAccount();
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

    const navitaskexecute = async () => {
        //变量定义
        const tx = new Transaction();
        const date = new Date(); // 获取当前日期
        const borrowamount = calculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());
        try {
            //1. 存入navi 1sui
            const [depositcoin] = tx.splitCoins(tx.gas, [1_000_000_000]);
            await depositCoin(tx, pool.Sui, depositcoin, 1_000_000_000);
            //2. 借出nUSDC
            const [borrowedcoin] = await borrowCoin(tx, pool.nUSDC, borrowamount);
            //[然后在存入等额的USDC]
            await depositCoin(tx, pool.nUSDC, borrowedcoin, borrowamount);

            //签名并交易
            signAndExecuteTransaction({ transaction: tx, chain: "sui:mainnet" }, {
                onError: (error: any) => {
                    console.log(error)
                }
            })
        } catch (err) {
            console.log(err)
        }

    }
    return (
        <>
            <Container>
                <Text>Navi任务:1.[存入Navi Protocol 1 SUI] 2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ] 3.[然后在存入等额的USDC]</Text>
                <Box>
                    <Button onClick={() => navitaskexecute()}>任务执行</Button>
                </Box>
            </Container>
        </>

    )
}