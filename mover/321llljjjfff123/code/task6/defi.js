import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'
import fs from 'fs'


let words = ``

// 可以选择由html页面写入助记词

// fs.readFile('mnemonic.txt', 'utf8', (err, data) => {
//   if (err) {
//     console.error('Error reading mnemonic:', err)
//   } else {
//     words = data.trim()
//   }
// })

// 账户
const client = new NAVISDKClient({ mnemonic: words, networkType: "mainnet" })

// 地址
const account = client.accounts[0]


async function main () {
  let result = await account.depositToNavi(Sui, 1)//这的参数的数字，大点，0.几会报错
  console.log(result)
  result = await account.withdraw(Sui, 1)
  console.log(result)
}

// 1为存款
// 2为取款
main()