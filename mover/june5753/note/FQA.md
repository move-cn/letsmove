# sui client addresses
获取到的address
0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d

curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
--header 'Content-Type: application/json' \
--data-raw '{"FixedAmountRequest": {"recipient": "0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d"
}
}'

# 在 windows 中输入命令时需要转义处理 （执行成功，但是没有 gas）
curl --location --request POST "https://faucet.devnet.sui.io/gas" ^  
--header "Content-Type: application/json" ^  
--data-raw "{\"FixedAmountRequest\":{\"recipient\":\"0x8c8965f1b68176542f6ab6d4fc3e80af9477758e959dbe9bf7edbf53b4ea813d\"}}"

# 最后获取gas成功的方式
sui client faucet  