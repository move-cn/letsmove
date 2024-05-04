import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'

// 自己钱包的助记词
const words = ``

// 账户
const client = new NAVISDKClient({mnemonic: words, networkType: "mainnet"})

// 地址
const account = client.accounts[0]

const main = async () => {
    try{
        console.log(`account address is:${account.address}`)
        // 存钱
        let res = await account.depositToNavi(Sui, 1)
        console.log(res)
        // 取钱
        res  = await account.withdraw(Sui, 1)
        console.log(res)
    }catch(e){
        console.error(e)
    }
}

main()