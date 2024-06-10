## 发布
sui client publish --gas-budget 30000000
```
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xa82092ac91809ec95687e05f64390145306f4e730c698cd9543e168c4c753fc7                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 528iPnBUGZVkmK46DzPCiLR2ub34YPpt2u4sEcDMxdyu                                          │
│  │ Modules: swap                                                                                 │
│  └──                                                                                             │
```
加入环境变量
```shell
$package = "0xa82092ac91809ec95687e05f64390145306f4e730c698cd9543e168c4c753fc7"
```

## 用户准备
```
PS F:\sui_project\509\brookbang> sui client addresses
╭─────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
│ alias       │ address                                                            │ active address │
├─────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
│ Manager     │ 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 │ *              │
╰─────────────┴────────────────────────────────────────────────────────────────────┴────────────────╯
```
加入环境变量
```shell
$Manager = "0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669"
```
## 代币准备
获取task2发布的两个代币，brookbang_coin,brookbang_faucet_coin
### brookbang_coin
```shell
sui client call --function mint --module brookbang_coin --package 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2 --args 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c 1000 $Manager --gas-budget 30000000
```
```
│ Created Objects:                                                                                                                           │
│  ┌──                                                                                                                                       │
│  │ ObjectID: 0xc5ed0d316c70d7ffe3bbda89c1c7a618d10e2d98215930b19e9a8dea7b7a0dd5                                                            │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                           │
│  │ ObjectType: 0x2::coin::Coin<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN>         │
│  │ Version: 1223463                                                                                                                        │
│  │ Digest: 4YiCnktV9H22MNrLja9mtUqxuexivx1EPbLvWbrB7X9Z                                                                                    │
│  └──                                                                                                                                       │
                                    
│  ┌──                                                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                 │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN  │
│  │ Amount: 1000                                                                                                  │
│  └──                                                                                                             │

```
加入环境变量
```shell
$coin_id = "0xc5ed0d316c70d7ffe3bbda89c1c7a618d10e2d98215930b19e9a8dea7b7a0dd5"
$coin_type = "0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN"
```
### brookbang_faucet_coin
```shell
sui client call --function mint --module brookbang_faucet_coin --package 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2 --args 0x5d8230b2b68ed9d7676bb8baad8d6dd56838c6e6d89613986324214ff8ca6a53 1000 $Manager --gas-budget 30000000
```
```
│ Created Objects:                                                                                                                                  │
│  ┌──                                                                                                                                              │
│  │ ObjectID: 0x681b302da905334c79216f92ffe8515fcd89fdf3b7a35e8d800c5c7cdf980418                                                                   │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                     │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                                  │
│  │ ObjectType: 0x2::coin::Coin<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN>  │
│  │ Version: 1223464                                                                                                                               │
│  │ Digest: EKmarzefmG4QYfBa9EGH4g1uuAHH7zjAMUB5dbzaEVXs                                                                                           │
│  └──                                                                                                                                              │

│  ┌──                                                                                                                           │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                               │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN  │
│  │ Amount: 1000                                                                                                                │
│  └──                                                                                                                           │
```
加入环境变量
```
$faucet_id = "0x681b302da905334c79216f92ffe8515fcd89fdf3b7a35e8d800c5c7cdf980418"
$faucet_type = "0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN"
```
## 创建资金池
```shell
sui client call --package $package --module swap --function create_pool --type-args $coin_type $faucet_type --gas-budget 30000000
```
```
│ Created Objects:                                                                                                                                                                  
                                                                                                                                   │
│  ┌──                                                                                                                                                                              
                                                                                                                                   │
│  │ ObjectID: 0x0526dc7c45de86ad941994d876bc88b6ab80c57ea2efd370a786c927e478afb4                                                                                                   
                                                                                                                                   │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                                                     
                                                                                                                                   │
│  │ Owner: Shared                                                                                                                                                                  
                                                                                                                                   │
│  │ ObjectType: 0xa82092ac91809ec95687e05f64390145306f4e730c698cd9543e168c4c753fc7::swap::Pool<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN, 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN>  │
│  │ Version: 1223465                                                                                                                                                               
                                                                                                                                   │
│  │ Digest: 7YA7MCdb6AZpz57dy95K2nSvzWBgVVVviqb6FVjMgXnt                                                                                                                           
                                                                                                                                   │
│  └──                     
```
加入环境变量
```shell
$pool = "0x0526dc7c45de86ad941994d876bc88b6ab80c57ea2efd370a786c927e478afb4"
```
## 存入代币
### 存入coin
sui client call --package $package --module swap --function deposit_a --type-args $coin_type $faucet_type --args $pool $coin_id --gas-budget 30000000
```
│  ┌──                                                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                 │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN  │
│  │ Amount: -1000                                                                                                 │
│  └──                                                                                                                   
```
### 存入faucet
sui client call --package $package --module swap --function deposit_b --type-args $coin_type $faucet_type --args $pool $faucet_id --g
as-budget 30000000
```
│  ┌──                                                                                                                           │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                               │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN  │
│  │ Amount: -1000                                                                                                               │
│  └──                                                                                                                           │
```

