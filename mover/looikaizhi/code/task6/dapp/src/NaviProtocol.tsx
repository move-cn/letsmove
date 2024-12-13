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
            return;
        }

        const txb = new Transaction();
        if(account?.address){
            txb.setSender(account?.address);
        }else{
            console.error("No account address found");
            alert("Wallet connection error");
            return;
        }

        try{
            const deposit_Amount = 1_000_000_000;
            const suiPool = pool[Sui.symbol as keyof Pool];
            const coin = txb.splitCoins(txb.gas, [deposit_Amount]);
            
            // 1. 先存入 SUI
            await depositCoin(txb, suiPool, coin, deposit_Amount);
            
            // 2. 计算 USDC 金额
            const date_Format = (num: number) => (num < 10 ? `0${num}` : num);
            const date = new Date();
            const month = date_Format(date.getMonth());
            const day = date_Format(date.getDate());
            const hour = date_Format(date.getHours());
            const amount = Number(`0.${month}${day}${hour}`);
            
            // 3. 借入并直接存入 USDC
            const wusdcPool = pool[wUSDC.symbol as keyof Pool];
            const borrow_amount = amount * Math.pow(10, wUSDC.decimal);
            const [borrowedCoin] = await borrowCoin(txb, wusdcPool, borrow_amount);
            
            // 4. 直接将借到的 USDC 存入池子，不经过钱包
            await depositCoin(txb, wusdcPool, borrowedCoin, borrow_amount);

            await signAndExecuteTransaction(
                { transaction: txb },
                {
                    onSuccess: (response) => {
                        console.log("Transaction successful:", response);
                        alert("Successfully deposited SUI and USDC!");
                    },
                    onError: (error) => {
                        console.error("Transaction failed:", error);
                        alert(`Transaction failed: ${error.message}`);
                    },
                }
            );
        } catch(error) {
            console.error("Transaction error:", error);
            alert(`Failed to execute transaction: ${error.message}`);
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
