const {NAVISDKClient} =require("navi-sdk")
const { USDC,Sui } = require('navi-sdk/dist/address')
async function start(){
const mnemonic = ''; // Use an existing mnemonic or leave empty to generate a new one
const client = new NAVISDKClient({mnemonic,networkType: "mainnet", numberOfAccounts: 5}); 
const account = client.accounts[0]
console.log(await account.depositToNavi(Sui,amount));
}

(async () => {
    await start();
})();
