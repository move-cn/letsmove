# Task 1
1. 创建钱包地址：`sui client new-address ed25519` 。保管好助记词，拥有了助记词就相当于拥有了银行账户密码。
   ![img/1_0.png](img/1_0.png)
2. 获取测试网的 sui tokens：`curl --location --request POST 'https://faucet.testnet.sui.io/gas' \
   --header 'Content-Type: application/json' \
   --data-raw '{"FixedAmountRequest":{"recipient":"<WALLET ADDRESS>"}}'` 
   ![img/1_1.png](img/1_1.png)
3.  发布合约：`sui client publish --gas-budget=20000000`
   ![img/1_2.png](img/1_2.png)

# Task2
1. 发布合约 `sui client publish --gas-budget=40000000`
   * 拿到 faucet_coin 的 object id ![img/2_0.png](img/2_0.png)
   * 拿到 my_coin 的 object id ![img/2_1.png](img/2_1.png)
   * 拿到 my_coin 与 faucet_coin 的 package id ![img/2_2.png](img/2_2.png)
2. 转账 `sui client call --function mint --module my_coin --package $PACKAGE_ID --args $MY_COIN 100000000000 $ADDRESS --gas-budget 20000000`
   * 拿到 hash ![img/2_3.png](img/2_3.png)