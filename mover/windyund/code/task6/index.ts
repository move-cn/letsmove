import { NAVISDKClient } from "navi-sdk";
import {Sui, USDC}  from "navi-sdk/dist/address";


async function main() {

    const mnemonic = "your mnemonic";
    const client = new NAVISDKClient({
        mnemonic: mnemonic,
        networkType: "mainnet",
        numberOfAccounts: 1,
    });

    const accounts = client.getAllAccounts();
    console.log("accounts: ", accounts);

    // get first account
    const account = accounts[0];
    // get wallet balance
    let balance = await account.getWalletBalance(true);
    console.log("wallet balance: ", balance);

    const sui_amount = 1e9;
    // deposit
    const depositRes = await account.depositToNavi(Sui, sui_amount);
    console.log("deposit res: ", depositRes);

    const borrow_amount =  1e6;
    //  borrow
    const withdrawRes = await account.borrow(USDC,borrow_amount);
    console.log(withdrawRes);
    // repay
    const repay = await account.repay(USDC,borrow_amount);

    const withdrawSui = await account.withdraw(Sui, sui_amount);

}
main();