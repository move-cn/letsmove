import { NAVISDKClient } from 'navi-sdk'
import {Sui} from 'navi-sdk/dist/address.js';


import {mnemonic} from './mnemonic.js'

const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 5});

const account = client.accounts[0]
console.log(account);
console.log(account.getWalletBalance(true));


const result = account.depositToNavi(Sui, 1e9);
console.log(result);

result.then(res => {
    console.log(res);
}).catch(err => {
    console.log(err);
})

