import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address';

const client = new NAVISDKClient({mnemonic: "<YOUR MNEMONIC WORDS>", networkType: "mainnet"})
const account = client.accounts[0]
await account.depositToNavi(Sui, 1e9)
