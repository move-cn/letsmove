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

# Task3
1. 发布合约 `sui client publish --gas-budget=20000000`
   ![img/3_0.png](img/3_0.png)
2. 创建 nft `sui client call --function mint_to_sender --module my_nft --package $PACKAGE_ID --args "DiHuangXia" "github DiHuangXia profile" "https://github.com/DiHuangXia" --gas-budget 20000000`
   * 拿到 nft 的 object id
     ![img/3_1.png](img/3_1.png)
   * 查看 nft 所有者，与当前钱包的地址是一致的 `sui client object $NFT_ID`
     ![img/3_2.png](img/3_2.png)
3. 将 nft 发送出去 `sui client call --function transfer --module my_nft --package $PACKAGE_ID --args $NFT_ID $RECIPIENT_ADDRESS --gas-budget 20000000`
   * 拿到 hash
     ![img/3_3.png](img/3_3.png)
   * 查看 nft 拥有者 `sui client object $NFT_ID`，与上述接收者一致
     ![img/3_4.png](img/3_4.png)
     
   