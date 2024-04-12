import { NAVISDKClient } from 'navi-sdk';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { depositCoin, withdrawCoin, SignAndSubmitTXB, } from 'navi-sdk/dist/libs/PTB';
import type { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import { Sui } from 'navi-sdk/dist/address'

// 读取环境变量 MNEMONIC
const mnemonic = process.env.MNEMONIC;
const client = new NAVISDKClient({ mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1 });

// Initialize the TransactionBlock
let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
console.log(sender);
txb.setSender(sender);

const source_sui_id = "0xd42a39bd656ceac8c2e4ddc7440d7163e335d84759b652eaa468db25025811e1";

// Supported: Sui/NAVX/vSui/USDC/USDT/WETH/CETUS/HAsui, import from address file
const SUI_pool: PoolConfig = pool[Sui.symbol as keyof Pool];

const amount = 1 * 1e9; //Borrow 1 Sui
//Deposit 1 Sui to NAVI Protocol
depositCoin(txb, SUI_pool, txb.object(source_sui_id), amount);

//Withdraw 1 Sui from NAVI Protocol
withdrawCoin(txb, SUI_pool, amount);

txb.setGasBudget(800000000);
const result = SignAndSubmitTXB(txb, account.client, account.keypair);
