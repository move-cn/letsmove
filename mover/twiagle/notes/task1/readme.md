sui move new hello_move
Sui = {local="/home/cleversushi/sui_projects/sui/crates/sui-framework/packages/sui-framework"}

sui client addresses
/home/cleversushi/.sui/sui_config/client.yaml

curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{
    "FixedAmountRequest": {
        "recipient": "0x575354b119bc4be704c5d5dc91bb6ce496f93726b412a430f19df93246fb2f0d"
    }
}'

sui client switch --env testnet
sui move build
sui client publish 

ref: https://docs.sui.io/references/cli/client