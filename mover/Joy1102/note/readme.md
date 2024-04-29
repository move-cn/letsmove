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