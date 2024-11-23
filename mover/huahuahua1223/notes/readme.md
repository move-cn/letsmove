# task1
1. sui安装
sui --version

2. 安装IDE，vscode插件

3. 安装钱包


4. 运行hello_move
创建项目
```shell
sui move new hello_move
```
发布上链
`cd hello_move`

sui move build
sui move test

查看当前地址
```shell
sui client addresses
```

获取测试sui
```shell
sui client faucet
```

查看余额
```shell
sui client gas
```

部署合约
```shell
sui client publish --gas-budget 100000000
```



事务数据、事务效果、事务块事件、对象更改和余额更改


# task2
## 1. 创建项目
sui move new my_coin
cd .\my_coin\
空编译
sui move build

## 2. 测试网部署
```bash
sui client publish --skip-dependency-verification
```
```bash
sui client call --help
```

调用铸造coin模块的 mint_and_transfer 函数,`0x2`是coin模块的包
sui client call --package 0x2
--module coin
--function mint_and_transfer
--type-args packageID::模块名::模块
--args TreasuryCap的object id 铸造数量 接收地址

- my_coin::HUAHUAHUA1223_COIN
```bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x7caf338071535a6f0df38211d34cd475b4c5ae3958b591ffb967b947cf6b787b::huahuahua1223_coin::HUAHUAHUA1223_COIN --args 0x02ca6c177ab698e12e374270299c32019aaac562f37d20f5c108fe47b90d0daf 10000000000 0xfcaab3c6b0758f32b8e6782a23ab10a59ff0884a0785cd3d8ee391ccf96ca50a
```

- my_coin::HUAHUAHUA1223_FAUCET_COIN
```bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x7caf338071535a6f0df38211d34cd475b4c5ae3958b591ffb967b947cf6b787b::huahuahua1223_faucet_coin::HUAHUAHUA1223_FAUCET_COIN --args 0x4b543b18ce5f903d7bf8c63aaacacb63db414110bc696ddd058fdda2f0e4dcba 10000000000 0xfcaab3c6b0758f32b8e6782a23ab10a59ff0884a0785cd3d8ee391ccf96ca50a
```

## 3. 主网部署
添加主网
```bash
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
```

切换到主网
```bash
sui client switch --env mainnet
```

查看所有环境
```bash
sui client envs
```

查看当前激活的地址
```bash
sui client active-address
```

sui client publish --skip-dependency-verification

- my_coin::HUAHUAHUA1223_COIN
```bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x4e393fad36baba534f8cbfa9852665c49a69be64cf5b82576f267007e187d036::huahuahua1223_coin::HUAHUAHUA1223_COIN --args 0xeb347cf0d593756d04a7f56eb7d71864ecc1b0d4db4f131dc58d8c735581d5e6 10000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

- my_coin::HUAHUAHUA1223_FAUCET_COIN
```bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x4e393fad36baba534f8cbfa9852665c49a69be64cf5b82576f267007e187d036::huahuahua1223_faucet_coin::HUAHUAHUA1223_FAUCET_COIN --args 0x0b1d96bcc48a001596fd1b8a98c9166f8653aee9888a12d221e807c0f5be0009 10000000000 0xfcaab3c6b0758f32b8e6782a23ab10a59ff0884a0785cd3d8ee391ccf96ca50a

sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x4e393fad36baba534f8cbfa9852665c49a69be64cf5b82576f267007e187d036::huahuahua1223_faucet_coin::HUAHUAHUA1223_FAUCET_COIN --args 0x0b1d96bcc48a001596fd1b8a98c9166f8653aee9888a12d221e807c0f5be0009 10000000000 0xba05e5ff69321ed26d686dc08ecb9df43113139f6483893740b35a8361c6c4a7
```


# task3
## 1. 创建项目
sui move new my_nft
cd .\my_nft\
sui move build

[nft对象标准](https://docs.sui.io/standards/display)

部署合约
```bash
sui client publish --skip-dependency-verification
```