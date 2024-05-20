import { NAVISDKClient } from 'navi-sdk'
import {Sui,  USDC,pool} from 'navi-sdk/dist/address';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SignAndSubmitTXB,depositCoin,borrowCoin} from 'navi-sdk/dist/libs/PTB'
import { PoolConfig, Pool } from 'navi-sdk/dist/types';

const mnemonic = "";

const client = new NAVISDKClient({mnemonic, networkType: 'mainnet', numberOfAccounts: 5}); 

let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
console.log(sender)
txb.setSender(sender);
txb.setGasBudget(500000000);

(async () => {
    let suiDepositAmount = 1e9;
    const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const [suiToDeposit] = txb.splitCoins(txb.gas, [suiDepositAmount]);
    // 1. 存入1SUI
    await depositCoin(txb, suiPool, suiToDeposit, suiDepositAmount);
    let targetUsdcAmount = 0.051315 * 1e6;
    const usdcPool: PoolConfig = pool[USDC.symbol as keyof Pool];
    // 2.借出目标值
    const [usdcCoin] = await borrowCoin(txb, usdcPool, targetUsdcAmount);     
    // 3.存入目标值
    await depositCoin(txb, usdcPool, usdcCoin, targetUsdcAmount);
    // mainnet digest：AVmu5BdjHg3UAxDzKHcQUvzX8vTRn3bod1Sw4gnK5NHq
    SignAndSubmitTXB(txb, account.client, account.keypair).then((res)=> {
        console.log(res);
    });
})();
