import { NAVISDKClient } from 'npm:navi-sdk'
import { TransactionBlock } from "npm:@mysten/sui.js/transactions";
import { depositCoin, borrowCoin, SignAndSubmitTXB } from 'npm:navi-sdk/dist/libs/PTB/index.js'
import { CoinInfo, Pool, PoolConfig } from "npm:navi-sdk/dist/types";
import { pool, USDC, Sui } from 'npm:navi-sdk/dist/address.js'

async function task6() {
    const mnemonic = Deno.env.get("KEY");
    const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 }); 

    const txb = new TransactionBlock();
    const account = client.accounts[0];
    const allcoins=await account.getCoins(Sui);
    console.log(allcoins);
    const sender = account.address;
    console.log(sender)
    txb.setSender(sender);
    txb.setGasBudget(800000000);

    //1
    const amount_to_deposit = 1 * 10**Sui.decimal;
    const sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const [to_deposit] = txb.splitCoins(txb.gas, [amount_to_deposit]);
    depositCoin(txb, sui_pool, to_deposit, amount_to_deposit);
    console.log("deposit SUI");

    //2
    const usdc_pool: PoolConfig = pool[USDC.symbol as keyof Pool];
    const toBorrowCoin: CoinInfo = USDC;
    const amount_to_borrow = 0.080301 * 10**toBorrowCoin.decimal;
    const [usdc_borrow_coin_obj] =await borrowCoin(txb, usdc_pool, amount_to_borrow);
    console.log("Borrow USDC");

    //3
    depositCoin(txb, usdc_pool, usdc_borrow_coin_obj, amount_to_borrow);
    console.log("deposit USDC");

    const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
    return result;
}
task6().then((re)=>{
    console.log("result = " + re);
})

