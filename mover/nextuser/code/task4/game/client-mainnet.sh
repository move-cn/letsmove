


# 代币的发布 task2/coin_faucet/  （已经在task2完成）
## 发布代币


# 代码依赖包说明
在task2/coin/faucet/Move.toml
 task4/game/Move.toml
 标注跟环境匹配的coin_faucet package地址


# testnet    定义代币的变量
export  PKG=0x5004eab7e42fd66ad3b7475632ae3070e9a4015f8f8976009e7e8637592e9d76
export JP_CAP=0xdd789eee513521bcf04ad857aaa549e97017261bb7054fbf865a208a31c17d4b
export B_ADDR=0xf7ec2215e565b7a18d7b00e70fccda74b30c3ecceffb5857b1b3d2249e28e94f
export A_ADDR=0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432 
export OWNER_ADDR=0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38

#  游戏发布和调用
## 发布game包

sui client switch --address  $OWNER_ADDR
sui client publish
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x86afb31c444e12753611161af10ba43ea5749f79f5010b6d9368ec57bfbc8199                       │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                         │
│  │ Owner: Shared( 415586840 )                                                                         │
│  │ ObjectType: 0x80f3da6457c89720ca6de5474d2d130b5d7b2c5a443bfad3daa36299d77c4d25::game::GameStorage  │
│  │ Version: 415586840                                                                                 │
│  │ Digest: BFFNLKod3jH9x5dr4UZWHo3bxMgCNMAcmmvDyaBpznsT                                               │
│  └──                  

│  ┌──                                                                                                  │
│  │ ObjectID: 0xf22f117dccabd82f9f424fea239cb8662e4cde5607d6f507ae105be31ecd0775                       │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                         │
│  │ Owner: Account Address ( 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38 )      │
│  │ ObjectType: 0x80f3da6457c89720ca6de5474d2d130b5d7b2c5a443bfad3daa36299d77c4d25::game::AdminCap     │
│  │ Version: 415586840                                                                                 │
│  │ Digest: 5cRLQ1exaMurWdCz24dZGqxWkggDwkVUrfPe7wnzwGJm                                               │
│  └──       


export PKG_GAME=0x80f3da6457c89720ca6de5474d2d130b5d7b2c5a443bfad3daa36299d77c4d25
export GAME_ID=0x86afb31c444e12753611161af10ba43ea5749f79f5010b6d9368ec57bfbc8199
export GAME_ADMIN=0xf22f117dccabd82f9f424fea239cb8662e4cde5607d6f507ae105be31ecd0775


# 找个coin<JP>




# faucet 获取JP coin 或找到已经分配的JP coin

sui client call --package 0x2 --module coin --function mint_and_transfer \
--type-args $PKG::jp::JP  --args $JP_CAP   60000   $OWNER_ADDR




## OWNER 拥有的coin
export COIN_ID=0x7dd540dadf993cdc48300f0d6916d48fa49f433891699b2952c4472324de1143

## 存入COIN
sui client call --package  $PKG_GAME --module game --function deposit \
--args $GAME_ID $COIN_ID 60000 

## play game
### 获取jp coin


│ Created Objects:                                                                                                   │
│  ┌──                                                                                                               │
│  │ ObjectID: 0x98124e90db7e530abf61ca8fe33494b5a247ff61107c9ce11f4456bd5882fb85                                    │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                      │
│  │ Owner: Account Address ( 0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432 )                   │
│  │ ObjectType: 0x2::coin::Coin<0x5004eab7e42fd66ad3b7475632ae3070e9a4015f8f8976009e7e8637592e9d76::jp::JP>         │
│  │ Version: 416420244                                                                                              │
│  │ Digest: 3gBDcmvmyeMVEChHATVfkkK2rvyhQnzGK37xiwWAVwmo                                                            │
│  └──                                                                        

# 查看mint结果
export COIN_A=0x98124e90db7e530abf61ca8fe33494b5a247ff61107c9ce11f4456bd5882fb85
sui client object $COIN_A

sui client switch --address $A_ADDR
# 玩游戏
sui client ptb    --move-call  $PKG_GAME::game::play  @$GAME_ID @0x8  @$COIN_A 100  3
## transaction
猜数失败 7Pir3oNfkMV2UKUD1s2CgzYXfJAV3QHethfs1qJ1eCF
猜数成功 21iVdmFaie9SxQczY8cQZiCuWFDtTeo9tEY8sFb3dVHy
## 查看余额
sui client object $COIN_A | grep balance 

# 取款，需要切换到owner
sui client switch --address $OWNER_ADDR
sui client ptb    --move-call  $PKG_GAME::game::withdraw @$GAME_ADMIN  @$GAME_ID  










## withdraw
