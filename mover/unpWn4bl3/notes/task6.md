# 什么是NAVI
NAVI是一个流动性协议，提供存储/取回/借贷等服务

# 如何交互
使用NAVI的官方SDK

首先安装npm包
```bash
npm i navi-sdk
```

```javascript
// 使用助记词生成客户端，并获得对应的账号
const mnemonic = ''; // Use an existing mnemonic or leave empty to generate a new one
const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 1});
const account = client.accounts[0];
// 创建账号的Account Cap，方便多种管理模式
account1.createAccountCap();
// 向NAVI Protocol存入Sui
import { Sui } from 'navi-sdk/dist/address.js'
account.depositToNavi(Sui, 1e9)
// 取出存入NAVI Protocol的Sui
account.withdraw(Sui, 1e9)
```