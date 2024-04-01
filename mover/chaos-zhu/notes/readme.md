- 开发环境：ubuntu 22.04

# hello move
## 1. chrome插件Sui钱包安装

- [Sui Wallet](https://chrome.google.com/webstore/detail/opcgpfmipidbgpenhmajoajpbobppdil)

## 2. Sui CLI安装

- a. 安装rust & cargo
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
- b. 安装sui-cli
```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

## 3. sui-cli常用指令
```shell
# 列出当前所有网络别名: devnet, testnet, mainnet
sui client envs
# 切换到测试网
sui client switch --env testnet

# 查询当前保存了密钥的地址
sui client addresses
# 查询当前启用的地址
sui client active-address
# 切换活跃地址
sui client switch --address [ADDRESS]

# 列出所拥有的 gas objects
sui client gas

# 创建新钱包地址
sui client new-address ed25519
```

- [获取测试网络SUI](https://intro-zh.sui-book.com/unit-one/lessons/1_%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83.html#%E8%8E%B7%E5%BE%97%E6%B5%8B%E8%AF%95%E7%BD%91-testnet-%E7%9A%84-sui-tokens)

## 4. Hello Move

- a. 创建一个新的项目
```shell
sui move new hello_world
# sources文件夹用于存放move文件，命名都采用RUST命名规范，下划线分割
# 配置文件 Move.toml
```

- b. 发布项目
```shell
# cd 到项目目录
sui client publish --gas-budget 10000000
```

- c. 尝试调用合约
```shell
# sui client call --package <合约地址> --module <模块名> --function <函数名> --gas-budget 10000000 --args "<参数1>, <参数2>"

sui client call --package 0xea39d5d8336007350aad11071fc936a0bd6eeef349db65479b2f2f6190b7b303 --module hello_world --function mint --gas-budget 10000000
```
