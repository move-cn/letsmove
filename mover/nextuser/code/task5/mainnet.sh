
export CAP_A=0xc6c730b35f3971c13f1a8c829c8632ba0775f28cf55b93744dc12cc32f5f1f7e
export PKG_A=0xb6b7cc1b7b4e7183ba42341c22f10c56b86d70e14a02d4f321769c687b2dabd2
export COIN_A=0xd51aa08144aac919d3a3574b056b65a8cd775ac594e519bd99a8a5ce31a9f441
export COIN_A_OWNER=0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432


export CAP_B=0xdd789eee513521bcf04ad857aaa549e97017261bb7054fbf865a208a31c17d4b
export PKG_B=0x5004eab7e42fd66ad3b7475632ae3070e9a4015f8f8976009e7e8637592e9d76

sui client ptb --move-call 0x2::coin::mint_and_transfer "<$PKG_B::jp::JP>" "@$CAP_B 20000 @$COIN_A_OWNER"

export COIN_B=0x59e8abac7fd34b0eff3ddbbbe13787a228bbc86d0a673b461de01fcc3f09d062
export COIN_B_OWNER=0x7cbe5e6596e23266dd5763dd89b4ab1195516908ecde8febfe96685c7cbe6432
export PKG_SWAP=0x5bd161ea8e0a9dd1e0119315998943cde43650ba0cd8f67e81e39e8288bb1de5




# create pool
sui client ptb --move-call $PKG_SWAP::swap::create_pool \
"<$PKG_A::yuan_da_tou::YUAN_DA_TOU , $PKG_B::jp::JP>" \
 "@$COIN_A @$COIN_B  800 "

│  ┌──                                                                                                                                                                                                                                                                           │
│  │ ObjectID: 0x979972fc7c3d6ce21245369ffde568e8024c50062abc6ee581c819d476fc2fc7                                                                                                                                                                                                │
│  │ Sender: 0x540105a7d2f5f54a812c630f2996f1790ed0e60d1f9a870ce397f03e4cec9b38                                                                                                                                                                                                  │
│  │ Owner: Shared( 367 )                                                                                                                                                                                                                                                        │
│  │ ObjectType: 0xb48d22f33239ec70bb3d55020ba7c3151bd391a1d1a2b729671f1abcfc97f843::swap::LiquidPool<0x6ffb4e41fbadd03fe26155fec7d8cb292283feddd8cecc258d1027f3ce2348b2::yuan_da_tou::YUAN_DA_TOU, 0xcd3b3210b14cdc2a8a21351f571a1eec1438cf210e84c1fc7dd3c1912effc02c::jp::JP>  │
│  │ Version: 367                                                                                                                                                                                                                                                                │
│  │ Digest: 85BDkYhxqaRhe4nfHNXEEyMkjxidAJoJTei6PqNpKmuN                                                                                                                                                                                                                        │
│  └──    

## 转换 A => B
export POOL_ID=0x65b6ee99ca9347fb7feebee370e12db0dfe8b8504c1fdb659bc23618f792adff
export COIN_A_ID2=0xa3a70e27f1b0ad5782fa10c79d9231ee18329c63b9428791efb4bbd1af4fe85b

```bash

sui client ptb --split-coins @$COIN_A_ID2 [500] \
 --assign new_coin \
 --move-call  $PKG_SWAP::swap::swap_a2b  "<$PKG_A::yuan_da_tou::YUAN_DA_TOU , $PKG_B::jp::JP>" "@$POOL_ID  new_coin" \
 --assign jp_var \
 --transfer-objects [jp_var]  @$COIN_B_OWNER

``
* tranaction digest: 74BaVRcHiYtg36thXzBqDwdPwfkSp5jArm6xoSkfgDSd

Transaction Digest: HWLu7S3qGXuBwMjRomQ1zQEFe9Jgn8Xg5YFz7RNQzLGy

export COIN_B_ID2=0x6b9dde7b4dc8a84678b08143043ad1912f3113ded3f8f7a37a35b0d5f371d543

## 转换 B => A
sui client ptb --split-coins @$COIN_B_ID2 [80] \
 --assign new_coin \
 --move-call  $PKG_SWAP::swap::swap_b2a  "<$PKG_A::yuan_da_tou::YUAN_DA_TOU , $PKG_B::jp::JP>" "@$POOL_ID  new_coin" \
 --assign coin_out \
 --transfer-objects [coin_out]  @$COIN_B_OWNER

 * transaction-digest 
 b2a:
 EjiDEsuJuMSW2vcQnX8M3bkkrH22r7F29SaA2UFdUE2G


 a2b：
 74BaVRcHiYtg36thXzBqDwdPwfkSp5jArm6xoSkfgDSd