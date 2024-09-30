# 过程记录

## task1

- #### 完成Sui CLI安装

下载二进制文件 task1要求在测试网testnet完成 我直接在windows下使用的

https://github.com/MystenLabs/sui

- #### 完成Sui钱包安装

直接chrome扩展商店添加

- #### Hello Move合约上链

先cd到指定目录下 new一个hello_move项目

在powershell下使用，cmd可能会出现些怪问题。

```
D:\Sui-Cli\sui-testnet-v1.22.0-windows-x86_64\target\release\sui-windows-x86_64.exe move new hello_move
```

##### hello_move.move（名字hello自己感觉好怪 就把githubID加在字符串那行了

```
#[allow(duplicate_alias)]
/// Module: hello_move
module hello_move::hello_move {
  use std::ascii::{String, string};
  use sui::object::{Self, UID};
  use sui::transfer::transfer;
  use sui::tx_context::{TxContext, sender};

  public struct Hello has key {
    id: UID,
    say: String
  }

  fun init(ctx: &mut TxContext) {
    let hello_move = Hello {
      id: object::new(ctx),
      say: string(b"move by super-lhdta"),
    };
    transfer(hello_move, sender(ctx));
  }
}
```

- #### 发布合约

##### 一定要用powershell

```
D:\Sui-Cli\sui-testnet-v1.22.0-windows-x86_64\target\release\sui.exe client publish 
```

提示gasfee不足

```
Cannot find gas coin for signer address [0xf98f199df4d8bdf23fb4979bb9efcade9594946f65e1900f74f02d2f8bf3b68f] with amount sufficient for the required gas amount [100000000].
```

获取gasfee（windows下curl不会用 用python代替

```
import requests
headers = {
  'Content-Type': 'application/json',
}
json_data = {
  'FixedAmountRequest': {
    'recipient': '0xf98f199df4d8bdf23fb4979bb9efcade9594946f65e1900f74f02d2f8bf3b68f',
  },
}
response = requests.post('https://faucet.testnet.sui.io/gas', headers=headers, json=json_data)
```

领取完成后再次发布 提示成功

```
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_move
Successfully verified dependencies on-chain against source.
```

找到packageID

```
│ Published Objects:                                                             
│  ┌──                                                                           
│  │ PackageID: 0x55ef7f62dfac18becfb822150433cdff9f70b300d56a2b5c5dde235845e06f6a
```

完成😄