# sui 操作命令


更新 **rust**

``` sh
rustup update stable
```

更新 sui

``` sh
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

获取测试 sui

``` sh
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x49ac87502a3b3c47ae452d7ea4f50cb5b117b55b82ea31603e7741b44923a583"
    }
}'

```