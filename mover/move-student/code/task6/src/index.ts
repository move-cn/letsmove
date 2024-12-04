import { NAVISDKClient } from 'navi-sdk';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { depositCoin, withdrawCoin, SignAndSubmitTXB, } from 'navi-sdk/dist/libs/PTB';
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import { Sui } from 'navi-sdk/dist/address'


const mnemonic = "";
const client = new NAVISDKClient({ mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1 });

// init get block
let txb = new TransactionBlock();
// my account
const account = client.accounts[0];
console.log(account.getWalletBalance(true));
// make txb
let sender = account.address;
console.log(sender)
txb.setSender(sender);

// get my object id from wallet
const source_sui_id = "";

// get pool
const Sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];

// account 1 sui
const amount = 1 * 1e9;
// deposit 
depositCoin(txb, Sui_pool, txb.object(source_sui_id), amount);

// withdraw
withdrawCoin(txb, Sui_pool, amount);

// tranfer txb
txb.setGasBudget(200000000);
const result = SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result: ", result);