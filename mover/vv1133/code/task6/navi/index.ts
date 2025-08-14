import * as dotenv from 'dotenv';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { NAVISDKClient } from 'navi-sdk'
import { depositCoin, withdrawCoin, borrowCoin, flashloan, SignAndSubmitTXB, mergeCoins } from 'navi-sdk/dist/libs/PTB'
import { pool, Sui, NAVX, vSui, USDT, USDC, WETH, CETUS, haSui } from 'navi-sdk/dist/address';
import { PoolConfig, Pool, CoinInfo } from 'navi-sdk/dist/types';

dotenv.config();

const mnemonic = process.env.MNEMONIC || '';
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});

//console.log(client.getAllAccounts())


async function operateNave() {
    let txb = new TransactionBlock();
    const account = client.accounts[0];
    let sender = account.address;
    console.log(sender)
    txb.setSender(sender);

    const sui_token_obj_addr = await account.getCoins(Sui);
    const sui_deposit_coin_obj = txb.object(sui_token_obj_addr.data[0].coinObjectId);

    // 1. deposit 1 Sui
    const amount_to_deposit = 1 * 10**Sui.decimal;
    const sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    await depositCoin(txb, sui_pool, sui_deposit_coin_obj, amount_to_deposit);

    // 2. borrow USDC
    const amount_to_borrow = 0.043013 * 10**USDC.decimal; // 借出当前日期的USDC 0.[月][天][小时] 的 USDC 
    const usdc_pool: PoolConfig = pool[USDC.symbol as keyof Pool];
    const [usdc_borrow_coin_obj] = await borrowCoin(txb, usdc_pool, amount_to_borrow);

    // 3. deposit USDC
    await depositCoin(txb, usdc_pool, usdc_borrow_coin_obj, amount_to_borrow);

    const result = await SignAndSubmitTXB(txb, account.client, account.keypair);

    return result;
}

//console.log(client.accounts[0].getNAVIPortfolio())

operateNave().then(console.log).catch(console.error);

