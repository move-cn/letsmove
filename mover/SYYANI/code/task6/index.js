import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';

const mnemonic = '';

const client = new NAVISDKClient({mnemonic, numberOfAccounts: 1});

const account = client.accounts[0];

let amount = 1e9;

account.depositToNavi(Sui, amount);
account.withdraw(Sui, amount)

console.log(account.getAllCoins());