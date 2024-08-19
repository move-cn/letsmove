#!/bin/bash

recipient=$1
curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw "{
    \"FixedAmountRequest\": {
        \"recipient\": \"${recipient}\"
    }
}"
