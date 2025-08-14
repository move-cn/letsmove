const {NAVISDKClient} = require('navi-sdk')
const {Sui} = require('navi-sdk/dist/address')

async function main() {
    const MNEMONIC = 'xxx'
    // const client = new NAVISDKClient({mnemonic: MNEMONIC, networkType: "testnet"})
    const client = new NAVISDKClient({mnemonic: MNEMONIC, networkType: "mainnet"})

    const account = client.accounts[0];
    console.log(account.address)

    const result = await account.depositToNavi(Sui, 1e9)
    console.log(result)
}

main()

