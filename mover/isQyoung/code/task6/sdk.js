import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'

const mnemonic = 'xxx' //填自己的助记词，省事很多
const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 }) //如果要随机生成，就删除这句代码中的mnemonic,
const account = client.accounts[0]//默认刚刚传入的地址
console.log(account)
async function main() {
    let result = await account.depositToNavi(Sui, 1)//(Sui, 1)这里面的数字，大点，0.几会报错
    console.log(result)
    result = await account.withdraw(Sui, 1)//(Sui, 1)这里面的数字，大点，0.几会报错
    console.log(result)
}

main()
