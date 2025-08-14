
import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {SignAndSubmitTXB} from 'navi-sdk/dist/libs/PTB/index.js'
const mnemonic = ""; //Replace with your mnemonic
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 5});

let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
txb.setSender(sender);

var x_CoinType = "0x2bb921b49d4f5acffd78b3a9bcb899a2d5125ef6e1f6cd2a931a0a2d35737a7c::justin_coin::JUSTIN_COIN";

txb.moveCall({
    target: `0x5a2be34793fdb369bd35940fca6ae19db9ce59797685df30c24754d605041b42::fantasyni_game::new_game`,
    arguments: [
        txb.pure(1), 
    ],
    typeArguments: [x_CoinType],
});

const result = await SignAndSubmitTXB(txb, account.client, account.keypair);
console.log("result: ", result);
