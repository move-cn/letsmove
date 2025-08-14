import {useCurrentAccount, useSignAndExecuteTransaction} from "@mysten/dapp-kit";
import {borrowCoin,depositCoin} from "navi-sdk";
import {pool,wUSDC,Sui} from "navi-sdk/dist/address";
import {CoinInfo, Pool, PoolConfig} from "navi-sdk/dist/types";
import {Transaction as SuiTransaction} from "@mysten/sui/transactions";
import {Button} from "@radix-ui/themes";

const NaviPage=()=> {
    const {mutate: signAndExecuteTransaction} = useSignAndExecuteTransaction();
    const currentAccount = useCurrentAccount();

    const handleButtonClick = async () => {
        if (!currentAccount) {
            alert("Please connect your wallet first");
            return;
        }

        console.log("Current Account:", currentAccount);

        const txb = new SuiTransaction();
        txb.setSender(currentAccount.address);

        try {
            //1.存入Navi Protocol 1 SUI
            const depositAmount = 1_000_000_000;
            const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
            const splitCoin = txb.splitCoins(txb.gas, [depositAmount]);
            console.log("Split Coin finish");
            await depositCoin(txb, suiPool, splitCoin, depositAmount);
            console.log("Deposit Sui:", depositAmount);

            //2.借出当前日期的USDC 0.[月][天][小时] 的 USDC
            const FormatNumber = (num: number) => (num < 10 ? `0${num}` : num);
            const date = new Date();
            const hour = FormatNumber(date.getHours());
            const day = FormatNumber(date.getDate());
            const month = FormatNumber(date.getMonth() + 1);
            console.log(`Hour: ${hour}, Day: ${day}, Month: ${month}`);
            const amount = Number(`0.${month}${day}${hour}`);
            console.log("Deposit wUSDC amount:",amount);

            const toBorrowCoin: CoinInfo = wUSDC;
            const usdcPool: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];
            const borrowAmount = amount *Math.pow(10,wUSDC.decimal);
            const [usdcBorrowCoinObj] = await borrowCoin(txb, usdcPool, borrowAmount);
            console.log("borrow USDC:",borrowAmount);

            //3.然后在存入等额的USDC
            await depositCoin(txb, usdcPool, usdcBorrowCoinObj, borrowAmount);
            console.log("repay USDC:", borrowAmount);

            signAndExecuteTransaction({transaction: txb});
            alert("Success to transaction");
        } catch (error) {
            console.error("Failed to transaction");
            alert("Failed to transaction,please check console log");
        }
    };

    return (
        <div>
            <Button onClick={handleButtonClick}>
                Sign And Submit TXB
            </Button>
        </div>
    )
}
export default NaviPage;