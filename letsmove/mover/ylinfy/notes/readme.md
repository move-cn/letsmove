#### task 1 完成 hello_move 合约的部署

- 配置环境

```cmd
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install all linux prerequsites
sudo apt-get update
sudo apt-get install curl git-all cmake gcc libssl-dev pkg-config libclang-dev libpq-dev build-essential

# install sui binaries from source
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui

# everything is ready if it shows sui latest version
sui --version
```

- 新建 hello_move 合约

```cmd
sui move new hello_move
```

- 领水并部署上测试网

```cmd
# sui client --help, to learn all the important cmd
# sui client faucet --help
sui client faucet # default with active address on active network
cd hello_move
sui client publish 
```



#### task 2 完成 my coin 和 my faucet coin 部署

- 新建 move_coin 合约并部署

```cmd
# new smart contract
sui move new move_coin

# add mainnet and switch to mainnet
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
sui client switch --env mainnet

# deploy on mainnet
sui client publish --gas-budget 50000000
```

- 转帐

```cmd
# find PACKAGE_ID, MY_COIN_ID, FAUCET_COIN_ID in first step, and export them and the recipient address
export PACKAGE=0x7b2e216698fc50216d1339c37a576e427b083b1e983e10658d9756b456556805
export COIN=0xf314a6041a2608aa252095cf3fbc6a1fc86af61e4a6f9d448c3e39a9d3e17014
export FAUCET_COIN=0xd697c47f5388e77d7429a1e9bff73d4ee23dae76afa080faf4ca3067638bfb53
export RECIPIENT=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

# sui client call --help, to learn how to call a specific function
# ylinfy: the module name
# mint: the function name
sui client call --package $PACKAGE --module ylinfy --function mint --args $COIN 100000000 $RECIPIENT --gas-budget 30000000
```



#### task 3 完成 move nft 

- 铸造NFT并转移

```cmd
# export package id 
export PACKAGE=0xf4e4754da5ede3b693fffe332a61ede86b21ac3ca439fe9546624759955e7799
export RECIPIENT=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

# sui client call 
sui client call --package $PACKAGE --module move_nft --function mint_for --args $RECIPIENT 
# NFT Object ID: 0x751d9f216d3bfa395508f2b2263ab4562791ac20af0b08270a97888692534279
# Transfer TX: 8Hnp4mg4FKZGm47SeufVTJMXHSVpqVPZpVh7wiFk6BsY
```

