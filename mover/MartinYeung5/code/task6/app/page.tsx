import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { depositCoin, borrowCoin, SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB'
import { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, USDC, Sui } from 'navi-sdk/dist/address'
import * as dotenv from 'dotenv';

dotenv.config();

export default async function task6() {

    const mnemonic = process.env.MNEMONIC || '';
    const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});
    
    //Borrow settings (USDC) - borrow 0.0502 USDC, 借出当前日期的USDC 0.[月][天][小时] 的 USDC
    const toBorrowCoin: CoinInfo = USDC;
    const amount_to_borrow = 0.0502 * 10**toBorrowCoin.decimal;
    
    //Initialize the TransactionBlock
    let txb = new TransactionBlock();
    const account = client.accounts[0];
    let sender = account.address;
    console.log(sender)
    txb.setSender(sender);

    //Deposit settings (Sui)
    const to_deposit_coin = await account.getCoins(Sui);
    const to_deposit_coin_object = txb.object(to_deposit_coin.data[0].coinObjectId);

    //Deposit 1 Sui
    const amount_to_deposit = 1 * 10**Sui.decimal;
    const aui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    await depositCoin(txb, aui_pool, to_deposit_coin_object, amount_to_deposit);

    //Borrow USDC
    const usdc_pool: PoolConfig = pool[USDC.symbol as keyof Pool];
    const [usdc_borrow_coin_obj] = await borrowCoin(txb, usdc_pool, amount_to_borrow);

    // 3. deposit USDC
    await depositCoin(txb, usdc_pool, usdc_borrow_coin_obj, amount_to_borrow);

    const task6_result = await SignAndSubmitTXB(txb, account.client, account.keypair);
    console.log("task6_result = " + task6_result);

    //return task6_result;

}