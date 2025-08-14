import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';

const client = new NAVISDKClient({mnemonic: '???', networkType: "mainnet"})
const account = client.accounts[0]
await account.depositToNavi(Sui, 1e9)