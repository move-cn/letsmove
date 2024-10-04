import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin, borrowCoin, flashloan,repayFlashLoan, SignAndSubmitTXB, mergeCoins} from 'navi-sdk/dist/libs/PTB'
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, USDC } from 'navi-sdk/dist/address'
import * as dotenv from 'dotenv';
dotenv.config();

const NETWORK = 'mainnet' 
const MNEMONIC = process.env.MNEMONIC || '';

const client = new NAVISDKClient({mnemonic: MNEMONIC, networkType: NETWORK, numberOfAccounts: 5}); 
const account = client.accounts[0];

let txb: TransactionBlock = new TransactionBlock();
let sender = account.address;
txb.setSender(sender);

// 存入Navi Protocol 1 SUI
const amount_to_deposit = 1*1e9;
const [sui_coin] = txb.splitCoins(txb.gas, [amount_to_deposit]);
const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];
//depositCoin return txb;
await depositCoin(txb, Sui_Pool, sui_coin, amount_to_deposit);

// 借出当前日期的USDC 0.[月][天][小时] 的 USDC
// 当前时间是2024年05月03日22点 借出的金额就是 0.050322
const amount_to_borrow = 0.050322*1e6;
const USDC_Pool: PoolConfig = pool[USDC.symbol as keyof Pool];
// borrowCoin return [coin];
const [usdc_coin] = await borrowCoin(txb, USDC_Pool, amount_to_borrow);

// 存入等额0.050322的USDC
await depositCoin(txb, USDC_Pool, usdc_coin, amount_to_borrow);

// txb.setGasBudget(100000000);
const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result digest is: ", result.digest);