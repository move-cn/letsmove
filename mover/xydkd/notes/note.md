## 安装环境
brew install sui

## 更新环境
brew upgrade rust
rustup update stable
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui


## 1.查看地址
sui client addresses
╭───────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias         │ address                                                            │ active address │
├───────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ fervent-zircon│ 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 │ *              │
╰───────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
## 2.获取gas
sui client faucet --address 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.

## 3.查看gas
sui client gas
╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x1ed8d3ce7b936205cae02b01e0b2581d62ecdf2abaec42208ba6a7e5b06e5e57 │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯
## 4.新建项目
sui move new hello_move

## 5.发布
sui move build
sui client publish --gas-budget 50000000
Published Objects:                                                                               │
sui client call

# 6.发币
Transaction Digest: CUzNMqiwysnhYYBfAbcg88s6BAkcyChUsXm5hwnhPzAB
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                   │
│ Gas Owner: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0f2d31c9887250677ddee2c858a4f041d3c8c66e40e14af861b839f36e38aa84                                    │
│  │ Version: 412692390                                                                                        │
│  │ Digest: npJZY1zNbcGmHXg2S4LDYBvMuqbMoSefXUCEb5Khtxu                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062" │ │
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
│    yXeYvd57moSa6rEJTdygicJAo0HWAkWi9G/7wVyxTe2/BN5pl8W96Pqw5fICvQZMN+37yJa7jPl1yMIx3EuFCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CUzNMqiwysnhYYBfAbcg88s6BAkcyChUsXm5hwnhPzAB                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 579                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x136f02ff814bb100b4d39d0dae658272183d1c9ca1142368a7c3ce0f0386a365                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: ARMww3edf7c3DApUNzdd3E5BfEQ4s4rZNxY7fzpsbyZm                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5bf090d0dca30b9ecfb202f7b2f391ef0de06ff115afcb6337ba2c099cf736c1                         │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )  │
│  │ Version: 412692391                                                                             │
│  │ Digest: 2bLqMPbD2ZQQeLBE6jQ8SKknNVpgWFQj4iQXGoQnL13u                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x63be22dfd15840a6cc6078ddf71199390f62b8f7e3b2d5b81e7f0e35d4c01e59                         │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )  │
│  │ Version: 412692391                                                                             │
│  │ Digest: HdTZgTQ6znyVq87ZJkBDBcHxhbCjXBAkDHwcT2VCneFb                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x78505a81c537b48266f806107d954fa51b4fee8b83f66389da684e242e722d10                         │
│  │ Owner: Shared( 412692391 )                                                                     │
│  │ Version: 412692391                                                                             │
│  │ Digest: 2uGd9GhQgccmt5dvsonYKMBzRcFGCnQpc9T9HwArQYq8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9aee69ca93c05910bc6e5069a329dfa2ceec1d4476a100c3c5bf9234114802ee                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 412692391                                                                             │
│  │ Digest: E22qimyGRGPsLu8HrJG3jzCXj5XTyac5xhkLoFxzxEjm                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9e462120410299f09e5a580b31040615973f4043468cbe0db1c258e3d48f9f91                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 412692391                                                                             │
│  │ Digest: ECbDnffSvXpmJZ82cuepJARDRqekpKYSqTjKm2JLs1Qc                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0f2d31c9887250677ddee2c858a4f041d3c8c66e40e14af861b839f36e38aa84                         │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )  │
│  │ Version: 412692391                                                                             │
│  │ Digest: J33me9j2umWqX2yurCDW3ta4PYksGuEZG4NeYuQxCggT                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0f2d31c9887250677ddee2c858a4f041d3c8c66e40e14af861b839f36e38aa84                         │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )  │
│  │ Version: 412692391                                                                             │
│  │ Digest: J33me9j2umWqX2yurCDW3ta4PYksGuEZG4NeYuQxCggT                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 22169200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    49puDQZwHRnu7zYoARCjco1dFKMiK7LVSS8B5Si1yVdh                                                   │
│    6Jn7o6Sw98VJGY2ioVwA69hpEFSxTSTqgg3KTokm34PP                                                   │
│    8MkMyu5cseLwqyWDwg947q7U2d7ipSoGu9LZQh744JRJ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x5bf090d0dca30b9ecfb202f7b2f391ef0de06ff115afcb6337ba2c099cf736c1                                                     │
│  │ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                                       │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )                                    │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                             │
│  │ Version: 412692391                                                                                                               │
│  │ Digest: 2bLqMPbD2ZQQeLBE6jQ8SKknNVpgWFQj4iQXGoQnL13u                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x63be22dfd15840a6cc6078ddf71199390f62b8f7e3b2d5b81e7f0e35d4c01e59                                                     │
│  │ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                                       │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x136f02ff814bb100b4d39d0dae658272183d1c9ca1142368a7c3ce0f0386a365::mycoin::MYCOIN>           │
│  │ Version: 412692391                                                                                                               │
│  │ Digest: HdTZgTQ6znyVq87ZJkBDBcHxhbCjXBAkDHwcT2VCneFb                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x78505a81c537b48266f806107d954fa51b4fee8b83f66389da684e242e722d10                                                     │
│  │ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                                       │
│  │ Owner: Shared( 412692391 )                                                                                                       │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x136f02ff814bb100b4d39d0dae658272183d1c9ca1142368a7c3ce0f0386a365::faucetcoin::FAUCETCOIN>   │
│  │ Version: 412692391                                                                                                               │
│  │ Digest: 2uGd9GhQgccmt5dvsonYKMBzRcFGCnQpc9T9HwArQYq8                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x9aee69ca93c05910bc6e5069a329dfa2ceec1d4476a100c3c5bf9234114802ee                                                     │
│  │ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x136f02ff814bb100b4d39d0dae658272183d1c9ca1142368a7c3ce0f0386a365::faucetcoin::FAUCETCOIN>  │
│  │ Version: 412692391                                                                                                               │
│  │ Digest: E22qimyGRGPsLu8HrJG3jzCXj5XTyac5xhkLoFxzxEjm                                                                             │
│  └──                                                                                                                                │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x9e462120410299f09e5a580b31040615973f4043468cbe0db1c258e3d48f9f91                                                     │
│  │ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                                       │
│  │ Owner: Immutable                                                                                                                 │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x136f02ff814bb100b4d39d0dae658272183d1c9ca1142368a7c3ce0f0386a365::mycoin::MYCOIN>          │
│  │ Version: 412692391                                                                                                               │
│  │ Digest: ECbDnffSvXpmJZ82cuepJARDRqekpKYSqTjKm2JLs1Qc                                                                             │
│  └──                                                                                                                                │
│ Mutated Objects:                                                                                                                    │
│  ┌──                                                                                                                                │
│  │ ObjectID: 0x0f2d31c9887250677ddee2c858a4f041d3c8c66e40e14af861b839f36e38aa84                                                     │
│  │ Sender: 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062                                                       │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                       │
│  │ Version: 412692391                                                                                                               │
│  │ Digest: J33me9j2umWqX2yurCDW3ta4PYksGuEZG4NeYuQxCggT                                                                             │
│  └──                                                                                                                                │
│ Published Objects:                                                                                                                  │
│  ┌──                                                                                                                                │
│  │ PackageID: 0x136f02ff814bb100b4d39d0dae658272183d1c9ca1142368a7c3ce0f0386a365                                                    │
│  │ Version: 1                                                                                                                       │
│  │ Digest: ARMww3edf7c3DApUNzdd3E5BfEQ4s4rZNxY7fzpsbyZm                                                                             │
│  │ Modules: faucetcoin, mycoin                                                                                                      │
│  └──                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7e6853bd372c9491c980356ada59368f2dfb94e91cc5da4b5b2f1eb419513062 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -21941080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 8.切换开发网
sui client new-env --alias=devnet --rpc https://fullnode.devnet.sui.io:443
sui client switch --env devnet

# 9.切换主网
sui client new-env --alias mainnet --rpc https://sui-mainnet.nodeinfra.com:443
sui client switch --env mainnet

sui client publish --gas-budget 50000000 --skip-dependency-verification