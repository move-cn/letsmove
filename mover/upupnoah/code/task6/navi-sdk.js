import { NAVISDKClient } from 'navi-sdk'
import { Sui, NAVX, vSui, USDT, USDC, WETH, CETUS, haSui } from 'navi-sdk/dist/address.js';

const client = new NAVISDKClient({ mnemonic: "Mnemonic words", networkType: "mainnet", numberOfAccounts: 5 });
const account = client.accounts[0];
account.depositToNavi(Sui, 1e9);