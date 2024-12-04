import { NAVISDKClient } from 'navi-sdk'
import {Sui, NAVX, vSui, USDT, USDC, WETH, CETUS, haSui} from 'navi-sdk/dist/address.js';
const mnemonic = "";
const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 5}); 
const account = client.accounts[0];


console.log(account.getAllCoins());

let amount = 5000000;
console.log(account.depositToNavi(Sui, amount));
