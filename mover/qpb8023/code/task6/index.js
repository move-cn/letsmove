import { NAVISDKClient } from 'navi-sdk';
import { Sui } from 'navi-sdk/dist/address.js';

dotenv.config();

const run = async () => {
    try {
        const client = new NAVISDKClient({ mnemonic: 'xxx', networkType: "mainnet" });

        const account = client.accounts[0];

        await account.getWalletBalance(true);


        const depositRes = await account.depositToNavi(Sui, 1000000000);


    } catch (err) {
        console.log('[err]', err)
    }
}

run();