Sui Move 学习：Sui Client PTB CLI 常用命令
 1
常用Sui命令总结

常用Sui命令总结

创建钱包
创建新钱包

sui client new-address ed25519

查看钱包地址

sui client addresses

切换当前使用的地址

sui client switch --address <YOUR_ADDRESS>

keytool
查看别名

sui keytool list -s

使用别名导出私钥
sui keytool export --key-identity [别名]

查看私钥

cat sui.keystore

私钥转bech32格式
sui keytool convert

查看环境
sui client envs



image.png

切换环境
sui client switch --env testnet

部署合约
编译合约

sui move build

运行测试

sui move test

发包之前执行此操作，避免发布失败，消耗不必要的gas

sui client verify-bytecode-meter 检查字节码是否超过规定值

添加gas 预算 可防止发布失败导致浪费

sui client publish --gas-budget 100000

部署合约后，记录 packageid

查看交易事件

sui client event --package <new_package_id>

转sui
sui client transfer-sui --to <钱包地址> --sui-coin-object-id <your coin id> --gas-budget 100000000

合约更新

合约更新不允许修改现有字段，函数。只能新增。 不建议更新

sui client upgrade --gas-budget 500000000 --upgrade-capability <upgrade object id>

--coin
查看代币信息
sui client object <coin_id>

--spilt coin
task4 可以用到，⚠️ 需要是同一个package id 下 铸造的coin

1.指定coin 额度分割

使用sui client balance --with-coins 查看执行前 coin 的余额
image.png

#!/bin/bash

# 给脚本添加执行权限 正确执行结果
chmod +x splitcoin.sh

# 分割代币的命令 指定大小
sui client split-coin --gas-budget 50000000 \
   --coin-id  0x13cbc3915002f05d5a72fbd28e7080ec4c869dc8dff30f18f049d7a8c228b3b2 \
    --amounts 1000000 100000 900000
执行命令后，分割成指定大小了。
image.png

2.指定数量分割coin



image.png
分割前查询☝️

#分割 fauct_coin  分割五个
sui client split-coin --gas-budget 50000000 \
   --coin-id  0xc03e9ad9e1ce8f5ccbf0b9b3522247881630b93ba604e378c2f7b3d8959fb1c0 \
    --count 5
执行后faucet coin的大小👇


image.png

使用 sui client split-coin --help查看 最新的命令操作（此处查阅到的命令未来可能会变，建议自行查阅）

image.png

⚠️错误示范 警惕


image.png

报错：

image.png

多参数执行，拼写错误导致。
image.png

gas 不够，加上—gas-budget 750000 设置预算。

查阅了官网的- -spilt coin 命令操作，有如下的错误，这些我常未找到解决的办法，有知道的佬们可以留言，感激不尽🥹。

sui client ptb --split-coins 0x13cbc3915002f05d5a72fbd28e7080ec4c869dc8dff30f18f049d7a8c228b3b2 [1000000]  

该命令报错：error：zsh: no matches found: [1000000]
image.png

