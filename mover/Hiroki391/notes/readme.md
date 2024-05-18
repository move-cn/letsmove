# task1

sui client faucet

sui client publish --gas-budget 10000000

Failed to build Move modules: Failed to resolve dependencies for package 'hello_Hiroki391'

Caused by:
    0: Parsing manifest for 'Sui'
    1: No such file or directory (os error 2).

PackageID: 0x5343900dd7a4670cdd63564428770f7f3c00299dcfb1bc290607ecaf551a8c36 

# task2

sui move new hiroki391_coin

sui client publish --gas-budget 20000000

拿到包： PackageID: 0xadd3f6d153775687016c1271a3cab27c68732aa494fd1d20afe37891a466b707                        

TreasureID: 0x29e17a3e72b0bf17c9615f036d325c4c1990115c048244d4bb05f76ba5f953e0     

0xadd3f6d153775687016c1271a3cab27c68732aa494fd1d20afe37891a466b707::hiroki391_coin::HIROKI391_COIN

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0xadd3f6d153775687016c1271a3cab27c68732aa494fd1d20afe37891a466b707  --module hiroki391_coin --function mint --args 0x29e17a3e72b0bf17c9615f036d325c4c1990115c048244d4bb05f76ba5f953e0 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

交易凭据： Transaction Digest: HfdxSZA4M8jcL2ZJJKWrh3UMLZQ2f3LVNCpttyVH9wHm

sui move new hiroki391_faucet

sui client publish --gas-budget 20000000

PackageID: 0x0251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d  

TreasureID: 0x1fcb8ee64ef21406d5ab3c0500fc6025493a47daa34d334cf1ed6d04f80e2539

type: 0x251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d::hiroki391_faucet::HIROKI391_FAUCET

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0x0251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d   --module hiroki391_faucet --function mint --args 0x1fcb8ee64ef21406d5ab3c0500fc6025493a47daa34d334cf1ed6d04f80e2539 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

交易凭据：Transaction Digest: 919Ruby1MjKxA8yDkgK6rWA4914n4wEhfjSRErW69nqZ

mint给自己`0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491`:

sui client call --package 0x0251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d   --module hiroki391_faucet --function mint --args 0x1fcb8ee64ef21406d5ab3c0500fc6025493a47daa34d334cf1ed6d04f80e2539 1000000 0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491 --gas-budget 50000000

交易凭据： Transaction Digest: 369sjTixwYF4X78y4tty3gdGBV8aRNowcDFSj95gC7E6


# task3 

sui move new hiroki391_nft

sui client publish --gas-budget 20000000

拿到包 PackageID: 0xa48055c9230a0aa38e668b8ee9aff648234fe97b09147d0f2573736e6e887fc7 

mint给自己`0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491`:

sui client call --package 0xa48055c9230a0aa38e668b8ee9aff648234fe97b09147d0f2573736e6e887fc7 --module hiroki391_nft --function mint_to --args "Hiroki" 0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491 --gas-budget 20000000

交易凭证： Transaction Digest: CoF5RchfHG6fmKpDM2N1cRRTngvgahRepaTpjGkouFt2

还有NFT的 ObjectID: 0x9c96d4c25ea079d574174aa8de1c8cc37ae96bcb26af92adbb6f7a4b43a017b4       

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0xa48055c9230a0aa38e668b8ee9aff648234fe97b09147d0f2573736e6e887fc7 --module hiroki391_nft --function mint_to --args "From Hiroki" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

交易凭据：Transaction Digest: FFCcX6uWdnx6haRJx7241r1bE8v2MHP9rZKR2mbCbGYi

# task4

`testnet`

sui client publish --gas-budget 20000000

PackageID: 0x4c13e6c4eab42a3d97816d4939e2e63523190b02b9b91cb11ce884d21532d013   

export PackageID=0x4c13e6c4eab42a3d97816d4939e2e63523190b02b9b91cb11ce884d21532d013   
发布 task2 的faucet 到 testnet 
 PackageID: 0x2b40b7e300dec1fadb6a0fdf2d0463f78bd27a32a5bcd6fa1740946590f433b1            
 ObjectID: 0x8f9aebd6c14eb7929f6e618cdab7f5a71bc30fafd1d92c46b4a2eb17db17f5f4 
 ObjectType: 0x2::coin::TreasuryCap<0x2b40b7e300dec1fadb6a0fdf2d0463f78bd27a32a5bcd6fa1740946590f433b1::hiroki391_faucet::HIROKI391_FAUCET>

