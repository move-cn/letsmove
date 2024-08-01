curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0xc0d67d6436a498dbd16ece05d179c134089fc7e2cd81b038f08e6daaa594026c"
    }
}'