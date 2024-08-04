curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x2f20388da9065622763bd9d02d1868c8a93f8ee59109145e40dce6118f73ef8f"
    }
}'/