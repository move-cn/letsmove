curl --location --request POST 'https://faucet.testnet.sui.io/gas'
-- header 'Content-Type: application/json'
-- data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x3e6797f7b89ecbe1e3959fec1a6ce09f3f6e727bd790c5200aef1cd0a62b88dc"
    }
}'