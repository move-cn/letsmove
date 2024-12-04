```bash
export COIN_A='0xcc39bf2742ec5cbbfbea8ba995e3e194a5a1a37dccd7a44b33e88aca4458d02b::syyani_coin::SYYANI_COIN'
export COIN_B='0xcc39bf2742ec5cbbfbea8ba995e3e194a5a1a37dccd7a44b33e88aca4458d02b::syyani_faucet_coin::SYYANI_FAUCET_COIN'

# 0x2::coin::CoinMetadata<0xcc39bf2742ec5cbbfbea8ba995e3e194a5a1a37dccd7a44b33e88aca4458d02b::syyani_coin::SYYANI_COIN>
# 0x2::coin::TreasuryCap<0xcc39bf2742ec5cbbfbea8ba995e3e194a5a1a37dccd7a44b33e88aca4458d02b::syyani_faucet_coin::SYYANI_FAUCET_COIN>

export PACKAGE_ID=0xcc39bf2742ec5cbbfbea8ba995e3e194a5a1a37dccd7a44b33e88aca4458d02b
export COIN_A_TREASURY_CAP_ID=0x5c059dd1de7148e38961d2d4cd1a791e9fa0937179cfaf99df78c6180e875ec2
export COIN_B_TREASURY_CAP_ID=0x9f36a486c227041a4b9fca2a785b0ac805b8b141114367c48299c096da53e37d
export MY_ADDRESS=0xfc564ea4a511ed9316a0fddfddd528c75201d6eb5ac0571914440c915d8aeae2
```

## 铸币

```bash

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module syyani_coin --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --gas-budget 7500000 --package $PACKAGE_ID --module syyani_faucet_coin --function mint --args $COIN_B_TREASURY_CAP_ID 1000 $MY_ADDRESS
```
输出

```bash
# syyani_coin
export COIN_A_ID_1=0x232edcc6f81e2ef05872c181b5310bf1269ea140ba3a86c9ccfe9d5a2669029d

# syyani_faucet_coin
export COIN_B_ID_1=0x72b50558cc6b5dd0539120bbbf3de6d5e94d03537cadb093c546d528fadaad20
```

## 构建流动性池

将前面铸造的 syyani_coin 1 和 syyani_faucet_coin 1 拿来构建流动性池
```bash
export SPACKAGE_ID=0x755c2a42d8035ff2a759fe702af111ac17e827044def8f8a17e22aea868b1b6f
```

```bash
sui client call --gas-budget 7500000 --package $SPACKAGE_ID --module syyani_swap \
    --function create_pool --type-args $COIN_A $COIN_B \
    --args $COIN_A_ID_1 $COIN_B_ID_1
```

Transaction Digest: CTE8DB6PA3gKcGGsRaf7GEtdfyaCRCZbHf5Kq5kToR6W

## 交换

先铸造币

```bash
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module syyani_coin --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $MY_ADDRESS
```
得到
```bash
export COIN_A_ID_2=0xb586ae64f21f71330d921f9bcd73686ece6387c7bcec4409dacb9443d75b4b4c
```

用一枚代币syyani_coin，向流动性池子发起交易获得 syyani_faucet_coin
```bash
export POOL_ID=0xfa4a1cc8830307772ac7ccd576b38ee97e3d56bf67f2136af87e60303d6dd2bb
```

```bash
sui client call --gas-budget 7500000 --package $SPACKAGE_ID --module syyani_swap \
    --function swap_a_to_b --type-args $COIN_A $COIN_B \
    --args $POOL_ID $COIN_A_ID_2
```

BHcfEs1tq1gvxkP8xtjWcjSBL7pDe6MVBZAwJj7ANGCP
