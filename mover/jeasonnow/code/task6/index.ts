import {NAVISDKClient} from 'navi-sdk';
import {Sui} from 'navi-sdk/dist/address';

const address = "0x4911dde26fdebbc6c12acb1a8c3927e3e58f8066ee2775ac6fda1edd71d7148f";

async function init() {
    const mnemonic = "It's None";
    const client = new NAVISDKClient({
        mnemonic,
        networkType: 'mainnet'
    });
    
    const account = client.accounts[0];
    
    console.log(account.getAllCoins());
    const amount = 0.99 * 1e9;
    
    const depositRes = await account.depositToNavi(Sui, amount);
    console.log("depositRes", depositRes);

    const withdrawRes = await account.withdraw(Sui, amount);
    console.log("withdrawRes", withdrawRes);
    
    account.sendCoin(Sui, address, amount).then(() => {
        console.log(`Sent ${amount} Sui to ` + address);
    });
}

init();


