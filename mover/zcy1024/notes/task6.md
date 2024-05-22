1. 创建并初始化

```bash
mkdir task6_sui_to_navi
cd task6_sui_to_navi
pnpm init
pnpm add -D @mysten/sui.js
pnpm add -D navi-sdk
```

在`package.json`中必须添加`"type": "module"`，否则会报相关的错。

2. 代码

`touch index.js`

```js
import { NAVISDKClient } from 'navi-sdk'
import { Sui } from 'navi-sdk/dist/address.js';

const mnemonic = 'if you want to try it then try it it is ok';

const client = new NAVISDKClient({mnemonic, numberOfAccounts: 1});

// console.log(client.getAllAccounts());

const account = client.accounts[0];

// console.log(account.getAllCoins());

let amount = 1e9;
account.depositToNavi(Sui, amount);
// console.log(account.depositToNavi(Sui, amount));
```

3. 运行

`node index.js`

or

如果你在`package.json`中的`scripts`添加了`"start": "node index.js"`，那么也可以通过`pnpm run start`来运行。

4. 交易查询

当你的助记词没问题 ~~（不会真有人直接复制吧）~~，同时钱包里余额充足的时候（这笔交易消耗了我将近0.2Sui，所以最好确保余额有1.2Sui以上），就可以去自己钱包查询（我这里使用的是Chrome的插件查询交易，通过package id进入浏览器即可查看更详细的信息，包括本任务所需要的hash）。
