import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'

const mnemonic = ''
const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 })
const account = client.accounts[0]

async function main() {
    // 7FbXMNc6EFmPyFLvvmkGgc44oZpZmy86ZLGZQu9YPo4R
    // const r = await account.createAccountCap()
    // const r = await account.getCoins(coinType = '0x2::sui::SUI')
    // console.log(r)
    let result = await account.depositToNavi(Sui, 1e9)
    console.log(result)
    result = await account.withdraw(Sui, 1e9)
    console.log(result)
}

main()