import { NAVISDKClient } from 'navi-sdk';
import { Sui } from 'navi-sdk/dist/address.js';
import dotenv from "dotenv";

dotenv.config();

const mnemonic =  process.env.MNEMONIC;

const run = async () => {
    try {
        const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 5}); 

        const account = client.accounts[0];
        
        //  Return all Objects that account has
        console.log(`List ${account.address} all coins`);
        // await account.getAllCoins();
        await account.getWalletBalance(true);
        
        let amount = 1_000_000_000;
    
        // 存款
        const depositRes = await account.depositToNavi(Sui, amount);
        console.log(depositRes);
    
        // 提现
        const withdrawRes = await account.withdraw(Sui, amount);
        console.log(withdrawRes);
    } catch (err) {
        console.log('[err]', err)
    }
}

run();