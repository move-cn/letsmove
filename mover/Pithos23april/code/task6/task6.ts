import {NAVISDKClient} from 'navi-sdk';
import {TransactionBlock} from "@mysten/sui.js/transactions";
import {depositCoin, SignAndSubmitTXB, borrowCoin} from 'navi-sdk/dist/libs/PTB';
import type {CoinInfo, Pool, PoolConfig} from "navi-sdk/dist/types";
import {pool} from 'navi-sdk/dist/address'
import {Sui} from 'navi-sdk/dist/address'
import {USDC} from "navi-sdk/dist/address.js";

async function transfer_to_navi_pool() {
    const mnemonic = process.env.MNEMONIC;
    const client = new NAVISDKClient({
        mnemonic: mnemonic,
        networkType: "mainnet", numberOfAccounts: 1
    });
    let txb = new TransactionBlock();
    const account = client.accounts[0];
    let sender = account.address;
    txb.setSender(sender);

    console.log(sender)

    const USDC_pool: PoolConfig = pool[USDC.symbol as keyof Pool];
    const amount2 = 0.050121 * 1e6;

    //1 supply an asset into NAVI
    let to_deposit_amount = 1 * 1e9;
    const to_deposit = txb.splitCoins(txb.gas, [txb.pure(to_deposit_amount)]);
    const to_deposit_coin: CoinInfo = Sui;
    const pool_to_deposit: PoolConfig = pool[to_deposit_coin.symbol as keyof Pool];

    await depositCoin(txb, pool_to_deposit, to_deposit, to_deposit_amount);

    const usdc_coin = await borrowCoin(txb, USDC_pool, amount2);
    const usdc_obj_id = "0xc863995323f5a3b6b577af17b4685fd98b365cc0902d13fd18d4fb6f5916ed44";
    txb.mergeCoins(txb.object(usdc_obj_id), usdc_coin);
    await depositCoin(txb, USDC_pool, txb.object(usdc_obj_id), amount2);

    txb.setGasBudget(100000000);
    const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
    console.log(result);
}

transfer_to_navi_pool();