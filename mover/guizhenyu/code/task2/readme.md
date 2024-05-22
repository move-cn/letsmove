## 交易记录查询
* [发布my Coin ](https://suivision.xyz/coin/0x48f4d73684f9b2bc455175dc8e51c43fc6770580569715b29d0fddd9ee7a8f64::guizhenyu_coin::GUIZHENYU_COIN)
* [发布Faucet Coin](https://suivision.xyz/coin/0xd639970703f5a268c1c1a3c87e939e0771f173c81037a3cf79455c042cc5714a::guizhenyu_faucet_coin::GUIZHENYU_FAUCET_COIN)
* [转账My Coin](https://suivision.xyz/txblock/DsEBrYWaqsaWDyz5gs4Rk777jmwVKjgLeZQFxzWP3hnV)


## 重要操作过程
### 把自定义的coin转给钱包地址为： 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
   
export PackageId=0x48f4d73684f9b2bc455175dc8e51c43fc6770580569715b29d0fddd9ee7a8f64
export TreasureCap=0x42e17a1cbe0b5e8d5975388c5020a0e32a204c264bf462720f7e587165849fe0
sui client call --package $PackageId  --module guizhenyu_coin --function mint --args $TreasureCap 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

### 把自定义的faucet_coin转给钱包地址为： 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
export PackageId=0xd639970703f5a268c1c1a3c87e939e0771f173c81037a3cf79455c042cc5714a
export TreasureCap=0xc1f938fda299dd89623dce8d481e1b8daca975a4ea3ff43f53abca47f11d15b6

sui client call --package $PackageId  --module guizhenyu_faucet_coin --function mint --args $TreasureCap 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000


## 本期学习心得
### 怎么上主网
    1. 到sui官网上右上角点击选择mainnet, 然后copy一下： 
       https://sui-mainnet-endpoint.blockvision.org
    2. 把该地址添加到本地的env中, 注意在地址最后加上‘:443’
       sui client new-env --alias mainnet --rpc https://sui-mainnet-endpoint.blockvision.org:443
    3. 切换到主网
       sui client switch --env mainnet
### 发布自定义coin后，怎么给0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 转coin
    本地的钱包地址在主网上是没有sui币的，没有sui币，就没法支付gas费，也就转不了coin
    任务一完成，奖励已经到账了，但是那个钱包地址目前在谷歌浏览器的插件上，我本能的想把那个钱包登录到本地
    所以开始操作，找了很多资料，没有成功，后面研究看，应该可以的。
    后来换了一种思维，把奖励钱包里的sui币，转给本地钱包。后来就可以完成转coin的操作了

### coin与faucet coin的区别
    自己是区块链小白，这个问题很是困扰
    我自己后来通过操作，来验证的：
    coin是只能由发币人来进行mint的操作
    而faucet是任何人都可以进行mint
