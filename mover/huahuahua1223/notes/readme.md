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

# task4
sui move new rock_paper_scissors
cd .\rock_paper_scissors\
sui move build

sui client publish --skip-dependency-verification

<!-- 铸币 -->
```bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x4e393fad36baba534f8cbfa9852665c49a69be64cf5b82576f267007e187d036::huahuahua1223_faucet_coin::HUAHUAHUA1223_FAUCET_COIN --args 0x2ff9778c2563fa0abcc4357950c788a4ae6184c8fd17eb39d4a094feb184246b 50000000000 0xfcaab3c6b0758f32b8e6782a23ab10a59ff0884a0785cd3d8ee391ccf96ca50a
```

<!-- deposit -->
```bash
sui client call --package 0xa6a77abc39f150237a73c656f044f0cdb1ad14462eead9b383a3dd6130f23ef1 --module rock_paper_scissors --function deposit --args 0x197f4b839f76a3fe70ffa231f943e2af5b3cc4ace5ec8218eda006a6ea10eb51 0x46853f0febc06db8564ff9e30cbc96f009cdec0414bab3191cd3fdb6ad4ae06d --gas-budget 10000000
```

<!-- withdraw -->
代币精度为8，所以20 0000 0000就是20个代币
```bash
sui client call --package 0xa6a77abc39f150237a73c656f044f0cdb1ad14462eead9b383a3dd6130f23ef1 --module rock_paper_scissors --function withdraw --args 0x197f4b839f76a3fe70ffa231f943e2af5b3cc4ace5ec8218eda006a6ea10eb51 0x6f912e2160ef32589ad4ddcf3a4b46e4b088ac6bc8981f21bcce21023c45cb40 500000000 --gas-budget 10000000
```

<!-- play -->
```bash
sui client call --package 0xa6a77abc39f150237a73c656f044f0cdb1ad14462eead9b383a3dd6130f23ef1 --module rock_paper_scissors --function play --args 0x197f4b839f76a3fe70ffa231f943e2af5b3cc4ace5ec8218eda006a6ea10eb51 1 0x35e6f217432027ba35d9f64e994f2334f63bc15c0526e8cd75e587d2642ca49a 0x8 --gas-budget 10000000
```

# task5
sui move new my_swap
cd .\my_swap\
sui move build

一个池子存储两种代币，存储和管理员提取的接口，以及A代币和B代币互相兑换的接口

sui client publish --skip-dependency-verification

- my_coin::HUAHUAHUA1223_COIN
```bash
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0x4e393fad36baba534f8cbfa9852665c49a69be64cf5b82576f267007e187d036::huahuahua1223_coin::HUAHUAHUA1223_COIN --args 0xeb347cf0d593756d04a7f56eb7d71864ecc1b0d4db4f131dc58d8c735581d5e6 10000000000 0xfcaab3c6b0758f32b8e6782a23ab10a59ff0884a0785cd3d8ee391ccf96ca50a
```

# task6
## 初始化项目
1. 用dapp-kit脚手架创建项目
npm create @mysten/dapp
选择 `react-client-dapp`

2. 下载依赖
cd client_dapp
pnpm i --save navi-sdk 
pnpm i

修改`main.tsx`中的网络配置为`mainnet`

## 部署合约
在move包下启动命令行
sui move build
sui client publish --skip-dependency-verification
复制得到的packageid到`src/constants.ts`里面

## 运行项目
在项目根目录下运行
pnpm dev
