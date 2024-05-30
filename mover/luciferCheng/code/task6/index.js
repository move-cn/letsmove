import { NAVISDKClient } from "navi-sdk";
import { Sui, NAVX } from "navi-sdk/dist/address.js";
import dotenv from "dotenv";

dotenv.config()

const mnemonic = process.env["mnemonic"] || undefined;

const client = new NAVISDKClient({
  mnemonic: mnemonic,
  networkType: "mainnet",
  numberOfAccounts: 1,
});
const account = client.accounts[0];
// 查看账户
console.log(account.address);
console.log(client.getAllAccounts());

// 查看账户余额
console.log(await account.getAllCoins())

// 存钱
const amount = 1e9;
await account.depositToNavi(Sui, amount);

// 再查看账户余额
console.log(await account.getAllCoins())