
'use strict';

import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin,withdrawCoin, borrowCoin, flashloan,repayFlashLoan, SignAndSubmitTXB, mergeCoins} from 'navi-sdk/dist/libs/PTB'
import { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, USDC } from 'navi-sdk/dist/address'

const mnemonic = "Test Mnemonic"; //Replace with your mnemonic
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});

//Set Up Zone
const toBorrowCoin = USDC;
const amount_to_borrow = 1 * 10**toBorrowCoin.decimal; //Borrow 1 USDC
//End of Set Up Zone



async function call_navi_sdk() {
    //For the following code, you can directly copy and paste it to your project
    // Initialize the TransactionBlock
    let txb = new TransactionBlock();
    const account = client.accounts[0];
    let sender = account.address;
    console.log(sender)
    txb.setSender(sender);

    //Get the object of the coin
    const sourceTokenObjAddress = await account.getCoins(toBorrowCoin);
    const sourceTokenObj = txb.object(sourceTokenObjAddress.data[0].coinObjectId);

    // Supported: Sui/NAVX/vSui/USDC/USDT/WETH/CETUS/HAsui, import from address file
    const Coin_Pool: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];
    const [balance, receipt] = await flashloan(txb, Coin_Pool, amount_to_borrow); // Flashloan 1 USDC

    //Transfer the flashloan money to the account
    const this_coin = txb.moveCall({
        target: '0x2::coin::from_balance',
        arguments: [balance],
        typeArguments: [Coin_Pool.type],
    });

    //Merge Coin to the wallet balance
    txb.mergeCoins(sourceTokenObj, [this_coin]);

    //Get the repayment object
    const repayBalance = txb.moveCall({
        target: '0x2::coin::into_balance',
        arguments: [sourceTokenObj],
        typeArguments: [Coin_Pool.type],
    });

    const [e_balance] = await repayFlashLoan(txb, Coin_Pool, receipt, repayBalance); // Repay with the balance

    //Extra token after repay
    const extra_coin = txb.moveCall({
        target: '0x2::coin::from_balance',
        arguments: [e_balance],
        typeArguments: [Coin_Pool.type],
    });

    //Transfer left_money after repay to the account
    txb.transferObjects([extra_coin], sender);
    const result = SignAndSubmitTXB(txb, account.client, account.keypair);
    console.log("result: ", result);

}



const res = call_navi_sdk();


res.then(result => {
    console.log('Finish with: ', result); // 'Finished'
  }).catch(e => {
    console.log(e);
});