import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin, borrowCoin, SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB'
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import {Sui, USDC} from 'navi-sdk/dist/address';

const mnemonic = "";
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", wordLength: 12});
const account = client.accounts[0];
const sender = account.address;

async function deposit_borrow_resupply() {    
    let txb = new TransactionBlock();
    txb.setSender(sender);
    
    let getCoinInfo = await account.getCoins();
    if (!getCoinInfo.data[0]) {
        throw new Error("Insufficient balance");
    }
    
    let deposit_amount = 1e9;
    let sui_symbol = Sui.symbol;
    const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];
    const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
    await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

    let borrow_amount = 0.051011 * 1e6;
    let usdc_symbol = USDC.symbol;
    const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
    const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);     

    await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);

    const result = SignAndSubmitTXB(txb, account.client, account.keypair);
    return result;    
}
  

deposit_borrow_resupply().then((res) => {
    console.log("deposit&borrow transaction digest: " + res.digest);
    console.log(res.effects.status);
});