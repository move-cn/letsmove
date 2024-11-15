# Task1 Hello Move

## 1.学习资源

* [Bootcamp-01 Hello](https://github.com/hoh-zone/move-bootcamp/tree/main/01_hello)
* [任务指南](https://github.com/move-cn/letsmove/tree/main/task)
* [提交作业](https://github.com/move-cn/letsmove)
* [通用工具讲解（Vs Code、Git）](https://github.com/hoh-zone/lets-fullstack)

## 2.Prerequisites（Liunx）

```
sudo apt-get update
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential
```

## 3.Install Sui（Liunx）

1. Go to [Sui](https://github.com/MystenLabs/sui).
2. In the right pane, find the Releases section.
3. Click the release tagged Latest to open the release's page.
4. In the Assets section of the release, select the .tgz compressed file that corresponds to your operating system.
5. Extract all files from the .tgz file into the preferred location on your system.

```
wget .tgz
tar -zxvf  .tgz
```

6. Navigate to the expanded folder. You should have the following extracted files:

| Name | Description |
| ---- |    ----     |
|move-analyzer | Language Server Protocol implementation. |
|sui | Main Sui binary.|
|sui-bridge | Sui native bridge.|
|sui-data-ingestion | Capture Full node data for indexer to store in a database.|
|sui-faucet | Local faucet to mint coins on local network.|
|sui-graphql-rpc | GraphQL service for Sui RPC. |
|sui-node | Run a local node.|
|sui-test-validator | Run test validators on a local network for development.|
|sui-tool | Provides utilities for Sui.|

7. Add the folder containing the extracted files to ~/.bashrc. 

```
export PATH=$PATH:~/sui
```

8. Start a new terminal session or type source ~/.bashrc to load the new PATH value.

```
source ~/.bashrc
```

## 4.Check Sui is Installed

```
Sui -V
```

## 5.Sui Wallet
● [SuiWallet（Chrome）](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

## 6.Sui Explorer
● [Suiscan](https://suiscan.xyz/testnet/home)
● [SuiVision](https://testnet.suivision.xyz/)

## 7.Sui CLI Command
●Get Sui Address

```
sui client addresses
```

tips：The first time you start Sui client without having a client.yaml file, the console displays the following message:

```
Config file ["`<PATH-TO-FILE>`/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?
```

● Get Sui Faucet

```
sui client faucet
```

● Request test tokens through cURL

```
curl --location --request POST 'https://faucet.testnet.sui.io/gas' 
--header 'Content-Type: application/json' 
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "`<YOUR SUI ADDRESS>`"
    }
}'
```

● Get Sui Gas

```
sui client gas
```

● Add a Mnemonic Phrase to Sui
```
sui keytool import "INPUT KEY_SCHEME" ed25519
```

## 8.创建项目

```
sui move new hello_move
```

● 将如下代码复制到sources/hello_move.move

```
module hello_move::hello ;

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
        say: string(b"move"),
    };
    transfer(hello_move, sender(ctx));
}
```

## 9.发布上链

```
sui client publish
```

● 如遇到访问github网络问题，可修改Move.toml中的dependencies段

```
[dependencies]
Sui = { git = "https://gitee.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
```

# Task2 Move Coin

# Task3 Move NFT

# Task4 Move Game

# Task5 Move Swap

# Task6 SDK PTB

# Task7 Move CTF Check In

# Task8 Move CTF POW
