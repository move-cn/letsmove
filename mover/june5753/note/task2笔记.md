# 先学习 hackquest的课程

<img src="https://p.ipic.vip/77lc8e.png" alt="image-20240808234624425" style="zoom:50%;" />

https://www.hackquest.io/zh/guided-project/%E5%9C%A8%20Sui%20%E4%B8%8A%E5%8F%91%E8%A1%8C%E4%BB%A3%E5%B8%81/learn/77985d33-9f88-4ee6-a35e-0d6e39ec2dc7?menu=null&learningTrackId=bbf66ebb-e27f-4b8f-90ea-6ea4ba720c83&menuCourseId=a9ae0b0e-1801-4510-90d9-de1bae9780bf&lessonId=77985d33-9f88-4ee6-a35e-0d6e39ec2dc7&documentationId=undefined

学习别人的笔记

https://learnblockchain.cn/article/8717

# 个人实践

1. 先编译

   > sui move build

   示例：

```groovy
 ~/Documents/sui/letsmove/mover/june5753/code/task2/june5753_coin/sources> sui move build                         
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
```

2. 发布合约 ,注意输入的命令在 根目录下，如：

   <img src="https://p.ipic.vip/fz48ku.png" alt="image-20240808234512059" style="zoom:50%;" />

   ```
    ~/Documents/sui/letsmove/mover/june5753/code/task2/june5753_coin   main ●✚  sui client publish
   UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
   INCLUDING DEPENDENCY Sui
   INCLUDING DEPENDENCY MoveStdlib
   BUILDING task2
   Successfully verified dependencies on-chain against source.
   Transaction Digest: 2zjm4JArw4tjRUnDnyJhReoTaSjZK2tJGGtpDgQErHnQ
   ……
   ```

找到这个值：

> Transaction Digest: 2zjm4JArw4tjRUnDnyJhReoTaSjZK2tJGGtpDgQErHnQ

进入 https://suiscan.xyz/mainnet/home

第一次没有在主网找到，注意环境的切换。

先检查一下当前的环境，发现在 testnet

```
>sui client envs   
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯
```

so，添加一个主网的

```
 >sui client active-env
testnet
 > sui client new-env --alias mainnet（别名自己取） --rpc https://sui-mainnet.nodeinfra.com:443
 
```

再次查看

```
> sui client envs
╭─────────┬───────────────────────────────────────┬────────╮
│ alias   │ url                                   │ active │
├─────────┼───────────────────────────────────────┼────────┤
│ testnet │ https://fullnode.testnet.sui.io:443   │ *      │
│ mainnet │ https://sui-mainnet.nodeinfra.com:443 │        │
╰─────────┴───────────────────────────────────────┴────────╯
```

切换到主网

>  sui client switch --env mainnet 

查看当前网络

> ~sui client active-env
> mainnet

在主网 publish

```groovy
 sui client publish --gas-budget 5000000000
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Cannot find gas coin for signer address 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca with amount sufficient for the required gas budget 5000000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.
```

第一次出错了 gas 不足

```
~sui client publish --gas-budget 100000000 --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Cannot find gas coin for signer address 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca with amount sufficient for the required gas budget 100000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.
~ sui client gas
No gas coins are owned by this address

```

再次查看地址

```groovy
~sui client addresses 
╭────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias          │ address                                                            │ active address │
├────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ nice-malachite │ 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 │                │
│ gracious-beryl │ 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca │ *              │
╰────────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯

```

sui client active-address 这个直接能返回你当前的地址,带星星的（*）的

然后钱包转 0.1SuI 到 `0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca`

再次查看 gas

```
sui client gas      
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0xf2a11c4f735cb1735f7d85d52f026c8dd5167479dffcc03ca32244df1d39ab04 │ 100000000          │ 0.10             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
```

<img src="https://p.ipic.vip/q9etl8.png" alt="image-20240809001716921" style="zoom:50%;" />

现在，终于可以发布了，课程的教程中先不设置gas-budget.

