const { NAVISDKClient } = require("navi-sdk")
const { Sui, USDC } = require("navi-sdk/dist/address")
const dotenv = require('dotenv')
const dayjs = require('dayjs');

dotenv.config()

const mnemonic = process.env.WALLET_MNEMONIC
const client = new NAVISDKClient({
    mnemonic: mnemonic,
    networkType: "mainnet",//mainnet
    numberOfAccounts: 1,
})
const account = client.accounts[0]

async function getWalletBalance() {
    let balance = await account.getWalletBalance(true)
    console.log("wallet balance: ", balance)
}

function getBorrowAmount(){
    let s= dayjs().format("MMDDHH");
    const floatNumber = parseFloat("0.".concat(s));
    return floatNumber;
}

async function supplySui(amount) {
    const supplyRes = await account.depositToNavi(Sui, amount)
    console.log("supply result:", supplyRes)
}

async function borrowUSDC(amount) {
    const borrowRes = await account.borrow(USDC, amount)
    console.log("borrow result:", borrowRes)
}

async function repayUSDC(amount) {
    const repayRes = await account.repay(USDC, amount)
    console.log("repay result:", repayRes)
}

async function withdrawSui(amount) {
    const withdrawRes = await account.withdraw(Sui, amount)
    console.log("withdraw result:", withdrawRes)
}

async function main() {
    await getWalletBalance()
    await supplySui(1e9) // 1 Sui
    const amount=getBorrowAmount()
    await borrowUSDC(amount * 1e6) // 0.01 USDC
    await repayUSDC(0.01 * 1e6) // 0.01 USDC
    await withdrawSui(1e9) // 1 Sui
}

main().catch((error) => {
    console.error(error)
    process.exitCode = 1
})