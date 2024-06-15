
import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { SignAndSubmitTXB, mergeCoins } from 'navi-sdk/dist/libs/PTB/index.js'
import { SUI_CLOCK_OBJECT_ID } from "@mysten/sui.js/utils";
const mnemonic = ""; //Replace with your mnemonic
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 5});

let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
txb.setSender(sender);

var x_CoinType = "0x2bb921b49d4f5acffd78b3a9bcb899a2d5125ef6e1f6cd2a931a0a2d35737a7c::justin_coin::JUSTIN_COIN";
var gameObjectId = "0x2fac00b61c62d13da5e2641eb130333d74725b37ed1ba031912ca6c832a1dcab";
var weather_oracle_id = "0x1aedcca0b67b891c64ca113fce87f89835236b4c77294ba7e2db534ad49a58dc";

const x_coins = await account.getCoins(x_CoinType);
const x_coin = await mergeCoins(txb, x_coins);
let [insert_x_coin] = txb.splitCoins(x_coin, [1_000_000_00]);

let [ticket, open_hunt] = txb.moveCall({
    target: `0x5a2be34793fdb369bd35940fca6ae19db9ce59797685df30c24754d605041b42::fantasyni_game::insert_coin`,
    arguments: [
        txb.object(gameObjectId),
        insert_x_coin 
    ],
    typeArguments: [x_CoinType],
});

if (open_hunt) {
    txb.moveCall({
        target: `0x5a2be34793fdb369bd35940fca6ae19db9ce59797685df30c24754d605041b42::fantasyni_game::open_ticket_end`,
        arguments: [
            ticket,
            txb.object(gameObjectId),
            txb.object(weather_oracle_id),
            txb.object(SUI_CLOCK_OBJECT_ID),
        ],
        typeArguments: [x_CoinType],
    });
}

const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result: ", result);
