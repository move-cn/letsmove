const { NAVISDKClient } = require('navi-sdk');
const {Sui,USDC, pool} = require('navi-sdk/dist/address');
const {TransactionBlock} = require("@mysten/sui.js/transactions");
const {depositCoin, borrowCoin, SignAndSubmitTXB} = require('navi-sdk/dist/libs/PTB');

async function main() {
    const mnemonic = '';
    const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 5}); 
    const account = client.accounts[0];
    let txb = new TransactionBlock();
    const sender = account.address;
    txb.setSender(sender);
    const sui_pool = pool[Sui.symbol];
    const usdc_pool = pool[USDC.symbol];

    const deposit_amount = 1e9;
    const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
    await depositCoin(txb, sui_pool, to_deposit, deposit_amount);

    const currentDate = new Date();
    const month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
    const day = ('0' + currentDate.getDate()).slice(-2);
    const hour = ('0' + currentDate.getHours()).slice(-2);
    const borrow_amount = Number(`0.${month}${day}${hour}`) * 1e6;

    const [borrow_coin] = await borrowCoin(txb, usdc_pool, borrow_amount); 
    await depositCoin(txb, usdc_pool, borrow_coin, borrow_amount);

    const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
    console.log("result: ", result);

}

main()