## task1

获取：
sui client faucet
查询：
sui client gas
发布：
sui client publish --gas-budget 5000000

提示：
Error executing transaction: Failure {
    error: "InsufficientGas",
}

提高一下gas-budget

sui client publish --gas-budget 10000000

## task2

sui client publish --gas-budget 200000000

sui client call --package 0x2bf06ebb29e1dde43fc251d90071c3fe86381abd4b5aafe23d3e33733f332480  --module joy1102_coin --function mint --args 0x17a8f8b22a02464885f5b5863a28c7739edec89924c5c00adb898138386638be 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

## task3

sui client publish --gas-budget 200000000

第一个参数传入Github名称，第二个接受者地址

sui client call --package 0xe1ea9751adcee284d32e7a1f8d5e440713d98319840e3b0a0a3af55219171ff5 --module joy1102nft --function mint_to --args "JOY1102" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000