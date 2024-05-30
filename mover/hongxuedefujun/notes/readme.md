# bug

## bug1

### 报错信息 

Cannot use import statement outside a module

### 解决办法

在 package.json加代码，在依赖后面加

package.json完整代码如下

```json
{
    "name": "sdk.js",
    "version": "1.0.0",
    "description": "",
    "main": "sdk.js",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1"
    },
    "keywords": [],
    "author": "",
    "license": "ISC",
    "dependencies": {
      "navi-sdk": "^1.1.15"
    },
    "type": "module"
  }
  
```

## bug2

### 报错信息 

  throw new Error('Invalid mnemonic');（无效的助记词）

### 解决办法

原因:误解navi的sdk文档的示例

原文档

```
const mnemonic = ''; // Use an existing mnemonic or leave empty to generate a new one
const client = new NAVISDKClient({mnemonic, networkType: "mainnet", numberOfAccounts: 5}); 
```

正确理解

如果随机生成

```
const mnemonic = ''; // Use an existing mnemonic or leave empty to generate a new one
const client = new NAVISDKClient({networkType: "mainnet", numberOfAccounts: 5});
```

如果导入，就填入助记次

## bug3

### 报错信息

JsonRpcError: Package object does not exist with ID 0x2c256d2ae030db12c7015aa1617ad928e60cc99d460b279fe76bbb9f82fa7063

### 解决办法

切换主网（主网要有钱）

## bug4

### 报错信息

Error: Insufficient balance for this Coin

### 解决办法

赚sui