## 再minit一些coin与bank交换faucet
### mint brookbang_coin
```
sui client call --function mint --module brookbang_coin --package 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2 --args 0xa885e5bc4d83d9e7707758c84e614c066d563a1fb787daeaa2758c8924e2227c 1000 $Manager --gas-budget 30000000
```
```
│ Created Objects:                                                                                                                           │
│  ┌──                                                                                                                                       │
│  │ ObjectID: 0x2fbb516963e248617c5d718e145f6bd888eecdbaf0088249ecb89d40b13de79e                                                            │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                           │
│  │ ObjectType: 0x2::coin::Coin<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN>         │
│  │ Version: 1223468                                                                                                                        │
│  │ Digest: BdNW91i81rKfM6GEx7KT1dwrWRzAtnkvRmyQCYpRq1aq                                                                                    │
│  └──      

│  ┌──                                                                                                             │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                 │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN  │
│  │ Amount: 1000                                                                                                  │
│  └──        
```
设置环境变量
```
$new_coin = "0x2fbb516963e248617c5d718e145f6bd888eecdbaf0088249ecb89d40b13de79e"
```
### 交换faucet
sui client call --package $package --module swap --function swap_a_b --type-args $coin_type $faucet_type --args $pool $new_coin --gas-budget 30000000
```
│ Created Objects:                                                                                                                                                                                       
                                                                                                              │
│  ┌──                                                                                                                                                                                                   
                                                                                                              │
│  │ ObjectID: 0x7cebdbf04cb2400b6462348d6a684dd80f9de0c40ea3b7c679a06143fb0bd229                                                                                                                        
                                                                                                              │
│  │ Sender: 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669                                                                                                                          
                                                                                                              │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                                                                                                       
                                                                                                              │
│  │ ObjectType: 0x2::coin::Coin<0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN>                                                       
                                                                                                              │
│  │ Version: 1223469                                                                                                                                                                                    
                                                                                                              │
│  │ Digest: 6AyooGgCfRF3PrAhX1r8oNC26VuL4efAVySQTPKBujRW                                                                                                                                                
                                                                                                              │
│  └──                                                                                                                                                                                                   
                                                                                                              │

│  ┌──                                                                                                                           │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                               │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_coin::BROOKBANG_COIN                │
│  │ Amount: -1000                                                                                                               │
│  └──                                                                                                                           │
│  ┌──                                                                                                                           │
│  │ Owner: Account Address ( 0xb4d1dd4e03b26aac6eb686fba08a2a860466f65d97d111e403ea5eb32e90a669 )                               │
│  │ CoinType: 0x1bab8fc8119be4ae94ad0eb727feb04ea87bddfb8be5b7af771ff445f60afdb2::brookbang_faucet_coin::BROOKBANG_FAUCET_COIN  │
│  │ Amount: 1000                                                                                                                │
│  └──                                                                                                                           │
```
交易hash:HwtFuZ18ex2XGpb1ixoU9nsu49u9FrLfwGL1BcToLW3V