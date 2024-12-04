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

# task2 笔记
│ PackageID: 0x06fa8a1ca42dba5f343f4bf56ae6a4d67b04dfb3bceb113ea50be8bf271abb09

https://suiscan.xyz/testnet/object/0x06fa8a1ca42dba5f343f4bf56ae6a4d67b04dfb3bceb113ea50be8bf271abb09/contracts
点开上一个连接中的Last Tx Block ID后
https://suiscan.xyz/testnet/tx/Gq5Tyf3KWJ4P5mwbbFYK9Ls49nvSjN1Rgp8JJttzYiCk

# 新建 address
sui client new-address ed25519

# 飞书参考文档
https://k1tgsg1llrk.feishu.cn/docx/Ok8YdHUjuoyIAAxCKUtcfGphnxX
