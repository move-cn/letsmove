import { NAVISDKClient } from 'navi-sdk';
import { Sui } from 'navi-sdk/dist/address.js';
import { promises as fs } from 'fs';

async function initClient() {
    const fileContent = await fs.readFile('client.json');
    const config = JSON.parse(fileContent);
    const client = new NAVISDKClient(config);
    const account = client.accounts[0]
    const deposit = await account.depositToNavi(Sui, 1e9)
    console.log(deposit)
}

initClient();