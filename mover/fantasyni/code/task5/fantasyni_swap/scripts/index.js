
import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {SignAndSubmitTXB, mergeCoins} from 'navi-sdk/dist/libs/PTB/index.js'
const mnemonic = ""; //Replace with your mnemonic
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 5});

let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
txb.setSender(sender);

var x_CoinType = "0x2bb921b49d4f5acffd78b3a9bcb899a2d5125ef6e1f6cd2a931a0a2d35737a7c::justin_coin::JUSTIN_COIN";
var y_CoinType = "0x2bb921b49d4f5acffd78b3a9bcb899a2d5125ef6e1f6cd2a931a0a2d35737a7c::justin_faucet_coin::JUSTIN_FAUCET_COIN";

var poolObjectId = "0x87ebc83c7c2a10cbf5ead06f53ba3e25f37fb9b74eb595fd2c5c3c60c1d79c5f";

const y_coins = await account.getCoins(y_CoinType);
const y_coin = await mergeCoins(txb, y_coins);
let [deposit_y_coin] = txb.splitCoins(y_coin, [1_000_000_00]);

txb.moveCall({
    target: `0x6ff4219ee3d769b8f24fbc6d0324730d44d79c50cb1e9fc7c643daef2eb8755e::fantasyni_swap::deposit_coin`,
    arguments: [
        txb.object(poolObjectId), 
        deposit_y_coin
    ],
    typeArguments: [y_CoinType],
});

const x_coins = await account.getCoins(x_CoinType);
const x_coin = await mergeCoins(txb, x_coins);
let [swap_x_coin] = txb.splitCoins(x_coin, [1_000_000_00]);

txb.moveCall({
    target: `0x6ff4219ee3d769b8f24fbc6d0324730d44d79c50cb1e9fc7c643daef2eb8755e::fantasyni_swap::swap_x_y`,
    arguments: [
        txb.object(poolObjectId), 
        swap_x_coin
    ],
    typeArguments: [x_CoinType, y_CoinType],
});

const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result: ", result);
