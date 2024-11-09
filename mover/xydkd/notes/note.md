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
│  ┌──                                                                                             │
│  │ PackageID: 0x6bdd353ddc9ac4234f9445fa32c66dfcd5b1da5070c7a22ee7e7ca86e6bac0c4                 │
│  │ Version: 1                                                                                    │
│  │ Digest: DEENx3YeHdNmjeXYadbm4ehuKfJNwXwgK4e7aScd8KRZ                                          │
│  │ Modules: hello                                                                                │
│  └──                         

sui client call