
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x25afc20644338b9b1a38d0591eb318829a07fc41595c757802881c2f0636be9c"
    }
}'