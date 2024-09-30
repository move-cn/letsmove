import { NAVISDKClient } from "navi-sdk";
import { Sui } from "navi-sdk/dist/address.js";

// 钱包助记词，这里用主网钱包
const mnemonic = "";

//  NAVISDKClient 实例
const client = new NAVISDKClient({
  mnemonic,
  networkType: "mainnet",
  numberOfAccounts: 1,
});

async function main() {
  // 获取所有账号
  const accounts = client.getAllAccounts();
  console.log("账号列表：", accounts);

  // 取第一个账号
  const account = accounts[0];
  // 查看账号余额
  await account.getWalletBalance(true);

  // 存款
  const depositRes = await account.depositToNavi(Sui, 1);
  console.log(depositRes);

  // 提现
  const withdrawRes = await account.withdraw(Sui, 1);
  console.log(withdrawRes);
}

main();
