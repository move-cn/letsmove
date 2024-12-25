
## 环境安装

github release下载二进制文件 + 配置环境变量


## 测试网命令

```bash
nh@ruijiao1:~/move_play$ sui client
Config file ["/home/nh/.sui/sui_config/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]?y
Sui Full node server URL (Defaults to Sui Testnet if not specified) : https://fullnode.testnet.sui.io:443
Environment alias for [https://fullnode.testnet.sui.io:443] : testnet
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2: for secp256r1):
1
Generated new keypair and alias for address with scheme "secp256k1" [bold-beryl: 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6]
Secret Recovery Phrase : [seat evidence hire toilet bless glare report camp absent milk finger network]
Client for interacting with the Sui network

nh@ruijiao1:~/move_play$ sui client envs
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯
nh@ruijiao1:~/move_play$ sui client gas
No gas coins are owned by this address
nh@ruijiao1:~/move_play$ sui client faucet
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
nh@ruijiao1:~/move_play$ sui client gas
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0xadb885dd8f065fedb96d3097826a89cf45d21084abb8ee551d7e2866c2a74d2b │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯

```

## 开发并发布合约

```bash
sui move new hello_world
```



```bash
nh@ruijiao1:~/move_play/hello_world$ sui client publish --gas-budget 50000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Transaction Digest: Aee1yMeSeXwAEp52MS1aUfdNm1b3C9QmrhTBAYKDZS9t
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6                                   │
│ Gas Owner: 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xadb885dd8f065fedb96d3097826a89cf45d21084abb8ee551d7e2866c2a74d2b                                    │
│  │ Version: 206234643                                                                                        │
│  │ Digest: 2rq6PmRXSk6yRi3ggTtpyacK7JoiCTbqS17XduSNmyhf                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6" │ │
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
│    Bixn0QvkiGuJKPGs4dpmDL+lO1691p3y7m97wEK4QBZmR8YBz7O5l569w/Z8/Pb65X5JMytZOrSPNDj/kqXZ/A==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Aee1yMeSeXwAEp52MS1aUfdNm1b3C9QmrhTBAYKDZS9t                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 550                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x30f99dfc3df533d60e2c5d85da127b8f2106e435bc355d0d7f8f5f65e4d6cebf                         │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 )  │
│  │ Version: 206234644                                                                             │
│  │ Digest: 6nk9AANfiEkQ5TW6JEW4XheJAgdBFaZLh4WjraUHY5XK                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xac2ab7327ce368f547087e4b7c47461530e71cb947ace86b8d99988eed558e0f                         │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 )  │
│  │ Version: 206234644                                                                             │
│  │ Digest: 54ke1DKibDSAvuw6nFxRqQvsUZKAPyphbtCPLzw7MWne                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbc4bde885572f3c99395c6072fb75cd12abd37136c61ec0fd5da64e369eb748d                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: cLCaBYAvexV8i42t2PANSL7V3CGU5qnw7LaBouVgvmC                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xadb885dd8f065fedb96d3097826a89cf45d21084abb8ee551d7e2866c2a74d2b                         │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 )  │
│  │ Version: 206234644                                                                             │
│  │ Digest: J3vLyxrNgywQK7SwREZ3PT1kDLJkq4cbbY2xnDPrL8vy                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xadb885dd8f065fedb96d3097826a89cf45d21084abb8ee551d7e2866c2a74d2b                         │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 )  │
│  │ Version: 206234644                                                                             │
│  │ Digest: J3vLyxrNgywQK7SwREZ3PT1kDLJkq4cbbY2xnDPrL8vy                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8800800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    GMBJA2gEEvtwv1wGGT7ZEDkQdrmUTKaE4TeinNGQ2feC                                                   │
│    HgXkFBZu5GWmri4hy71aPozzMPtyMp6RXe3u7VRdx5Wm                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x30f99dfc3df533d60e2c5d85da127b8f2106e435bc355d0d7f8f5f65e4d6cebf                  │
│  │ Sender: 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6                    │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 206234644                                                                            │
│  │ Digest: 6nk9AANfiEkQ5TW6JEW4XheJAgdBFaZLh4WjraUHY5XK                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xac2ab7327ce368f547087e4b7c47461530e71cb947ace86b8d99988eed558e0f                  │
│  │ Sender: 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6                    │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 ) │
│  │ ObjectType: 0xbc4bde885572f3c99395c6072fb75cd12abd37136c61ec0fd5da64e369eb748d::hello::Hello  │
│  │ Version: 206234644                                                                            │
│  │ Digest: 54ke1DKibDSAvuw6nFxRqQvsUZKAPyphbtCPLzw7MWne                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xadb885dd8f065fedb96d3097826a89cf45d21084abb8ee551d7e2866c2a74d2b                  │
│  │ Sender: 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6                    │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 206234644                                                                            │
│  │ Digest: J3vLyxrNgywQK7SwREZ3PT1kDLJkq4cbbY2xnDPrL8vy                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xbc4bde885572f3c99395c6072fb75cd12abd37136c61ec0fd5da64e369eb748d                 │
│  │ Version: 1                                                                                    │
│  │ Digest: cLCaBYAvexV8i42t2PANSL7V3CGU5qnw7LaBouVgvmC                                           │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xf2b3b734ba050d6386735339a859e61dcf50030a119c7cf8e68d26230b97dda6 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8822680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
