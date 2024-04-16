import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'

// 钱包助记词
const mnemonic = ''
/**
 * 初始化 NAVISDKClient实例
 * @param mnemonic           可选 - 用于帐户生成的助记词短语。如果未提供，将生成新的助记词
 * @param networkType        可选 - 要使用的网络类型。默认为“mainnet”
 * @param wordLength         可选 - 要生成的助记词短语的长度。默认为 12
 * @param numberOfAccounts   可选 - 要生成的帐户数量。默认为 10。
 */
const client = new NAVISDKClient({ 
    mnemonic, 
    networkType: "mainnet", 
    numberOfAccounts: 1 
})

async function main() {

    // 获取所有账号
    const accounts = client.getAllAccounts()
    console.log('账号列表：', accounts)

    // 获取助记词
    const mnemonic = client.getMnemonic()
    console.log('助记词：', mnemonic)

    // 取第一个账号
    const account = accounts[0]
    // 查看账号余额
    await account.getWalletBalance(true)

    /**
     * 将指定数量的给定硬币类型存入Navi。
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