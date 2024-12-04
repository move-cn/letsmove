import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';

const mnemonic = 'if you want to try it then try it it is ok';

const client = new NAVISDKClient({mnemonic, numberOfAccounts: 1});

// console.log(client.getAllAccounts());

const account = client.accounts[0];

// console.log(account.getAllCoins());

let amount = 1e9;
account.depositToNavi(Sui, amount);
// console.log(account.depositToNavi(Sui, amount));