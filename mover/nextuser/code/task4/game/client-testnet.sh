

# 代币的发布 task2/coin_faucet/
## 发布代币

sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification

查看输出结果中的 0x2::coin::TreasuryCap 对象

│  ┌──                                                                                                                │
│  │ ObjectID: 0xebe5855ce55333795adad3767935c13b1edb9db71d4a5488d4c60f2a1dc5d975                                     │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                       │
│  │ Owner: Shared( 236167323 )                                                                                       │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x9d5271ec037a50cafae643b4cc495c9e58ec993267b192d2693587f08c23367d::jp::JP>   │
│  │ Version: 236167323                                                                                               │
│  │ Digest: 2PnZg58j7GD8YgKunCiphUeVSb2Z9KZavrh3e2SqEMp4                                                             │
│  └──        

# testnet    定义代币的变量
export  PKG=0x9d5271ec037a50cafae643b4cc495c9e58ec993267b192d2693587f08c23367d
export JP_CAP=0xebe5855ce55333795adad3767935c13b1edb9db71d4a5488d4c60f2a1dc5d975
export A_ADDR=0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f
export B_ADDR=0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432 
export OWNER_ADDR=0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38



## 执行铸币,transfer给本地址
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args $PKG::jp::JP  --args $JP_CAP   8800000   $C_ADDR

## 获得输出创建coin
│ Created Objects:                                                                                                   │
│  ┌──                                                                                                               │
│  │ ObjectID: 0x7b99079885750871a465ba372524a77f38e05782ac5beec01ab3c15b467d2d11                                    │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                      │
│  │ Owner: Account Address ( 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38 )                   │
│  │ ObjectType: 0x2::coin::Coin<0x9d5271ec037a50cafae643b4cc495c9e58ec993267b192d2693587f08c23367d::jp::JP>         │
│  │ Version: 236167324                                                                                              │
│  │ Digest: EA3ZWf8ZBX2pAB7vVg2Wirq9jrYu9eXspfjWprdXXE7w                                                            │
│  └──                                                          



## 配置代币的对象和用户地址







sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args $PKG::jp::JP  --args $JP_CAP   10000   $B_ADDR

#  游戏发布和调用
## 发布game包

sui client switch --address  $OWNER_ADDR
sui client publish

│  ┌──                                                                                                  │
│  │ ObjectID: 0xc887273b5b03cf3a5f0d5174d057fbea6bd668038ec0b4d8384646a58c2d7c59                       │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                         │
│  │ Owner: Shared( 236167920 )                                                                         │
│  │ ObjectType: 0xd2b6739f08e1f2f764ea4c6e643edfd16752762665334147b3da6ac951ed895e::game::GameStorage  │
│  │ Version: 236167920                                                                                 │
│  │ Digest: FYTc87SYuN6aoKwcsHfJztUpVF3x4CW3u4j1iVRVpD2n                                               │
│  └──    

 ┌──                                                                                                  │
│  │ ObjectID: 0xecac6a6d0f7c5bbc3a5e7936b61d5243099a3a27d27d2cd67292f19eb7b79a85                       │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                         │
│  │ Owner: Account Address ( 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38 )      │
│  │ ObjectType: 0xd2b6739f08e1f2f764ea4c6e643edfd16752762665334147b3da6ac951ed895e::game::AdminCap     │
│  │ Version: 236167920                                                                                 │
│  │ Digest: GzhT2ZZ7e1ctTRz4h2ncGxkdqbofSrahkZ2rUFHancwt  


export PKG_GAME=0xd2b6739f08e1f2f764ea4c6e643edfd16752762665334147b3da6ac951ed895e
export GAME_ID=0xc887273b5b03cf3a5f0d5174d057fbea6bd668038ec0b4d8384646a58c2d7c59
export GAME_ADMIN=0xecac6a6d0f7c5bbc3a5e7936b61d5243099a3a27d27d2cd67292f19eb7b79a85


# 找个coin<JP>
sui client objects $OWNER_ADDR

# faucet 获取JP coin
sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args $PKG::jp::JP  --args $JP_CAP   60000   $OWNER_ADDR

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args $PKG::jp::JP  --args $JP_CAP   10000   $A_ADDR



## 根据前面输出结果，找到一个大于等于60000
export COIN_ID=0x6f3670814d0bb98d1f5f70019ddb32b8bfaeb1a5da87836ad0a6f8d8e0a5fc05

## 存入COIN
sui client call --package  $PKG_GAME --module game --function deposit \
--args $GAME_ID $COIN_ID 60000 

## play game
### 获取jp coin
sui client switch --address $A_ADDR

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args $PKG::jp::JP  --args $JP_CAP   10000   $A_ADDR 


export COIN_A=0x32b8b8add40fdb363c9e895d6d24184a9097aebff573ed6de3a13b52c0dab885
sui client ptb   --split-coins   @$COIN_A [100]  \
--assign coin_sub --move-call  $PKG_GAME::game::play  @$GAME_ID @0x8  coin_sub.0 100  3

sui client ptb    --move-call  $PKG_GAME::game::play  @$GAME_ID @0x8  @$COIN_A 100  3
sui client object $COIN_A | grep balance 




sui client ptb   --split-coins   @$COIN_A [100]  \
--assign coin_sub \
--move-call  $PKG_GAME::game::play  @$GAME_ID @0x8  coin_sub.0  3

sui client object $COIN_A








## withdraw
