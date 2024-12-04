const { NAVISDKClient } = require("navi-sdk")
const { TransactionBlock } = require("@mysten/sui.js/transactions")
const { flashloan, repayFlashLoan, SignAndSubmitTXB } = require("navi-sdk/dist/libs/PTB")
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

async function ptb_flashloan() {
    let txb = new TransactionBlock()
    txb.setSender(account.address)

    const coinObjects = await account.getCoins(Sui)
    // const coin = txb.object(coinObjects.data[0].coinObjectId)
    const [coin] = txb.splitCoins(txb.gas, [0.1 * 10**Sui.decimal]) // if only one coin, split it first

    const flashloan_amount = 0.01 * 10**Sui.decimal // 1 Sui
    const pool_sui = pool[Sui.symbol]
    const [balance, receipt] = await flashloan(txb, pool_sui, flashloan_amount)

    // transfer to sender
    const flashloan_coin = txb.moveCall({
        target: '0x2::coin::from_balance',
        arguments: [balance],
        typeArguments: [pool_sui.type],
    })
    txb.mergeCoins(coin, [flashloan_coin])

    // repay
    const repay_balance = txb.moveCall({
        target: '0x2::coin::into_balance',
        arguments: [coin],
        typeArguments: [pool_sui.type],
    })
    const [remaining_balance] = await repayFlashLoan(txb, pool_sui, receipt, repay_balance)

    // transfer remaining to sender
    const remaining_coin = txb.moveCall({
        target: '0x2::coin::from_balance',
        arguments: [remaining_balance],
        typeArguments: [pool_sui.type],
    })
    txb.transferObjects([remaining_coin], account.address)

    const result = await SignAndSubmitTXB(txb, account.client, account.keypair)
    console.log("result:", result)
}

ptb_flashloan().catch((error) => {
    console.error(error)
    process.exitCode = 1
})