export FaucetId=0x2b40b7e300dec1fadb6a0fdf2d0463f78bd27a32a5bcd6fa1740946590f433b1::hiroki391_faucet::HIROKI391_FAUCET

创建游戏

sui client call --gas-budget 7500000 --package $PackageID --module hiroki391_game --function creat_game --type-args $FaucetId

adminCap: 0x86086062ebe278813785a89c712a9209768a513bcb1d9ed0cd448e7228ee4341           

gameId: 0x451d61243edac29082e7f2d519e2218ac6321f5c23159acd7b2672cb8693fb4b          

export GameId=0x451d61243edac29082e7f2d519e2218ac6321f5c23159acd7b2672cb8693fb4b          

export AdminCap=0x86086062ebe278813785a89c712a9209768a513bcb1d9ed0cd448e7228ee4341 

和task2 中一样 mint faucet coin:

export MyAddress=0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491

export Task2Pack=0x2b40b7e300dec1fadb6a0fdf2d0463f78bd27a32a5bcd6fa1740946590f433b1

export TreasureId=0x8f9aebd6c14eb7929f6e618cdab7f5a71bc30fafd1d92c46b4a2eb17db17f5f4

sui client call --package $Task2Pack  --module hiroki391_faucet --function mint --args $TreasureId 1000000 $MyAddress --gas-budget 50000000

拿到faucet coin
ObjectID: 0xe700c8cb804aa1a3a815a9fd3e57ebc9ae4716d9f9dcac49f1e5bce63f48c334     
export FaucetCoin=0xe700c8cb804aa1a3a815a9fd3e57ebc9ae4716d9f9dcac49f1e5bce63f48c334

使用task5的deposit方法
sui client call --package $PackageID --module hiroki391_game --function deposit  --type-args $FaucetId --args $GameId $FaucetCoin 500000 --gas-budget 20000000

拿到游戏内部 coin:

ObjectID: 0x65052f51d776be5a03032576076f2a0fe8670a6935e69cf1d8c8e877975f68b9              

Transaction Digest: 9LdUA6TGQg7zVChQJW9g9BeXvitbXBxQ5VB8BWuGu7kw

sui client call --package $PackageID --module hiroki391_game --function set_ticket --type-args $FaucetId --args $AdminCap $GameId 100 --gas-budget 10000000

sui client call --package $PackageID --module hiroki391_game --function set_reward --type-args $FaucetId --args $AdminCap $GameId 200 --gas-budget 10000000

export GameCoin=0x65052f51d776be5a03032576076f2a0fe8670a6935e69cf1d8c8e877975f68b9

sui client call --package $PackageID --module hiroki391_game --function play --type-args $FaucetId --args 2 $GameId $GameCoin 0x6 --gas-budget 10000000

Transaction Digest: 93E75zHQk7hjNGzL7XaeoJTNeDJDPyzAtwEExFFoaMok

取出GameCoin，使用task5的withdraw方法

sui client call --package $PackageID --module hiroki391_game --function withdraw --type-args $FaucetId --args $AdminCap $GameId 2000 --gas-budget 10000000

Transaction Digest: GkQqTtjiBXrk9td1w8QBLoMfNn91mFBxMn4SUXxi9G5a

`mainnet`

sui client publish --gas-budget 20000000

PackageID: 0xe5c3c8d5e85b4a9a6d1f7af006e00da9b93272a053a8e40f58414b0e9ed48929  

export PackageID=0xe5c3c8d5e85b4a9a6d1f7af006e00da9b93272a053a8e40f58414b0e9ed48929     
找到 task2 的faucet 
 PackageID: 0x251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d            
 ObjectID: 0x1fcb8ee64ef21406d5ab3c0500fc6025493a47daa34d334cf1ed6d04f80e2539 
 ObjectType: 0x2::coin::TreasuryCap<0x251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d::hiroki391_faucet::HIROKI391_FAUCET>

export FaucetId=0x251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d::hiroki391_faucet::HIROKI391_FAUCET

创建游戏

