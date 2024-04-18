import { Sui, pool } from 'navi-sdk/dist/address';
import { Pool, PoolConfig } from "navi-sdk/dist/types"
import { NAVISDKClient } from 'navi-sdk';
import { depositCoin, SignAndSubmitTXB } from 'navi-sdk/src/libs/PTB/index'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { getFullnodeUrl, SuiClient } from '@mysten/sui.js/client';
import { Ed25519Keypair } from '@mysten/sui.js/keypairs/ed25519';

// 方式一：根据SDK文档
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
};

// 方式二：打开depositToNavi源码可以看到，用sui ptb和depositCoin方法, 所以整个流程如下
const useSDKPtb = async () => {
    const mnemonic = "";
    const amount = 1 * 1e9;
    const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 });
    const accounts = client.getAllAccounts()
    const account = accounts[0];
    let sender = account.address;

    let txb = new TransactionBlock();
    txb.setSender(sender);
    txb.setGasBudget(1000000000);
    const [to_deposit] = txb.splitCoins(txb.gas, [amount]);
    const sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    await depositCoin(txb, sui_pool, to_deposit, amount);
    SignAndSubmitTXB(txb, client, account.keypair);
}
// 方式三：继续打开depositCoin方法，同时找到合约入口   
//entry public entry_withdraw<Ty0>(Arg0: &Clock, Arg1: &PriceOracle, Arg2: &mut Storage, Arg3: &mut Pool<Ty0>, Arg4: u8, Arg5: u64, Arg6: &mut Incentive, Arg7: &mut Incentive, Arg8: &mut TxContext)
const usePtb = async () => {
    const exampleMnemonic = '';
    const amount = 1 * 1e9;
    const rpcUrl = getFullnodeUrl('mainnet');
    const client = new SuiClient({ url: rpcUrl });
    const keypair = Ed25519Keypair.deriveKeypair(exampleMnemonic);
    const txb = new TransactionBlock();
    txb.setSender(keypair.getPublicKey.toString());
    txb.setGasBudget(1000000000); 
    const [to_deposit] = txb.splitCoins(txb.gas, [amount]);
    const sui_pool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const config = {
        ProtocolPackage: '0xc6374c7da60746002bfee93014aeb607e023b2d6b25c9e55a152b826dbc8c1ce',
        StorageId: '0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe',
        Incentive: '0xaaf735bf83ff564e1b219a0d644de894ef5bdc4b2250b126b2a46dd002331821',
        IncentiveV2: '0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c', // The new incentive version: V2
        PriceOracle: '0x1568865ed9a0b5ec414220e8f79b3d04c77acc82358f6e5ae4635687392ffbef',
        ReserveParentId: '0xe6d4c6610b86ce7735ea754596d71d72d10c7980b5052fc3c8cdf8d09fea9b4b', // get it from storage object id. storage.reserves
        uiGetter: '0x1ee4061d3c78d6244b5f32eb4011d081e52f5f4b484ca4a84de48b1146a779f7',
    }

    txb.moveCall({
        target: `${config.ProtocolPackage}::incentive_v2::entry_deposit`,
        arguments: [
            txb.object('0x06'), // clock object id
            txb.object(config.StorageId), // object id of storage
            txb.object(sui_pool.poolId), // pool id of the asset
            txb.pure(sui_pool.assetId), // the id of the asset in the protocol
            to_deposit, // the object id of the Coin you own.
            txb.pure(amount), // The amount you want to deposit, decimals must be carried, like 1 sui => 1000000000
            txb.object(config.Incentive),
            txb.object(config.IncentiveV2), // The incentive object v2
        ],
        typeArguments: [sui_pool.type]
    })
    client.signAndExecuteTransactionBlock({ signer: keypair, transactionBlock: txb });
}

useSDK();