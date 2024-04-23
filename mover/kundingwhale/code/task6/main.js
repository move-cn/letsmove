import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';
import { promises as fs } from 'fs';

const client = new NAVISDKClient({mnemonic: '???', networkType: "mainnet"})
fs.writeFile('client.json', JSON.stringify(client));

