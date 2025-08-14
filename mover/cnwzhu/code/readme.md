### task1
创建第一个sui 项目 HelloMove

* 执行命令
```bash
sui move new task1
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "<YOUR SUI ADDRESS>"
    }
}'
sui client publish  --gas-budget 3000000000 --skip-fetch-latest-git-deps
```
