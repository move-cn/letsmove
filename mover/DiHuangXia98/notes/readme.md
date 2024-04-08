# Task 1
1. 创建钱包地址：`sui client new-address ed25519` 。保管好助记词，拥有了助记词就相当于拥有了银行账户密码。
   ![img/1_0.png](img/1_0.png)
2. 获取测试网的 sui tokens：`curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
   --header 'Content-Type: application/json' \
   --data-raw '{"FixedAmountRequest":{"recipient":"<WALLET ADDRESS>"}}'` 
   ![img/1_1.png](img/1_1.png)
3.  发布合约：`sui client publish --gas-budget=20000000`
   ![img/1_2.png](img/1_2.png)