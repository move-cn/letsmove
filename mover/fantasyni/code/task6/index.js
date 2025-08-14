
import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin, SignAndSubmitTXB, borrowCoin} from 'navi-sdk/dist/libs/PTB/index.js'
import { pool, Sui, USDC, getConfig } from 'navi-sdk/dist/address.js'
const mnemonic = ""; //Replace with your mnemonic
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 5});

let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
txb.setSender(sender);

var config = await getConfig();

console.log(config);

const sui_Coin_Pool = pool[Sui.symbol];
const usdc_Coin_Pool = pool[USDC.symbol];

const to_deposit = txb.splitCoins(txb.gas, [txb.pure(1_000_000_000)]);

await depositCoin(txb, sui_Coin_Pool, to_deposit, 1_000_000_000);

// 2024年5月27日10点
// 0.052710
// 52710_000
var borrow_usdc_amount = 0.052710*1_000_000;
const [borrowed_usdc] = await borrowCoin(txb, usdc_Coin_Pool, borrow_usdc_amount);

await depositCoin(txb, usdc_Coin_Pool, borrowed_usdc, borrow_usdc_amount);

const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result: ", result);
