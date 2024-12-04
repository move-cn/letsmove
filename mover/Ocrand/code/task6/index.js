import { NAVISDKClient } from "navi-sdk";
import { Sui } from "navi-sdk/dist/address.js";

// 钱包助记词，这里用主网钱包
const mnemonic = "";
console.log("本地助记词：", mnemonic);
//  NAVISDKClient 实例
const client = new NAVISDKClient({
  mnemonic,
  networkType: "mainnet",
  numberOfAccounts: 1,
});

async function main() {
  const accounts = client.getAllAccounts();
  console.log("账号列表：", accounts);
  const account = accounts[0];
  await account.getWalletBalance(true);

  // 存
  const depositRes = await account.depositToNavi(Sui, 1);
  console.log(depositRes);

  // 提
//   const withdrawRes = await account.withdraw(Sui, 1);
//   console.log(withdrawRes);
}

main();