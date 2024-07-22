curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x40d6176f07920442d66daa3b7bc7ce6639cf35823074cf79dc618e2d422fc6e4"
    }
}'