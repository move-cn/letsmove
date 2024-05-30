# operation log

> coin info 

## 领取

``` bash
sui client call --package 0x3c205d3fb89b5e60fe89a75fcebc11a435b0844a385647a25cb806149ba70050 --module meepo_coin --function mint --args 0x6343e83c8e8b4c5cc0fa7fe5bf86443109a301c35e51ed5d18efc61b8bdc487a 1000000000000 0x49ac87502a3b3c47ae452d7ea4f50cb5b117b55b82ea31603e7741b44923a583 --gas-budget 100000000
```

1. meepo_coin 
  **0x3c205d3fb89b5e60fe89a75fcebc11a435b0844a385647a25cb806149ba70050::meepo_coin::MEEPO_COIN**
2. faucet_coin
  **0x3c205d3fb89b5e60fe89a75fcebc11a435b0844a385647a25cb806149ba70050::meepo_faucet::MEEPO_FAUCET**

3. pool object id
  **0xd54f10c58d902889f11056bc33692dfbac0a0e93cd184210bfa58007b01ae2fb**

后面的操作都是通过在 [testnet.suivision.xyz](https://testnet.suivision.xyz/package/0x7168e5002c7feda0447c7c1ab4d475bca7d79a54c1562ff67bad427b815fa6fe?tab=Code) 网页上面操作的

## TODO 部分存入的思考

现在的存币只能存入账户里面所有的币，没有找到拆分的逻辑。 如果要支持拆分， deposite 的时候应该传入一个数量，然后通过数量在账户里面去获取， 拆分， 然后存入池子


