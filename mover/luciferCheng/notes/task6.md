# Task 6 - navi SDK

## 新建项目
初始化
```bash
# 初始化
npm init
# 安装依赖
npm install dotenv navi-sdk
```
新建index.js,照着 [navi-sdk](https://naviprotocol.gitbook.io/navi-protocol-developer-docs/how-to-interact-with-the-contract/navi-sdk) 写逻辑

修改package.json，添加"type": "module"配置， 支持用import的方式导入依赖，类似typescript的操作


## 主要操作
``` javascript
const client = new NAVISDKClient({
  mnemonic: mnemonic,
  networkType: "mainnet",
  numberOfAccounts: 1,
});
const account = client.accounts[0];
// 查看账户
console.log(account.address);
console.log(client.getAllAccounts());

// 查看账户余额
console.log(await account.getAllCoins())

// 存钱
const amount = 1e9;
await account.depositToNavi(Sui, amount);

// 再查看账户余额
console.log(await account.getAllCoins())

```
最后查到交易hash： [tx](https://suivision.xyz/txblock/8uRZi2Sct22sH7EMdLo2H9N4higPQ1eRRyPzFJ1kH348)

不知道为啥，只存了1sui，但是账户少了1.16sui
