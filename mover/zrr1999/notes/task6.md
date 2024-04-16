# Task 6 - 用 Sui SDK 和 Navi SDK 在 Navi Protocol 存入 1 SUI

这个任务需要使用 TypeScript 开发，这里我使用 bun（一个 node.js 的竞品）。

## 获取助记词
我们通过下面的方式创建钱包并获取助记词（注意文档中`mnemonic=""`的方式并不行，这里需要设置为`undifined`或留空）
```ts
const client = new NAVISDKClient({ mnemonic: undifined, networkType: "mainnet", numberOfAccounts: 1 });
let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
console.log(sender);
```

把打印出来的助记词保存起来并存到环境变量（注意要需要确保你的电脑是私有且安全的，因为这会让你的助记词显示在命令历史中，任何有权限的用户或管理员都可以看到）
```ts
export MNEMONIC=<your mnemonic>
```
然后修改源码内容到，当然你如果本身就有助记词可以跳过第一步，也就是直接使用现在的代码
```ts
const mnemonic = process.env.MNEMONIC;
const client = new NAVISDKClient({ mnemonic: undifined, networkType: "mainnet", numberOfAccounts: 1 });
let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
console.log(sender);
```

设置 `source_sui_id`，这个可以在你的账户中的 `SUI` 币里面找到，复制相应的 `object_id`，你可能有多个，只需要复制其中余额大于1的，
账户如果没有余额，可以通过发送`SUI`到前面打印出来的 `sender` 地址中获得，注意要预留一些 `gas`，建议直接转 2 `SUI`。
```ts
const source_sui_id = "0xd42a39bd656ceac8c2e4ddc7440d7163e335d84759b652eaa468db25025811e1"
```

完整代码如下
```ts
import { NAVISDKClient } from 'navi-sdk';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { depositCoin, withdrawCoin, SignAndSubmitTXB, } from 'navi-sdk/dist/libs/PTB';
import type { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import { Sui } from 'navi-sdk/dist/address'

// 读取环境变量 MNEMONIC
const mnemonic = process.env.MNEMONIC;
const client = new NAVISDKClient({ mnemonic: mnemonic, networkType: "mainnet", numberOfAccounts: 1 });

// Initialize the TransactionBlock
let txb = new TransactionBlock();
const account = client.accounts[0];
let sender = account.address;
console.log(sender);
txb.setSender(sender);

const source_sui_id = "0xd42a39bd656ceac8c2e4ddc7440d7163e335d84759b652eaa468db25025811e1";

// Supported: Sui/NAVX/vSui/USDC/USDT/WETH/CETUS/HAsui, import from address file
const SUI_pool: PoolConfig = pool[Sui.symbol as keyof Pool];

const amount = 1 * 1e9; //Borrow 1 Sui
//Deposit 1 Sui to NAVI Protocol
depositCoin(txb, SUI_pool, txb.object(source_sui_id), amount);

//Withdraw 1 Sui from NAVI Protocol
withdrawCoin(txb, SUI_pool, amount);

txb.setGasBudget(800000000);
const result = SignAndSubmitTXB(txb, account.client, account.keypair);
```
