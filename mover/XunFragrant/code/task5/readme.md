参考了 https://xlog.yuheng.site/letsmove-task5

## 过程解释
 
先把 coin_a 和coin_b发布到mainnet

在得到的交易结果中，找到 `Package ID`，Coin_A 的 `TreasuryCap ID` 和 Coin_B 的 `TreasuryCap ID`，将其导出到环境变量。
同时将自己的钱包地址也导出为变量。

```bash
export COIN_A='0x406de6b171affee02e927de1af230fd4f22ffe5ab65b72c20a51309cc56513da::xunfragrant_coin::XUNFRAGRANT_COIN'
export COIN_B='0x406de6b171affee02e927de1af230fd4f22ffe5ab65b72c20a51309cc56513da::xunfragrant_faucet_coin::XUNFRAGRANT_FAUCET_COIN'

export PACKAGE_ID=0x406de6b171affee02e927de1af230fd4f22ffe5ab65b72c20a51309cc56513da
export COIN_A_TREASURY_CAP_ID=0x8ddd2a45aa530f9dee8399f518cedcdb19fee025af0a9b7a56f13802a05d9e55 
export COIN_B_TREASURY_CAP_ID=0x01ff682ed995beba9469a20ea8d154683bfc44f06bdca807129ffd17f78f258e
export MY_ADDRESS=0x06a253c33c90c9c4bd20bb129a2cad060b0434446c71a5b58571ec254ad4154c
```

## 铸币

提前铸造不同数值的 COIN_A 和 COIN_B，因为仅作测试使用，所以两个代币的 decimals 设置为 3，方便后续识别。

```bash
# 根据需要，可以多次少量铸币，方便后续调用
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module xunfragrant_coin --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module xunfragrant_faucet_coin --function mint --args $COIN_B_TREASURY_CAP_ID 1000 $MY_ADDRESS
```

将输出记录下来

```bash
# xunfragrant_coin
export COIN_A_ID_1=0x2a200c25caa49030c8de7cbd0bf08afc0cad6cf6cb53fdcecea150ef0a0153e5

# xunfragrant_faucet_coin
export COIN_B_ID_1=0x9ae014384953ef4421c9a6845f27ac81810d1ff008b533f290a41e3922a201cb
```

## 构建流动性池

将前面铸造的 xunfragrant_coin 1 和 xunfragrant_faucet_coin 拿来构建流动性池
```bash
export SPACKAGE_ID=0xd8c9317e928977ef5ad20228eae539c390dedbf31b855931195fd1b0a4e72b85
```

```bash
sui client call --gas-budget 7500000 --package $SPACKAGE_ID --module xunfragrant_swap \
    --function create_pool --type-args $COIN_A $COIN_B \
    --args $COIN_A_ID_1 $COIN_B_ID_1
```

Transaction Digest: BT6ezSFMHp8KaEMxVYUxeDrmpXo1MTVuiVbgdgaAHVdu
