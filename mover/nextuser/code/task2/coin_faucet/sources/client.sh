sui client publish --skip-fetch-latest-git-deps --skip-dependency-verification

查看输出结果中的 0x2::coin::TreasuryCap 对象


 │ ObjectID: 0x8e1bebaac6dd33bf486fb294981f13fb6946051f465db0c25401b61b01f7421e                                     │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                       │
│  │ Owner: Account Address ( 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38 )                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x65a0995fd59c97b94fd975a3fb42c745cdff54711c1caae2934858e6eb99adb4::jp::JP>   │
│  │ Version: 236167313                                                                                               │
│  │ Digest: BnpekhzZQWQnR77hpGMZyhafRrMe57AyJainuFX8xEjg   


# testnet  
export  PKG=0x65a0995fd59c97b94fd975a3fb42c745cdff54711c1caae2934858e6eb99adb4
export JP_CAP=0x8e1bebaac6dd33bf486fb294981f13fb6946051f465db0c25401b61b01f7421e

# 获取当前激活的地址
export C_ADDR=`sui client active-address`

# 执行铸币,transfer给本地址
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args $PKG::jp::JP  --args $JP_CAP   8800000   $C_ADDR

# 获得输出创建coin
 Created Objects:                                                                                                   │
│  ┌──                                                                                                               │
│  │ ObjectID: 0x95245c704b124aa96f49ab1cdd459c7219d1dc1165faaeae80a514524e8308e2                                    │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                      │
│  │ Owner: Account Address ( 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38 )                   │
│  │ ObjectType: 0x2::coin::Coin<0x65a0995fd59c97b94fd975a3fb42c745cdff54711c1caae2934858e6eb99adb4::jp::JP>         │
│  │ Version: 236167314                                                                                              │
│  │ Digest: Gh2shitikPnbxxffpPj5mnWwrUCNJChEPyCNaBB2YHMV     

# 查看获得货币
sui client balance $C_ADDR




