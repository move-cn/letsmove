import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js'

const mnemonic = ''
const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1 })
const account = client.accounts[0]
console.log(account)
async function main() {
	let result = await account.depositToNavi(Sui, 1)
	console.log(result)
	result = await account.withdraw(Sui, 1)
	console.log(result)
}

main()