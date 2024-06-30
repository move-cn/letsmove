curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x9a51b1d6ffc9c00e5e50461fb759eecc9493d072b2d522c9ba12b5fa5e2047e6"
    }
}'