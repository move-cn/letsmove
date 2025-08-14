
import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin,withdrawCoin, borrowCoin, flashloan,repayFlashLoan, SignAndSubmitTXB, mergeCoins} from 'navi-sdk/dist/libs/PTB'
import { CoinInfo, Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, USDC } from 'navi-sdk/dist/address'

const mnemonic = "<Your mnemonic>"; //Replace with your mnemonic
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});

async function call_navi_sdk() {
    
    //For the following code, you can directly copy and paste it to your project
    // Initialize the TransactionBlock
    let txb = new TransactionBlock();
    const account = client.accounts[0];

    const allPortfolios = await client.getAllNaviPortfolios();
    console.log(allPortfolios);
    
    let sender = account.address;
    console.log(sender)
    txb.setSender(sender);
    txb.setGasBudget(500000000);
    
    const deposit_coin = txb.object("0x07217e4b7d4da36302d298737f2995721e282a87b8f5ea3bf3db16c2d36d5d7a");
    
    //// deposit 1 Sui
    const Sui_Pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    await depositCoin(txb, Sui_Pool, deposit_coin, 1e9);

    // borrow USDC
    // Supported: Sui/NAVX/vSui/USDC/USDT/WETH/CETUS/HAsui, import from address file
    const amount_to_borrow = 0.042720 * 10**USDC.decimal; //[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]

    const USDC_Pool = pool[USDC.symbol as keyof Pool];
    const [borrow_coin] = await borrowCoin(txb, USDC_Pool, amount_to_borrow);
    
    // deposit borrowed USDC
    //Get the object of the coin
    const sourceTokenObjAddress = await account.getCoins(USDC);
    const sourceTokenObj = txb.object(sourceTokenObjAddress.data[0].coinObjectId);

    txb.mergeCoins(sourceTokenObj, [borrow_coin]);

    await depositCoin(txb, USDC_Pool, sourceTokenObj, amount_to_borrow);
  
    const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
    console.log("result: ", result);
    
}

const res = call_navi_sdk();


res.then(result => {
    console.log('Finish with: ', result); // 'Finished'
  }).catch(e => {
    console.log(e);
});