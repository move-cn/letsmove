import {useCurrentAccount, useSignAndExecuteTransaction} from "@mysten/dapp-kit";
import {Transaction} from "@mysten/sui/transactions";
import {pool, wUSDC, Sui, depositCoin, borrowCoin} from "navi-sdk";
import {Pool} from "navi-sdk/dist/types";
import {Button} from "@radix-ui/themes";

const NaviProtocol = () =>{
    const {mutate: signAndExecuteTransaction} = useSignAndExecuteTransaction();
    const account = useCurrentAccount();

    const handleButtonClick = async () =>{
        if(!account){
            alert("Please connect wallet");

        }

        const txb = new Transaction();
        if(account?.address){
            txb.setSender(account?.address);
        }else{
            throw new Error("No account address")
        }

        try{
            const deposit_Amount = 1_000_000_000;
            const suiPool = pool[Sui.symbol as keyof Pool];
            const coin = txb.splitCoins(txb.gas, [deposit_Amount]);
            console.log("Ready Coin");
            await depositCoin(txb, suiPool, coin,  deposit_Amount);
            console.log("Deposit SUI:",deposit_Amount);

            const date_Format = (num: number) => (num < 10? `0${num}`: num);
            const date = new Date();
            const month = date_Format(date.getMonth());
            const day = date_Format(date.getDate());
            const hour = date_Format(date.getHours());
            console.log(`Month: ${month}, Day: ${day}, Hour: ${hour}`);
            const amount = Number(`0.${month}${day}${hour}`);
            console.log("Borrow wUSDC amount:", amount);

            const wusdcPool = pool[wUSDC.symbol as keyof Pool];
            const borrow_amount = amount * Math.pow(10, wUSDC.decimal);
            const [wusdc_borrowObj] = await borrowCoin(txb, wusdcPool, borrow_amount);

            await depositCoin(txb, wusdcPool, wusdc_borrowObj, borrow_amount);
            console.log("Deposit wUSDC amount:", wusdc_borrowObj);

            signAndExecuteTransaction({transaction: txb});
            alert("Successfully Deposited");
        }catch(error){
            console.error(error);
            alert("Failed to transaction");
        }
    };
    return(
        <div>
            <Button onClick={handleButtonClick}>
                Sign & Submit Transaction
            </Button>
        </div>
    )
}
export default NaviProtocol;