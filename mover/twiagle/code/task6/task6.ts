import { Sui, pool } from 'navi-sdk/dist/address';
import { Pool, PoolConfig } from "navi-sdk/dist/types"
import { NAVISDKClient } from 'navi-sdk';
// import { depositCoin, SignAndSubmitTXB } from 'navi-sdk/src/libs/PTB/index'
// import { TransactionBlock } from "@mysten/sui.js/transactions";
// import { getFullnodeUrl, SuiClient } from '@mysten/sui.js/client';
// import { Ed25519Keypair } from '@mysten/sui.js/keypairs/ed25519';

const useSDK = async () => {
    const mnemonic = ""
    const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 });
    // console.log(client);

    const accounts = client.getAllAccounts()
    // console.log(accounts);
    const account = accounts[0];
    console.log(account);
    const deposit_result = await account.depositToNavi(Sui, 1);
    console.log(deposit_result);

    const withdraw_result = await account.withdraw(Sui, 1 * 1e9);
    console.log(withdraw_result)
};

// const useSDKPtb = async () => {
//     const mnemonic = "";
//     const sui_coin_obj = "";
//     const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 });
//     const accounts = client.getAllAccounts()
//     const account = accounts[0];
//     let sender = account.address;
//     let txb = new TransactionBlock();
//     txb.setSender(sender);
//     txb.setGasBudget(1000000000);

//     const sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];
//     // depositCoin(txb, sui_pool, txb.object(sui_coin_obj), 1 * 1e9);
//     // SignAndSubmitTXB(txb, client, account.keypair);
// }

// const usePtb = async () => {
//     const rpcUrl = getFullnodeUrl('mainnet');
//     const client = new SuiClient({ url: rpcUrl });
//     const exampleMnemonic = '';

//     const keypair = Ed25519Keypair.deriveKeypair(exampleMnemonic);
//     const txb = new TransactionBlock();
//     // 如果没有SDK的话，可以从exployer找到这些参数发送moveCall
//     //entry public entry_withdraw<Ty0>(Arg0: &Clock, Arg1: &PriceOracle, Arg2: &mut Storage, Arg3: &mut Pool<Ty0>, Arg4: u8, Arg5: u64, Arg6: &mut Incentive, Arg7: &mut Incentive, Arg8: &mut TxContext) {
//     txb.moveCall({
//         target: '0xc6374c7da60746002bfee93014aeb607e023b2d6b25c9e55a152b826dbc8c1ce::example::receive_object',
//         arguments: [],
//     });
//     client.signAndExecuteTransactionBlock({ signer: keypair, transactionBlock: txb });
// }
useSDK();