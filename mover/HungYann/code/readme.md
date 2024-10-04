# 任务二笔记

--- 
**说明：**

创建自己的Coin，叫做`hungyan_coin`, 管理员mint

创建水龙头叫做`hungyan_faucet`, 任何账户都可以mint 


```move
sui move new hungyan_coin
```

--- 

**所有权方法**

public_transfer: 独享对象, key + store属性

public_share_object: 共享对象, key + store属性



参考资料：https://intro-zh.sui-book.com/unit-three/lessons/4_the_coin_resource_and_create_currency.html

源代码：https://github.com/MystenLabs/sui/blob/main/crates/sui-framework/packages/sui-framework/sources/coin.move#L201


--- 

**TreasuryCap** 

TreasuryCap是一种资产，通过一次性见证模式保证是一个单体对象

--- 

**CoinMetada**

CoinMetadata是一个存储已创建的可替换代币的元数据的资源

`decimals`: 代币精确度

`name`: 代币名称

`symbol`: 货币符号

`description`: 描述

`网址`: 资源网址 

--- 

**参数含义** 


`Arg0`: object id

`Arg1`: mint数量

`Arg2`: 接收者地址

--- 

**命令行调用**

```rust
sui client call --package xxx --module hungyan_facuet --function mint --args object_id 1 account_id 
```


--- 

**切换网络** 

```
sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
```

```
sui client switch --env mainnet
```


```
sui client envs
```

# 任务三笔记

目标：构建nft并运行在主网mainnet


创建项目
```
sui move new hungyan_nft
```

切换到主网
```
sui client switch --env mainnet
```

发布项目 

```
cd hungyan_nft/

sui client publish 
```
