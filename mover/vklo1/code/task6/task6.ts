
import { NAVISDKClient } from 'navi-sdk'
import {Sui} from 'navi-sdk/dist/address';

const mnemonic = ""
const client = new NAVISDKClient({mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1});
const account = client.accounts[0];
console.log(client.getMnemonic());
console.log(account.address);
const balanceMap = account.getWalletBalance()
balanceMap.then((res) => {
    console.log(res);
})
const amount=1000000000
const infor = account.depositToNavi(Sui, amount)
console.log(infor);
balanceMap.then((res) => {
    console.log(res);
})
// account.withdraw(NAVX, amount)
// 18.182927132