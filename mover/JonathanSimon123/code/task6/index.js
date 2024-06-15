import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';

const mnemonic = 'Your Mnemonic';

const client = new NAVISDKClient({mnemonic, numberOfAccounts: 1});

const account = client.accounts[0];
/**
 * 将指定数量的给定硬币类型存入Navi。
 * @param coinType - 要存入的硬币类型。
 * @param amount - 要存入的金额。
 */
const depositRes = await account.depositToNavi(Sui, 1)
console.log(depositRes)
