#! /bin/bash
curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x15cb53111e329d2f1216b90acf552e3a82dcbc234a672e72cdb82789ff955ff4"
    }
}'

