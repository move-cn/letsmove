import { NAVISDKClient } from 'navi-sdk';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { depositCoin, withdrawCoin, SignAndSubmitTXB, } from 'navi-sdk/dist/libs/PTB';
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import { Sui } from 'navi-sdk/dist/address'


const mnemonic = "";
const client = new NAVISDKClient({ mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1 });

// 初始化block区块
let txb = new TransactionBlock();
// 获取account
const account = client.accounts[0];
console.log(account.getWalletBalance(true));
// 获取地址
let sender = account.address;
console.log(sender)
txb.setSender(sender);

// 填充自己钱包下余额足够的sui对应的object id
const source_sui_id = "0xb289801f004dd372ab5ad5241b72c18c7c05a88b600708cad054340c244aacf3";

// 获取sui交易池
const Sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];

// 换算1sui的MIST数量
const amount = 1 * 1e9;
// 入金1sui
depositCoin(txb, Sui_pool, txb.object(source_sui_id), amount);

// 出金1sui
withdrawCoin(txb, Sui_pool, amount);

txb.setGasBudget(1000000000);
const result = SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result: ", result);