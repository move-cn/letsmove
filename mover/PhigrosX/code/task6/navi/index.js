import {NAVISDKClient} from "navi-sdk";
import {Sui} from "navi-sdk/dist/address.js";

// hash: AAuUEDRGwe6prSY7v6YcHybY7hjQ8DVzPaAZW6HJkt84

const mnemonic = '';
const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 1});
const account = client.accounts[0];
/*
client.getMnemonic();
client.getAllAccounts();
account.getCoins(Sui).then(r => console.log(r));
 */

const balanceMap = account.getWalletBalance()
balanceMap.then((res) => {
    console.log(res);
})

let d = await account.depositToNavi(Sui, 1e9);
console.log(d);