import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';

const mnemonic = ''; // Use an existing mnemonic or leave empty to generate a new one
const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 1}); 
//networkType: supports mainnet|testnet|devnet
//wordLength: if you want generate a new mnemonic, you may specify the words length
//numberOfAccounts - How many accounts you want to derive from the mnemonic

const account = client.accounts[0];
const depositRes = await account.depositToNavi(Sui, 1e9);
console.log(depositRes)