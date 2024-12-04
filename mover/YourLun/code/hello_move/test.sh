curl --location --request POST 'https://faucet.testnet.sui.io/gas'
--header 'Content-Type: application/json'
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xfbcb6375a67d48a4d68e13b96f92235acb1f61ef6287f2b3c7eaa14cd3e230cb"
    }
}'