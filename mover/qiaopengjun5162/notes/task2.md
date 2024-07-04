# 完成两个Coin合约的上链部署

- 上链网络: mainnet

## 需求

- 完成 Coin相关知识的学习
- 完成 `My Coin` 的学习并部署主网  
- 完成 `Faucet Coin` 的学习并部署主网
- 提交 `My Coin` 和 `Faucet Coin` 合约发布`package id`
- 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

## 任务指南

```sh
sui move new mycoin    
sui move build
sui move test 

letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [?] via 🅒 base took 8.8s 
➜ sui client envs                                                       
╭─────────┬───────────────────────────────────────┬────────╮
│ alias   │ url                                   │ active │
├─────────┼───────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443    │        │
│ mainnet │ https://sui-mainnet.nodeinfra.com:443 │        │
│ testnet │ https://fullnode.testnet.sui.io:443   │ *      │
╰─────────┴───────────────────────────────────────┴────────╯

letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base 
➜ sui client switch --env mainnet
Active environment switched to [mainnet]

letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base 
➜ sui client envs                
╭─────────┬───────────────────────────────────────┬────────╮
│ alias   │ url                                   │ active │
├─────────┼───────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443    │        │
│ mainnet │ https://sui-mainnet.nodeinfra.com:443 │ *      │
│ testnet │ https://fullnode.testnet.sui.io:443   │        │
╰─────────┴───────────────────────────────────────┴────────╯

letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base took 35.1s 
➜ sui client publish  --skip-fetch-latest-git-deps
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING mycoin
Successfully verified dependencies on-chain against source.
Transaction Digest: K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                                    │
│  │ Version: 87782293                                                                                         │
│  │ Digest: AnjQUPssWXBAfBozFPdE3b5SuswxgizrAymuPJq93w1j                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
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
│    0ugJndPAwhQz3Nq2iG0Ty7RvcWS5Fs7FuCWWZXM3L7tiIdQHTiquYXtIz0HZr/NviZZ2ua7ec+M4zU82NFN1Bw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 374                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GM7TLzbTz2Jhktjoh1NwmuhkogVivnLDv4zYxMCKeZk3                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782294                                                                              │
│  │ Digest: LEDt5e932TXcasaRkPy3sxVpPTY4P7S1vTZKeuVhwHN                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb1e0dadcf16036481b4683e17c565407c7ad4385d6529e63396fbffec12fdbe0                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 87782294                                                                              │
│  │ Digest: G1f3exm5stNxS7V5zPdk99upwCAnKJG5C2MLuD3nL1PS                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc8cd37c54febae3ee109d67c1f23340d9331d2c3627ccc9d1cf5a8afa3d8ceef                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782294                                                                              │
│  │ Digest: BqKAciptNh17gU7nFGtHoSYxDTiMpGAvpZ2dGjo91HH3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782294                                                                              │
│  │ Digest: 7iuzx3CeK1PB6oAa77pURx2GUf6AQXGAHp3UBbsy8g1K                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782294                                                                              │
│  │ Digest: 7iuzx3CeK1PB6oAa77pURx2GUf6AQXGAHp3UBbsy8g1K                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14295600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    CuBDQc8DYm2K87Ro57aJaiye3hxipNCLN7yY8LFZChjb                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                                            │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>   │
│  │ Version: 87782294                                                                                                       │
│  │ Digest: LEDt5e932TXcasaRkPy3sxVpPTY4P7S1vTZKeuVhwHN                                                                     │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xb1e0dadcf16036481b4683e17c565407c7ad4385d6529e63396fbffec12fdbe0                                            │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                              │
│  │ Owner: Immutable                                                                                                        │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>  │
│  │ Version: 87782294                                                                                                       │
│  │ Digest: G1f3exm5stNxS7V5zPdk99upwCAnKJG5C2MLuD3nL1PS                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xc8cd37c54febae3ee109d67c1f23340d9331d2c3627ccc9d1cf5a8afa3d8ceef                                            │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                           │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                    │
│  │ Version: 87782294                                                                                                       │
│  │ Digest: BqKAciptNh17gU7nFGtHoSYxDTiMpGAvpZ2dGjo91HH3                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                                            │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 87782294                                                                                                       │
│  │ Digest: 7iuzx3CeK1PB6oAa77pURx2GUf6AQXGAHp3UBbsy8g1K                                                                    │
│  └──                                                                                                                       │
│ Published Objects:                                                                                                         │
│  ┌──                                                                                                                       │
│  │ PackageID: 0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c                                           │
│  │ Version: 1                                                                                                              │
│  │ Digest: GM7TLzbTz2Jhktjoh1NwmuhkogVivnLDv4zYxMCKeZk3                                                                    │
│  │ Modules: mycoin                                                                                                         │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14067480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


sui move new faucet_coin 

```
### - 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

