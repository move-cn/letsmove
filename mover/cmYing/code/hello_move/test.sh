curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x0f5005a7843e10713e51f2908ce8e1f6e3ad3b61f76ebc790dae7a0f134a8412"
    }
}'