![image-20240809001839163](https://p.ipic.vip/t5tv1r.png)



```oo
~ sui client publish                        
UPDATING GIT DEPENDENCY https://gitee.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Successfully verified dependencies on-chain against source.
Transaction Digest: HeDEM8t767Qs2pnjs4xHXe1HzPqheYTiTywhF41cbsgL
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                   │
│ Gas Owner: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                │
│ Gas Budget: 29801200 MIST                                                                                    │
│ Gas Price: 757 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xf2a11c4f735cb1735f7d85d52f026c8dd5167479dffcc03ca32244df1d39ab04                                    │
│  │ Version: 317768411                                                                                        │
│  │ Digest: EPnjPDEnYpDQEW4fUqSovRASWtwD6ZZ4QHHHbfD42NrE                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    gv7HAvrcDr46ldi+E6XeHbQAwzJkcRz40VnyQQRDoIxIfzeMANgg/R/1KtnZKMM78JlScgsWL2tlv7jpleSjAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HeDEM8t767Qs2pnjs4xHXe1HzPqheYTiTywhF41cbsgL                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 483                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x25f0d18ace712a6c7e2649918c4b8ba1c9c09af21ed5a7411f5d4148f5023e8a                         │
│  │ Owner: Shared( 317768412 )                                                                     │
│  │ Version: 317768412                                                                             │
│  │ Digest: EbZnromJbd1QyhYfY2fx3o29q1DEdDESLQHf6PJCqcGS                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768412                                                                             │
│  │ Digest: BVsrquHnUmNU7UhwNLpXSD1obNRnr2HiyYBxiHfN6jLe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x39f2a8ce3448d4a36b1f3a47809056a1de0937e89324809564870bf2d62a0b03                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768412                                                                             │
│  │ Digest: 2DhHh8YVCpr5EYWW8BWgts5Pxv5iTFKszRgWDZRFmc8c                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x92864489efe32ff1f243d3af911306ca164c537d0d91854eed460aafbc99f7c8                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768412                                                                             │
│  │ Digest: DpRspnHY6ZnsrSTGQYSDvxBnJis7Z8n2QgeKFR3jKUDw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: EEVwrwmpcrXHZzs6Gf9zJXRHM6BDY4Z6dWw44BqW2qpW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xab7104e69e4d8d0b7dec5b6013fca5c3e93750fe301ce8c50e7a2cf93d4f6031                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 317768412                                                                             │
│  │ Digest: CQ2M5rzV91UEPz1DL4czu43yzaWW9AyjeHsv5iJhDjD1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb30b6f62765ccf885f8b70d7468c3f73229a5928f6f6dd2f90c7c4d788f8f8e7                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 317768412                                                                             │
│  │ Digest: DQfUNZJ9azTxPv4LuvXS6AYMuPhHvj3WxFRAa2XmK4SU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf2a11c4f735cb1735f7d85d52f026c8dd5167479dffcc03ca32244df1d39ab04                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768412                                                                             │
│  │ Digest: 2rCPK86xA14WkMm19YZwXFASABhd83h7gJeWUBpa1Xy9                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf2a11c4f735cb1735f7d85d52f026c8dd5167479dffcc03ca32244df1d39ab04                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768412                                                                             │
│  │ Digest: 2rCPK86xA14WkMm19YZwXFASABhd83h7gJeWUBpa1Xy9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 28287200 MIST                                                                    │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7DefVJDXNizSMKbPeyr2uWmJ9Pi6uW7jStEcpS33xUgZ                                                   │
│    7xVipyUK46Pj6XFoAeeKXYMeHjgGXEvHaNB3eCvHKHvr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                              │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x25f0d18ace712a6c7e2649918c4b8ba1c9c09af21ed5a7411f5d4148f5023e8a                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Shared( 317768412 )                                                                                                                 │
│  │ ObjectType: 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_faucet::Wallet                                    │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: EbZnromJbd1QyhYfY2fx3o29q1DEdDESLQHf6PJCqcGS                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_coin::JUNE5753_COIN>       │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: BVsrquHnUmNU7UhwNLpXSD1obNRnr2HiyYBxiHfN6jLe                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x39f2a8ce3448d4a36b1f3a47809056a1de0937e89324809564870bf2d62a0b03                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                       │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: 2DhHh8YVCpr5EYWW8BWgts5Pxv5iTFKszRgWDZRFmc8c                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x92864489efe32ff1f243d3af911306ca164c537d0d91854eed460aafbc99f7c8                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_faucet::JUNE5753_FAUCET>   │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: DpRspnHY6ZnsrSTGQYSDvxBnJis7Z8n2QgeKFR3jKUDw                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0xab7104e69e4d8d0b7dec5b6013fca5c3e93750fe301ce8c50e7a2cf93d4f6031                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Immutable                                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_faucet::JUNE5753_FAUCET>  │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: CQ2M5rzV91UEPz1DL4czu43yzaWW9AyjeHsv5iJhDjD1                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0xb30b6f62765ccf885f8b70d7468c3f73229a5928f6f6dd2f90c7c4d788f8f8e7                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Immutable                                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_coin::JUNE5753_COIN>      │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: DQfUNZJ9azTxPv4LuvXS6AYMuPhHvj3WxFRAa2XmK4SU                                                                                       │
│  └──                                                                                                                                          │
│ Mutated Objects:                                                                                                                              │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0xf2a11c4f735cb1735f7d85d52f026c8dd5167479dffcc03ca32244df1d39ab04                                                               │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                 │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                 │
│  │ Version: 317768412                                                                                                                         │
│  │ Digest: 2rCPK86xA14WkMm19YZwXFASABhd83h7gJeWUBpa1Xy9                                                                                       │
│  └──                                                                                                                                          │
│ Published Objects:                                                                                                                            │
│  ┌──                                                                                                                                          │
│  │ PackageID: 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4                                                              │
│  │ Version: 1                                                                                                                                 │
│  │ Digest: EEVwrwmpcrXHZzs6Gf9zJXRHM6BDY4Z6dWw44BqW2qpW                                                                                       │
│  │ Modules: june5753_coin, june5753_faucet                                                                                                    │
│  └──                                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -28066080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


```



找到 

>  Transaction Digest: HeDEM8t767Qs2pnjs4xHXe1HzPqheYTiTywhF41cbsgL

到

![image-20240809002155702](https://p.ipic.vip/xeb2ys.png)





![image-20240809002739177](https://p.ipic.vip/kle1uv.png)

这个是你刚刚发布的包，记录下这个包id 

> 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4

ObjectId （shared）

> 0x25f0d18ace712a6c7e2649918c4b8ba1c9c09af21ed5a7411f5d4148f5023e8a (出错了)

怎么办，换一个 ObjectId 

> ![image-20240809232748089](../../Library/Application Support/typora-user-images/image-20240809232748089.png)

<img src="../../Library/Application Support/typora-user-images/image-20240809232706831.png" alt="image-20240809232706831" style="zoom:50%;" />

0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0



接收者的地址 test2中的地址  

>  个人的真实钱包地址

使用以下命令进行代币铸造

sui client call --package 刚刚记录的包id --module My_token  --function mint_in_my_module --args  刚刚记录的Obj id  铸造数量 接收者的地址  --gas-budget=100000000 

成功示例：

sui client call --package 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 --module june5753_coin  --function mint --args 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0 100 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000 



0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  为个人的真实钱包地址

![image-20240809011338322](https://p.ipic.vip/y3s2cg.png)

```groovy
sui client call --package 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 --module june5753_coin  --function mint --args 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 100 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca  --gas-budget=1000000
RPC call failed: ErrorObject { code: ServerError(-32002), message: "Transaction execution failed due to issues with transaction inputs, please review the errors and try again: A move object is expected, instead a move package is passed: 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4.", data: None }

Caused by:
    RPC call failed: ErrorObject { code: ServerError(-32002), message: "Transaction execution failed due to issues with transaction inputs, please review the errors and try again: A move object is expected, instead a move package is passed: 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4.", data: None }
```



注意：各个id 需要 review 下



```groovy
 ~ sui client call --package 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 --module june5753_coin  --function mint --args 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0 100 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000

Transaction Digest: GM63RjRxWtXV8d6N6RpDsJzsWNnhrCv4rQKa3WEErgXB
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                   │
│ Gas Owner: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 757 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                                    │
│  │ Version: 317768416                                                                                        │
│  │ Digest: 633jzQF6P9BwBPUxEVuoQfLPxfvUdou2cQQkuKkTiCZd                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    june5753_coin                                                      │                         │
│ │  │ Package:   0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    vuXcLcWPM8gzz6PKohqZEjW3WkeVztV2gQsrsBj2JlYXybIyhvUWFuSsKFhYNJcgMdXe3Nu83/eA2JzF0WxjBA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GM63RjRxWtXV8d6N6RpDsJzsWNnhrCv4rQKa3WEErgXB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 484                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x07da97714f043a40a0fdb5dc2074d70ee5c9707390bbef62b1c7d6b6a5522db0                         │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )  │
│  │ Version: 317768417                                                                             │
│  │ Digest: APfvngvLEnxK57strrh4XskLCcpWmKJTtvVwDxwNhQZX                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768417                                                                             │
│  │ Digest: EteRy9nWkt1M1TUBgPk5LFZzMnj1VSAp4yBrhJChx5yE                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768417                                                                             │
│  │ Digest: G1nzYVm7KcK8Cd7ieJ9CWS4uEmFSLsKbbHfi76YgPh6c                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768417                                                                             │
│  │ Digest: G1nzYVm7KcK8Cd7ieJ9CWS4uEmFSLsKbbHfi76YgPh6c                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4286400 MIST                                                                     │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 2798928 MIST                                                                   │
│    Non-refundable Storage Fee: 28272 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Gu53wV48Bi3UgxmLQ3TZhh31uLRgrp3oi7SgvuaUxi2                                                    │
│    HeDEM8t767Qs2pnjs4xHXe1HzPqheYTiTywhF41cbsgL                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                         │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0x07da97714f043a40a0fdb5dc2074d70ee5c9707390bbef62b1c7d6b6a5522db0                                                          │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                            │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )                                         │
│  │ ObjectType: 0x2::coin::Coin<0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_coin::JUNE5753_COIN>         │
│  │ Version: 317768417                                                                                                                    │
│  │ Digest: APfvngvLEnxK57strrh4XskLCcpWmKJTtvVwDxwNhQZX                                                                                  │
│  └──                                                                                                                                     │
│ Mutated Objects:                                                                                                                         │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0                                                          │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                            │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                         │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_coin::JUNE5753_COIN>  │
│  │ Version: 317768417                                                                                                                    │
│  │ Digest: EteRy9nWkt1M1TUBgPk5LFZzMnj1VSAp4yBrhJChx5yE                                                                                  │
│  └──                                                                                                                                     │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                                                          │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                            │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                            │
│  │ Version: 317768417                                                                                                                    │
│  │ Digest: G1nzYVm7KcK8Cd7ieJ9CWS4uEmFSLsKbbHfi76YgPh6c                                                                                  │
│  └──                                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                           │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )               │
│  │ CoinType: 0x2::sui::SUI                                                                                     │
│  │ Amount: -2244472                                                                                            │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )               │
│  │ CoinType: 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4::june5753_coin::JUNE5753_COIN  │
│  │ Amount: 100                                                                                                 │
│  └──                                                                                                           │
╰──────────────────────────────────────────────────────────────────────────────────────
```



# 开始水龙头

```
  sui client call --package 0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7 --module june5753_faucet  --function mint --args 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e 100 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000
Transaction Digest: 3kdu24JzSy1TUfsRMzuMv4odgjEYVV4MUraZKjz84d6o
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                   │
│ Gas Owner: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 757 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                                    │
│  │ Version: 317768424                                                                                        │
│  │ Digest: 8sR4XcNtHMWwfmxC114bjbKGnrttvi4MmLJ31N5ymHys                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    june5753_faucet                                                    │                         │
│ │  │ Package:   0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    +yYjXtX8EaZTd3YpbZpCYadSN+CEFi2NrSkLz43WWfGZZmWPqn0fTuJ/tznlQ/+MNlpbUXIyCSnHyzb95SfwBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3kdu24JzSy1TUfsRMzuMv4odgjEYVV4MUraZKjz84d6o                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 485                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x313597e88bae291bcbd0d6bb819f15c55f7aaee46c072948a0415416d14038a8                         │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )  │
│  │ Version: 317768425                                                                             │
│  │ Digest: EppAq8LExNyoBAPRCCH5jjSi9espUDWLDr4ft8EPtF5x                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e                         │
│  │ Owner: Shared( 317768424 )                                                                     │
│  │ Version: 317768425                                                                             │
│  │ Digest: 3XyubC8ykH1v93gXFfDc8VwPZMopJPuzYqqjVoTWUeot                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768425                                                                             │
│  │ Digest: 5QHv2Tp5XREVfCRJ61YmQXRwQ5Q8kERFvkc5CZVVtRir                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e                         │
│  │ Version: 317768424                                                                             │
│  │ Digest: 8XnLhFNUB2Yby19bFTQBEvssSadyeMG1Y2riww368DR1                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                         │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )  │
│  │ Version: 317768425                                                                             │
│  │ Digest: 5QHv2Tp5XREVfCRJ61YmQXRwQ5Q8kERFvkc5CZVVtRir                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4347200 MIST                                                                     │
│    Computation Cost: 757000 MIST                                                                  │
│    Storage Rebate: 2829024 MIST                                                                   │
│    Non-refundable Storage Fee: 28576 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6xcb3fUFmhdjvQLHj8r6SS1DAa35RY18PMMwVZHYiZUj                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                             │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0x313597e88bae291bcbd0d6bb819f15c55f7aaee46c072948a0415416d14038a8                                                              │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )                                             │
│  │ ObjectType: 0x2::coin::Coin<0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7::june5753_faucet::JUNE5753_FAUCET>         │
│  │ Version: 317768425                                                                                                                        │
│  │ Digest: EppAq8LExNyoBAPRCCH5jjSi9espUDWLDr4ft8EPtF5x                                                                                      │
│  └──                                                                                                                                         │
│ Mutated Objects:                                                                                                                             │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e                                                              │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                │
│  │ Owner: Shared( 317768424 )                                                                                                                │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7::june5753_faucet::JUNE5753_FAUCET>  │
│  │ Version: 317768425                                                                                                                        │
│  │ Digest: 3XyubC8ykH1v93gXFfDc8VwPZMopJPuzYqqjVoTWUeot                                                                                      │
│  └──                                                                                                                                         │
│  ┌──                                                                                                                                         │
│  │ ObjectID: 0xc860e490cd5532fa88bd2d5a25faa616617833e2fcdcba2f7e7823032440689b                                                              │
│  │ Sender: 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca                                                                │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                │
│  │ Version: 317768425                                                                                                                        │
│  │ Digest: 5QHv2Tp5XREVfCRJ61YmQXRwQ5Q8kERFvkc5CZVVtRir                                                                                      │
│  └──                                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                               │
│  │ Owner: Account Address ( 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca )                   │
│  │ CoinType: 0x2::sui::SUI                                                                                         │
│  │ Amount: -2275176                                                                                                │
│  └──                                                                                                               │
│  ┌──                                                                                                               │
│  │ Owner: Account Address ( 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3 )                   │
│  │ CoinType: 0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7::june5753_faucet::JUNE5753_FAUCET  │
│  │ Amount: 100                                                                                                     │
│  └──                                                                                                               │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────
```



我的coin:(OK)
sui client call --package 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 --module june5753_coin  --function mint --args 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0 100 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000 

我的 faucet（OK）

sui client call --package 0x6cf97a47a354a5a178b7ae3a769c00a56bbea45582be582d06013328f60b44d7 --module june5753_faucet  --function mint --args 0x05ae35d5ce9caa47f90aa0768ff062332b7558501093d75827177f677c91e58e 100 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000



```java
public entry fun mint(treasury_cap: &mut TreasuryCap<JUNE5753_FAUCET>,
                          amount: u64,
                          recipient: address,
                          ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
```





![image-20240810234958850](../../Library/Application Support/typora-user-images/image-20240810234958850.png)

# 切换地址   

```
 sui client addresses
╭────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias          │ address                                                            │ active address │
├────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ nice-malachite │ 0x848923a81fe98ec390e05e51f4a6726944897561af662002005da9cc49f92049 │ *              │
│ gracious-beryl │ 0xa708209314f62cc01edb3909aca5793a935dd7869f0232ae91e2c6f7ca0b22ca │                │
╰────────────────┴────────────────────────────────────────────────────────────────────┴───────────────
```

手机上给这个转 0.1 sui

之后再执行上面相同的命令

![image-20240811001337234](https://p.ipic.vip/sc2gk3.png)

over



# 参考：

SUI CLI常用命令解析1——Client @SUI Move开发必知必会

https://learnblockchain.cn/article/7832