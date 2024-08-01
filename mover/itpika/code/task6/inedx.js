const navi = require('navi-sdk');
const ptb = require('navi-sdk/dist/libs/PTB');
const { TransactionBlock } = require("@mysten/sui.js/transactions");

const { pool, USDC } = require('navi-sdk/dist/address');

(async() => {
    let cli = new navi.NAVISDKClient({
        mnemonic: "oxygen live segment arrange divide snack nuclear stand cherry family travel doll", 
        wordLength: 12, networkType: 'mainnet', numberOfAccounts: 2
    });
    let acc = cli.accounts[0];
    console.log('addr', acc.address);
    let bal = await acc.getWalletBalance();
    
    console.log('balance', bal);
    console.log('balance', (await acc.getCoins('0x2::sui::SUI')));

    let txb = new TransactionBlock();
    txb.setSender(acc.address);

    let USDC_pool = pool.USDC;

    let num = 71614;
    await ptb.depositCoin(txb, pool.Sui, txb.object('0x6f335bbf219b0d9184b490c8c8605f44978d7d949be84754fbae2828d231149d'), 1000000000);
    let val = await ptb.borrowCoin(txb, pool.USDC, num);
    console.log('val', val);
    console.log('deposit', await ptb.depositCoin(txb, pool.USDC, val[0], num))
    
    
    txb.setGasOwner(acc.address);
    // txb.setGasBudget(1000000);
    txb.setGasPayment([{digest: '7vBxYwq3hibiikAWeGTMmigv6gV84spnpYXysvPH8RXD', objectId: '0xf641ce879fc91c7a9bfb8b93fbc5cf67c8328ae3b4ac008958fd865e9f0b002f', version: 300644501}])
    
    let ret = await ptb.SignAndSubmitTXB(txb, acc.client, acc.keypair);
    console.log(ret);
})();

