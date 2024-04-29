import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'

// 钱包助记词
const mnemonic = ''

const client = new NAVISDKClient({
    mnemonic,
    networkType: "mainnet",
    numberOfAccounts: 1
})

async function main() {

    // 获取所有账号
    const accounts = client.getAllAccounts()
    console.log('账号列表：', accounts)

    // 取第一个账号
    const account = accounts[0]
    // 查看账号余额
    await account.getWalletBalance(true)

    /**
     * 将指定数量的给定硬币类型存入 Navi。
     * @param coinType - 要存入的硬币类型。
     * @param amount - 要存入的金额。
     */
    const depositRes = await account.depositToNavi(Sui, 1)
    console.log(depositRes)

    /**
     * 提取指定数量的硬币。
     * @param coinType - 要取出的硬币类型。
     * @param amount - 要取出的金额。
     */
    const withdrawRes = await account.withdraw(Sui, 1)
    console.log(withdrawRes)
}

main()