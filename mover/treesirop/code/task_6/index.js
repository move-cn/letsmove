import { NAVISDKClient } from "navi-sdk";
import { Sui, NAVX } from "navi-sdk/dist/address.js";

const mnemonic = "";

const client = new NAVISDKClient({
  mnemonic: mnemonic,
  networkType: "mainnet",
  numberOfAccounts: 1,
});
const account = client.accounts[0];

const amount = 1e9;

account.depositToNavi(Sui, amount);