```shell
letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base 
➜ export PACKAGE_ID=0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c


letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base 
➜ export TREASURYCAP_ID=0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                                                                                                 

letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base 
➜ sui client call --function mint --module mycoin --package $PACKAGE_ID --args $TREASURYCAP_ID 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000
Transaction Digest: Hk2m48YK9VbDL8cdLAMM119ZDHiqGuBJttC1zE2jH6yh
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                                    │
│  │ Version: 87782294                                                                                         │
│  │ Digest: 7iuzx3CeK1PB6oAa77pURx2GUf6AQXGAHp3UBbsy8g1K                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    aL0DdJ3ifX6bEKK4Z2jpF/tpo5XPRC3M3Z6qq4pmSmLGApdJ1VvFk9CnxsAeICPFQHJZDklgR82Sb/7/GfBcCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Hk2m48YK9VbDL8cdLAMM119ZDHiqGuBJttC1zE2jH6yh                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 374                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2e7e097d8b55466c683f58fc332de0bdf73080728b2f04ed88d3832bbb7d116f                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 87782295                                                                              │
│  │ Digest: HthcsrxhaYnN414BXtv4uvXd1c7z8TmjDnSru8hB7sRe                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782295                                                                              │
│  │ Digest: 5rFinGoZt7SS95EMZ11WfQwAC6UUeZdtcvDHc17rGHh4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782295                                                                              │
│  │ Digest: AGhrKXvagFKzA1iGeKnDu5pb2VwyQHFY46nfANd3ucnn                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782295                                                                              │
│  │ Digest: AGhrKXvagFKzA1iGeKnDu5pb2VwyQHFY46nfANd3ucnn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    K143zA8QHViWRQcVFNHrTjkddqfzV4g8qUkXqdGLxvB                                                    │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x2e7e097d8b55466c683f58fc332de0bdf73080728b2f04ed88d3832bbb7d116f                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                          │
│  │ ObjectType: 0x2::coin::Coin<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>         │
│  │ Version: 87782295                                                                                                      │
│  │ Digest: HthcsrxhaYnN414BXtv4uvXd1c7z8TmjDnSru8hB7sRe                                                                   │
│  └──                                                                                                                      │
│ Mutated Objects:                                                                                                          │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0x3f2b8b45d2e7c655026dec24c15e220d18a23ed624e9caa0ccac4814aad554f2                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN>  │
│  │ Version: 87782295                                                                                                      │
│  │ Digest: 5rFinGoZt7SS95EMZ11WfQwAC6UUeZdtcvDHc17rGHh4                                                                   │
│  └──                                                                                                                      │
│  ┌──                                                                                                                      │
│  │ ObjectID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                                           │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                             │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                             │
│  │ Version: 87782295                                                                                                      │
│  │ Digest: AGhrKXvagFKzA1iGeKnDu5pb2VwyQHFY46nfANd3ucnn                                                                   │
│  └──                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2130008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ CoinType: 0xc303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c::mycoin::MYCOIN    │
│  │ Amount: 100                                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

### 发布 faucet coin 
```shell
letsmove/mover/qiaopengjun5162/code/task2/faucet_coin on  main [!?] via 🅒 base took 4.3s 
➜ sui client publish  --skip-fetch-latest-git-deps                                                                                                                   
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING faucet_coin
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Successfully verified dependencies on-chain against source.
Transaction Digest: GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                   │
│ Gas Owner: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                                    │
│  │ Version: 87782295                                                                                         │
│  │ Digest: AGhrKXvagFKzA1iGeKnDu5pb2VwyQHFY46nfANd3ucnn                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73" │ │
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
│    lW8DT7bNtMei+LN6NFVj6fNsTT2J0BIhTCpLv5dFcppFnXbVF/lsFdneFllOBH1uuVdlRghW+VmVndi5Ig4RAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GvbJ8ia1HfavuccAmi8EJJAaCGShtdv4NWrs1B13vvom                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 374                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 5cKSGVNgChcDvTWqcEN2z78UpZW1GBcXn2odzyDJF3py                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x602d3a81e134c345d5d9f436c564f536b66ddacd1c5740f9087f975054dde9c4                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782296                                                                              │
│  │ Digest: 2mG9V8pQFFRThqLr4u3qzszXbfVCLaxKt19yuzuJ4wFi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaae50d774ee298f7b6aca54e93523c566891c9fe6cb1f9ff2cef378ef47afc9d                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 87782296                                                                              │
│  │ Digest: BBKxZTvotxqGMdEDpRbqkP4nNdFRLL6bJLLuKFhxpN3W                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782296                                                                              │
│  │ Digest: EtqVU2SJiEApzhPYcbqyFgzHVggWrZhaSYfsYWFSKK4Q                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782296                                                                              │
│  │ Digest: EfcxVPXomNyYPCnLEqpipu9SQR7t7a9FwFvW9n5g9vEr                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ Version: 87782296                                                                              │
│  │ Digest: EfcxVPXomNyYPCnLEqpipu9SQR7t7a9FwFvW9n5g9vEr                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 16393200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    Hk2m48YK9VbDL8cdLAMM119ZDHiqGuBJttC1zE2jH6yh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x602d3a81e134c345d5d9f436c564f536b66ddacd1c5740f9087f975054dde9c4                                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 87782296                                                                                                                  │
│  │ Digest: 2mG9V8pQFFRThqLr4u3qzszXbfVCLaxKt19yuzuJ4wFi                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xaae50d774ee298f7b6aca54e93523c566891c9fe6cb1f9ff2cef378ef47afc9d                                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                         │
│  │ Owner: Shared                                                                                                                      │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::FAUCET_COIN>  │
│  │ Version: 87782296                                                                                                                  │
│  │ Digest: BBKxZTvotxqGMdEDpRbqkP4nNdFRLL6bJLLuKFhxpN3W                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xbca89418717ee5dd5c1f63c46fd8e0d7ee57e1f1f80de39f5cfd4599b19a838c                                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                                      │
│  │ ObjectType: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a::faucet_coin::MySupply                              │
│  │ Version: 87782296                                                                                                                  │
│  │ Digest: EtqVU2SJiEApzhPYcbqyFgzHVggWrZhaSYfsYWFSKK4Q                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xaf87342856a09e4afaac7b6e4607ffbd28116f9c18416c1782003bc47c94981e                                                       │
│  │ Sender: 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73                                                         │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 87782296                                                                                                                  │
│  │ Digest: EfcxVPXomNyYPCnLEqpipu9SQR7t7a9FwFvW9n5g9vEr                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: 5cKSGVNgChcDvTWqcEN2z78UpZW1GBcXn2odzyDJF3py                                                                               │
│  │ Modules: faucet_coin                                                                                                               │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -16165080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

