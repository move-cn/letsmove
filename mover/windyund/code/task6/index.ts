import { NAVISDKClient } from "navi-sdk";
import { Sui } from "navi-sdk/dist/address";

async function main() {
  // Use an existing mnemonic or leave empty to generate a new one
  // const client = new NAVISDKClient({ networkType: "mainnet", numberOfAccounts: 1 ,"wordLength":12});

  const mnemonic = "your mnemonic here";
  const client = new NAVISDKClient({
    mnemonic: mnemonic,
    networkType: "mainnet",
    numberOfAccounts: 1,
  });

  const accounts = client.getAllAccounts();
  console.log("accounts: ", accounts);

  // get first account
  const account = accounts[0];
  // get wallet balance
  let balance = await account.getWalletBalance(true);
  console.log("wallet balance: ", balance);
  // deposit
  const depositRes = await account.depositToNavi(Sui, 1);
  console.log("deposit res: ", depositRes);

  // withdraw
  const withdrawRes = await account.withdraw(Sui, 1);
  console.log(withdrawRes);
}
main();
