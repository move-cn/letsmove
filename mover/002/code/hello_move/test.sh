curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xea8d4d92129035ab7ce1b987b12143144f94f612f577d73b4d8ad93c1d1fc3d4"
    }
}'