sui client call --gas-budget 7500000 --package $PackageID --module hiroki391_game --function creat_game --type-args $FaucetId

adminCap: 0x5297147449b67c5ee252d6d30707d511e03fa63de1a492df75bf84883b564955                       

gameId: 0x8c1b73d6f09ff7118d66186c78844e213029fcc455dff513da0c51c9bf1dd656         

export GameId=0x8c1b73d6f09ff7118d66186c78844e213029fcc455dff513da0c51c9bf1dd656      

export AdminCap=0x5297147449b67c5ee252d6d30707d511e03fa63de1a492df75bf84883b564955            

和task2 中一样 mint faucet coin:

export MyAddress=0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491

export Task2Pack=0x251e62aaa7b0cc3cbf2ab554ec4819204cbfebe30fa86d893aabf6c4708461d 

export TreasureId=0x1fcb8ee64ef21406d5ab3c0500fc6025493a47daa34d334cf1ed6d04f80e2539

sui client call --package $Task2Pack  --module hiroki391_faucet --function mint --args $TreasureId 1000000 $MyAddress --gas-budget 50000000

拿到faucet coin
ObjectID: 0x02e5dfa0ebeb0137dc76038fb15b5f1fc12bbec85296b4ca9dca27030c3be499    
export FaucetCoin=0x02e5dfa0ebeb0137dc76038fb15b5f1fc12bbec85296b4ca9dca27030c3be499

使用task5的deposit方法
sui client call --package $PackageID --module hiroki391_game --function deposit  --type-args $FaucetId --args $GameId $FaucetCoin 500000 --gas-budget 20000000

拿到游戏内部 coin:

ObjectID: 0xcf3ace845fd24114868786e275d5591fd14448a5754d27138a9673223869a263              

Transaction Digest: 6VWfUo7hpRw6h5Gve1bvYTmKuMUEwGaX5NBhJhBNvbFN

sui client call --package $PackageID --module hiroki391_game --function set_ticket --type-args $FaucetId --args $AdminCap $GameId 100 --gas-budget 10000000

sui client call --package $PackageID --module hiroki391_game --function set_reward --type-args $FaucetId --args $AdminCap $GameId 200 --gas-budget 10000000

export GameCoin=0xcf3ace845fd24114868786e275d5591fd14448a5754d27138a9673223869a263

sui client call --package $PackageID --module hiroki391_game --function play --type-args $FaucetId --args 2 $GameId $GameCoin 0x6 --gas-budget 10000000

Transaction Digest: 7me3Uimd6nMnumgH4RAhtSjVpRwVQ9C7vLRVCmBKS8Pd
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                         │
│  │ EventID: 7me3Uimd6nMnumgH4RAhtSjVpRwVQ9C7vLRVCmBKS8Pd:0                                                   │
│  │ PackageID: 0xe5c3c8d5e85b4a9a6d1f7af006e00da9b93272a053a8e40f58414b0e9ed48929                             │
│  │ Transaction Module: hiroki391_game                                                                        │
│  │ Sender: 0x63352fa9593fa2d16a71823f7ab8865af627d51706a637fdfdf508cae42c8491                                │
│  │ EventType: 0xe5c3c8d5e85b4a9a6d1f7af006e00da9b93272a053a8e40f58414b0e9ed48929::hiroki391_game::GameResult │
│  │ ParsedJSON:                                                                                               │
│  │   ┌─────────────┬──────────┐                                                                              │
│  │   │ is_winner   │ false    │                                                                              │
│  │   ├─────────────┼──────────┤                                                                              │
│  │   │ npc_choice  │ Scissors │                                                                              │
│  │   ├─────────────┼──────────┤                                                                              │
│  │   │ result      │ Lose     │                                                                              │
│  │   ├─────────────┼──────────┤                                                                              │
│  │   │ your_choice │ Paper    │                                                                              │
│  │   └─────────────┴──────────┘                                                                              │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

取出GameCoin，使用task5的withdraw方法

sui client call --package $PackageID --module hiroki391_game --function withdraw --type-args $FaucetId --args $AdminCap $GameId 2000 --gas-budget 10000000

Transaction Digest: 3cu3m4qfk2Lvr7CjzRggqVSQMPV9SVGbrSr43GJiVxou