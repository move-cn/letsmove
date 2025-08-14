import { NAVISDKClient } from "navi-sdk";
import { Sui } from "navi-sdk/dist/address.js";

// 助记词
const mnemonic = "";

const client = new NAVISDKClient({
  mnemonic: mnemonic,
  networkType: "mainnet",
  numberOfAccounts: 1,
});
const account = client.accounts[0];

account.depositToNavi(Sui, 1e9);
