
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x1e9c6ec8305a1751bc4ac1d47f9d3c5586e04652aa96653d78acc67bf1e6e373"
    }
}'