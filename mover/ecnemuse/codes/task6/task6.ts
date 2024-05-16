import { generateMnemonic } from 'bip39';
import { Secp256k1Keypair } from '@mysten/sui.js/keypairs/secp256k1';
import { Spot } from 'chakra-sdk';
import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { normalizeSuiObjectId } from "@mysten/sui.js/utils";
import { getFullnodeUrl, SuiClient } from '@mysten/sui.js/client';
import {
  decodeSuiPrivateKey,
  encodeSuiPrivateKey,
} from '@mysten/sui.js/cryptography';
import {depositCoin,withdrawCoin, borrowCoin, flashloan,repayFlashLoan, SignAndSubmitTXB, mergeCoins} from 'navi-sdk/dist/libs/PTB'
import { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { AccountManager } from "navi-sdk/dist/libs/AccountManager";
import { CETUS, getConfig, pool, Sui, USDC, USDT, vSui } from 'navi-sdk/dist/address';
import { SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB'
import dotenv from 'dotenv';
import { NAVISDKClient } from "navi-sdk";
import { CoinInfo, Pool, PoolConfig, OptionType } from 'navi-sdk/src/types';
dotenv.config();





const pk0='suikey..'
const dex = new Dex("https://fullnode.mainnet.sui.io:443")
const decodedPrivateKey=decodeSuiPrivateKey(pk0);
const pk=decodedPrivateKey.secretKey;
const base64ToUint8Array = (base64: string) => {
    var binaryString = atob(base64);
    var bytes = new Uint8Array(binaryString.length);
    for (var i = 0; i < binaryString.length; i++) {
        bytes[i] = binaryString.charCodeAt(i);
    }
    return bytes;
};

const getsigner = (pk: string) => {
    return Ed25519Keypair.fromSecretKey(pk);
};

const signer=getsigner(pk); */

const mnemonic = "";
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});
const txb = new TransactionBlock();
const todesCoin: CoinInfo = Sui;
const borCoin: CoinInfo = USDC;
const config = await getConfig();
const account = client.accounts[0];
let sender = account.getPublicKey();
txb.setSender(sender);
//await kriyaSpot.swap(inputTokenId, outputTokenId, amount, minReceived);
txb.setGasBudget(1e9);
let to_deposit_amount=1 * 10 **9;
const borrowAmount = 51613;

const pool_real: PoolConfig = pool[todesCoin.symbol as keyof Pool];
const pool_bor: PoolConfig = pool[borCoin.symbol as keyof Pool];
//let getCoinInfo = await account.getCoins(todesCoin);

//const mergedCoinObject = mergeCoins(txb, getCoinInfo);
 const to_deposit = txb.splitCoins(txb.gas, [txb.pure(to_deposit_amount)]);
console.log(pool_bor);
await depositCoin(txb,pool_real,to_deposit,to_deposit_amount);
    


let borrowedCoin = await borrowCoin(txb, pool_bor, borrowAmount);
console.log(borrowedCoin);
let to_deposit2=txb.splitCoins(borrowedCoin[0], [txb.pure(borrowAmount)])
await depositCoin(txb,pool_bor,to_deposit2,borrowAmount);
txb.transferObjects(borrowedCoin, sender);
	
const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
console.log('Success: ', result.confirmedLocalExecution);
