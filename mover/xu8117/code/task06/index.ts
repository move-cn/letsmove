import {NAVISDKClient} from 'navi-sdk'
import {TransactionBlock} from "@mysten/sui.js/transactions";
import {borrowCoin, depositCoin, SignAndSubmitTXB} from 'navi-sdk/dist/libs/PTB'
import {Pool, PoolConfig} from "navi-sdk/dist/types";
import {pool, Sui, USDC} from 'navi-sdk/dist/address'
import dayjs = require("dayjs");

const mnemonic = "";
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: 'mainnet', wordLength: 12});
const account = client.accounts[0];
const sender = account.address;

function test() {
    account.getCoins().then(resp => {
        console.log(resp)
    }).catch(e => {
        console.log(e)
    });
}

function test_dayjs() {
    let s = dayjs().format("MMDDHH");
    let borrow_float = parseFloat("0.".concat(s));
    let borrow_amount = borrow_float * 1e6;
    console.log(borrow_float);
    console.log(borrow_amount);
}

async function deposit_borrow_resupply() {
    let txb: TransactionBlock = new TransactionBlock();
    txb.setSender(sender);

    let getCoinInfo = await account.getCoins();
    if (!getCoinInfo.data[0]) {
        throw new Error("Insufficient balance");
    }

    let deposit_amount = 1e9;
    let sui_symbol = Sui.symbol;
    const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];
    const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
    await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

    let s = dayjs().format("MMDDHH");
    let borrow_float = parseFloat("0.".concat(s));
    let borrow_amount = borrow_float * 1e6;

    let usdc_symbol = USDC.symbol;
    const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
    const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);

    await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);

    return SignAndSubmitTXB(txb, account.client, account.keypair);
}


function call_deposit_borrow_resupply() {
    deposit_borrow_resupply().then((res) => {
        console.log("deposit&borrow transaction digest: " + res.digest);
        console.log(res.effects.status);
    }).catch(e => {
        console.log(e)
    });
}

function main() {
    // test();
    // test_dayjs();
    call_deposit_borrow_resupply();
}

main()