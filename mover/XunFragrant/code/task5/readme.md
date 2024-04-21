参考了 https://xlog.yuheng.site/letsmove-task5

## 过程解释
 
先把 coin_a 和coin_b发布到mainnet

在得到的交易结果中，找到 `Package ID`，Coin_A 的 `TreasuryCap ID` 和 Coin_B 的 `TreasuryCap ID`，将其导出到环境变量。
同时将自己的钱包地址也导出为变量。

```bash
export COIN_A='0xe0699e530488cbae1a6cb6a7f1dfaa359b9e829f10748aa7609a421f56feb45b::coin_a::COIN_A'
export COIN_B='0xe0699e530488cbae1a6cb6a7f1dfaa359b9e829f10748aa7609a421f56feb45b::coin_b::COIN_B'

export PACKAGE_ID=0xe0699e530488cbae1a6cb6a7f1dfaa359b9e829f10748aa7609a421f56feb45b
export COIN_A_TREASURY_CAP_ID=0x1d7035a29822a6c2243034cb06c143e176b18ef97a7337b16a67ad4a95954164 
export COIN_B_TREASURY_CAP_ID=0x90c31da9ecf9c0d7c1103e8c691aecc404f35bd9fbdcaa5c8dff0bff339ef690
export MY_ADDRESS=0x06a253c33c90c9c4bd20bb129a2cad060b0434446c71a5b58571ec254ad4154c
```

## 铸币

提前铸造不同数值的 COIN_A 和 COIN_B，因为仅作测试使用，所以两个代币的 decimals 设置为 3，方便后续识别。

```bash
# mint COIN_A
# 根据需要，可以多次少量铸币，方便后续调用
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_a --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_b --function mint --args $COIN_B_TREASURY_CAP_ID 1000 $MY_ADDRESS
```

将输出记录下来

```bash
# 1 coin A
export COIN_A_ID_1=0x24eef8c76f997cb3f0abb95d8785378f5cdd664a2c78b98cbaa81e42f443d906

# 1 coin B
export COIN_B_ID_1=0x20441885b6905d63b40389642febbf20816dee1f4ad7939538fcb95f98f339ed
```

## 构建流动性池

将前面铸造的 coin a 1 和 coin b 1 拿来构建流动性池

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module xunfragrant_swap \
    --function create_pool --type-args $COIN_A $COIN_B \
    --args $COIN_A_ID_1 $COIN_B_ID_1
```

Transaction Digest: F9G2jKsNAyfCp3Kk2LHb19Xq3Z74hfW1TftXdYeBTvdo
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x06a253c33c90c9c4bd20bb129a2cad060b0434446c71a5b58571ec254ad4154c                      │
│ Gas Owner: 0x06a253c33c90c9c4bd20bb129a2cad060b0434446c71a5b58571ec254ad4154c                   │
│ Gas Budget: 7500000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x5f16f7bf6c1f5dc2163a44e35e0e19df22caa36998cbaccb72ab14efd3ef3cd0                       │
│  │ Version: 94800595                                                                            │
│  │ Digest: uiX78Q1MLsHAA2geXoRQYy2G1xrKr8a9TXcKWYA4uEz                                          │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x24eef8c76f997cb3f0abb95d8785378f5cdd664a2c78b98cbaa81e42f443d906 │ │
│ │ 1   Imm/Owned Object ID: 0x20441885b6905d63b40389642febbf20816dee1f4ad7939538fcb95f98f339ed │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────╮     │
│ │ Commands                                                                                │     │
│ ├─────────────────────────────────────────────────────────────────────────────────────────┤     │
│ │ 0  MoveCall:                                                                            │     │
│ │  ┌                                                                                      │     │
│ │  │ Function:  create_pool                                                               │     │
│ │  │ Module:    xunfragrant_swap                                                          │     │
│ │  │ Package:   0xe0699e530488cbae1a6cb6a7f1dfaa359b9e829f10748aa7609a421f56feb45b        │     │
│ │  │ Type Arguments:                                                                      │     │
│ │  │   0xe0699e530488cbae1a6cb6a7f1dfaa359b9e829f10748aa7609a421f56feb45b::coin_a::COIN_A │     │
│ │  │   0xe0699e530488cbae1a6cb6a7f1dfaa359b9e829f10748aa7609a421f56feb45b::coin_b::COIN_B │     │
│ │  │ Arguments:                                                                           │     │
│ │  │   Input  0                                                                           │     │
│ │  │   Input  1                                                                           │     │
│ │  └                                                                                      │     │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────╯     │
│                                                                                                 │
│ Signatures:                                                                                     │
│    Xuk5eoBPtDG2uiLFT//Vyf5s7b0mkaq/5KYZPberXh+mC0lnUbfdPnOr6MEDNmOFDtCNMtwlXUcpfjT3yhKhDw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
