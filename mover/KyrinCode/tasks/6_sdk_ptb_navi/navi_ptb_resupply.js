const { NAVISDKClient } = require("navi-sdk")
const { TransactionBlock } = require("@mysten/sui.js/transactions")
const { depositCoin, borrowCoin, SignAndSubmitTXB } = require("navi-sdk/dist/libs/PTB")
const { Sui, pool } = require("navi-sdk/dist/address")
const dotenv = require('dotenv')
dotenv.config()

const mnemonic = process.env.MNEMONIC
const client = new NAVISDKClient({
    mnemonic: mnemonic,
    networkType: "mainnet",
    numberOfAccounts: 1,
})
const account = client.accounts[0]

async function ptb_resupply() {    
    const txb = new TransactionBlock()
    txb.setSender(account.address)
    
    const coinObjects = await account.getCoins()
    console.log("coin objects:", coinObjects)
    if (!coinObjects.data[0]) {
        throw new Error("Insufficient balance")
    }
    
    // supply
    const supply_amount = 1e9 // 1 Sui
    const pool_sui = pool[Sui.symbol]
    const [supply_coin] = txb.splitCoins(txb.gas, [supply_amount])
    await depositCoin(txb, pool_sui, supply_coin, supply_amount)

    // borrow
    const borrow_amount = 0.5 * 1e9 // 0.5 Sui
    const [borrow_coin] = await borrowCoin(txb, pool_sui, borrow_amount)

    // resupply
    await depositCoin(txb, pool_sui, borrow_coin, borrow_amount)

    const result = await SignAndSubmitTXB(txb, account.client, account.keypair)
    console.log("result:", result)
}
  
ptb_resupply().catch((error) => {
    console.error(error)
    process.exitCode = 1
})