letsmove/mover/qiaopengjun5162/code/task2/faucet_coin on  main [!?] via 🅒 base took 8.7s 
➜ 


```

## 学习笔记
### witness的理解：
- 定义一个车子结构体相当于是新建了一个生产车的工厂，这个工厂能生产车子
- witness本身是另外一个结构体，等于是一个证明，就是政府给你每一辆要生产的车都开一个生产许可证   
- 这两个要是组合起来的话，它们之间的关系就是一个是生产工厂，一个是生产车子的证明
- 有一辆车的证明就只能生产一辆车，这个证明生产一辆车之后就和车子一一绑定了（其实是废弃了）
- One Time Witness，就是你这个工厂建好了，不好意思 我只给你发一辆车子的生产证明，强制保证你这个工厂建立出来就只能产生唯一的一辆车 
- https://github.com/sui-foundation/sui-move-intro-course/blob/main/unit-three/lessons/3_witness_design_pattern.md#one-time-witness
- 同一个包的结构体 只会产生一个实例对象

### ctx.sender() 和 tx_context::sender(ctx) 是一样的
### struct 结构体如果toml文件里加了 edition 就要加 public

### move每一次调用（事务 或者 说交易） 都是原子性的， 而且可以理解是一个串行的世界 (底层会自动并行)，不需要你自己处理事务回滚和并发


mycoin package id testnet: 0x7e8063dd7740ec02746fa970dea089468a9730be75ee71530dc2f53a39377b79

## 问题
1. 发布报错  Server returned an error status code: 429
```shell
letsmove/mover/qiaopengjun5162/code/task2/mycoin on  main [!?] via 🅒 base took 2.4s 
➜ sui client publish                              
Networking or low-level protocol error: Server returned an error status code: 429

Caused by:
    Server returned an error status code: 429

```
解决：切换 ~/.sui/sui_config 地址下修改 client.yaml 文件中的mainnet的URL
```shell
sui client envs
╭─────────┬───────────────────────────────────────┬────────╮
│ alias   │ url                                   │ active │
├─────────┼───────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443    │        │
│ mainnet │ https://sui-mainnet.nodeinfra.com:443 │ *      │
│ testnet │ https://fullnode.testnet.sui.io:443   │        │
╰─────────┴───────────────────────────────────────┴────────╯

vim client.yaml

sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │ *      │
│ testnet │ https://fullnode.testnet.sui.io:443 │        │
╰─────────┴─────────────────────────────────────┴────────╯
```

## 参考

- <https://examples.sui.io/samples/coin.html>
- https://sui.io/networkinfo
- https://docs.sui.io/guides/developer/getting-started/connect
- https://suivision.xyz/package/0x0c303dc81a35841a80e40462b6f96d9b1a9e519e1b01ddfc94be00061127fa0c?tab=Code
- https://intro-zh.sui-book.com/unit-three/lessons/5_managed_coin.html
- https://suivision.xyz/txblock/Hk2m48YK9VbDL8cdLAMM119ZDHiqGuBJttC1zE2jH6yh
- https://github.com/move-cn/tintin-bootcamp/tree/main
- https://suivision.xyz/package/0x3bd35a5bf5f3649d37a9eff58403950b99b135667be45fd776515b2d2316e63a
- https://suivision.xyz/txblock/Hk2m48YK9VbDL8cdLAMM119ZDHiqGuBJttC1zE2jH6yh?tab=Overview
