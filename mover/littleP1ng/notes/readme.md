# coin faucet nft

sui client publish

PackageID: 0x9cb993c5469e8a006187c7f3d83cd897b08dc259127ebd92a2573cd719c4876c                            

ObjectID: 0xe2ec44d1affdd3e7aeec56c0b34d2757361a5559f1fc2558082ccf793ec9d641  
ObjectType:  0x2::coin::TreasuryCap<0x9cb993c5469e8a006187c7f3d83cd897b08dc259127ebd92a2573cd719c4876c::littleP1ng_coin::LITTLEP1NG_COIN>     

mint coin to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2:

sui client call --package 0x9cb993c5469e8a006187c7f3d83cd897b08dc259127ebd92a2573cd719c4876c --module littleP1ng_coin --function mint --args 0xe2ec44d1affdd3e7aeec56c0b34d2757361a5559f1fc2558082ccf793ec9d641 1000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: 5MdqLThcA3zSexwtd2S4AVENoGFkqg74kZBpewXVega7

PackageID: 0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f              
ObjectID: 0x32e8457b1e3be75367b9a79d47e5bab235540af96bf9267877334d9d9c2fbdf7                
ObjectType: 0x2::coin::TreasuryCap<0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f::littleP1ng_faucet_coin::LITTLEP1NG_FAUCET_COIN> 

mint faucet coin 给 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2:

sui client call --package 0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f  --module littleP1ng_faucet_coin --function mint --args 0x32e8457b1e3be75367b9a79d47e5bab235540af96bf9267877334d9d9c2fbdf7  1000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: 8TtDy3tpRTqgAScyCSaDW3xtDQ3KiB8K2D9M4swmuRs4

mint faucet coin 给自己：

sui client call --package 0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f  --module littleP1ng_faucet_coin --function mint --args 0x32e8457b1e3be75367b9a79d47e5bab235540af96bf9267877334d9d9c2fbdf7  1000 0x829abecd7454a3af03cb141c38495107cd67e11abc595985bc90c24e96b7a2e7

Transaction Digest: 3V58FsPsW23ZiRLfsneoSpTanPnJfydGxJAqYVPepxvL

nft:

PackageID: 0x149e17f9ba48167f703f54e5c18de2b40947fa4e6242ea846d3f1dfa0110c556       

sui client call --package 0x149e17f9ba48167f703f54e5c18de2b40947fa4e6242ea846d3f1dfa0110c556 --module littleP1ng_nft --function mint_to --args "LittleP1ng" 0x829abecd7454a3af03cb141c38495107cd67e11abc595985bc90c24e96b7a2e7

ObjectID: 0x0f1fc389b14d92e5f524459460cb19e1d6eba9c4fa83557d7dd50ade5d71b932           

mint nft to: 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2：

sui client call --package 0x149e17f9ba48167f703f54e5c18de2b40947fa4e6242ea846d3f1dfa0110c556 --module littleP1ng_nft --function mint_to --args "From LittleP1ng" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: BKaBBe7Ew9YuRwsHzKWmCJBKuJkZWb78bm18b42YTg4i


# game 

`mainnet`

sui client publish

PackageID: 0x370e3b0810ca9e0c23c1710a699459901193de327f54e3c942014fca473d6b6a  

export PackageID=0x370e3b0810ca9e0c23c1710a699459901193de327f54e3c942014fca473d6b6a  
faucet: 
PackageID: 0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f              
ObjectID: 0x32e8457b1e3be75367b9a79d47e5bab235540af96bf9267877334d9d9c2fbdf7                
ObjectType: 0x2::coin::TreasuryCap<0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f::littleP1ng_faucet_coin::LITTLEP1NG_FAUCET_COIN> 

export FaucetId=0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f::littleP1ng_faucet_coin::LITTLEP1NG_FAUCET_COIN

adminCap: 0x0775d06caffd3483045c0830280634e0257f80e83cbc0ad604405a50dcaad7f3                 

gameId: 0x52fcfb4f03b357603c62d3002cb97977157b84d09c66d135b498142efe4f422b 

export GameId=0x52fcfb4f03b357603c62d3002cb97977157b84d09c66d135b498142efe4f422b 

export AdminCap=0x0775d06caffd3483045c0830280634e0257f80e83cbc0ad604405a50dcaad7f3                        

mint faucet coin:

export MyAddress=0x829abecd7454a3af03cb141c38495107cd67e11abc595985bc90c24e96b7a2e7

export Task2Pack=0xf384148678a81ed4e9a27fe1bd552e021c4c44cb44f657af22fe24ff8d3a3b4f              

export TreasureId=0x32e8457b1e3be75367b9a79d47e5bab235540af96bf9267877334d9d9c2fbdf7          

sui client call --package $Task2Pack --module littleP1ng_faucet_coin --function mint --args $TreasureId 1000000 $MyAddress

get faucet coin
ObjectID: 0xcff22a974c6715575fc9b5a445f6ab073341153dfe6029678319f2d1c354846e       
export FaucetCoin=0xcff22a974c6715575fc9b5a445f6ab073341153dfe6029678319f2d1c354846e                   

deposit:
sui client call --package $PackageID --module littleP1ng_game --function deposit --args $GameId $FaucetCoin 500000

left coin:

ObjectID: 0x0ab4630a31df2a21ab77b786fe2f2e91d55d972207ba84bf8628675ad79ea7bf    

Transaction Digest: 7z4ENKcAKVBvMgFXrBAegmpmFJYrpaf69dC5vjTat4fm

export GameCoin=0x0ab4630a31df2a21ab77b786fe2f2e91d55d972207ba84bf8628675ad79ea7bf    

sui client call --package $PackageID --module littleP1ng_game --function play --args $GameId $GameCoin
Transaction Digest: AekFwTLjJHyrFSfMRapc9ofia3PjZ3F4a2cqtaPwPmj2

│  │ ParsedJSON:                                                                                                │
│  │   ┌───────────┬──────┐                                                                                     │
│  │   │ is_winner │ true │                                                                                     │
│  │   ├───────────┼──────┤                                                                                     │
│  │   │ npc_roll  │ 1    │                                                                                     │
│  │   ├───────────┼──────┤                                                                                     │
│  │   │ result    │ Win  │                                                                                     │
│  │   ├───────────┼──────┤                                                                                     │
│  │   │ your_roll │ 2    │                                                                                     │
│  │   └───────────┴──────┘                                                                                     │
│                            

取出GameCoin，使用task5的withdraw方法

sui client call --package $PackageID --module littleP1ng_game --function withdraw --args $AdminCap $GameId 2000

Transaction Digest: 3YpDaTPU9JqcwMR6qFpCz1KHEeqgSWoecCRwCeutxewC

# ctf 1

sui client call --function get_flag --module check_in --package 0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d --args [16,246,136,180,23,240,37,152,62,215,156,169,184,55,133,220,214,226,63,27,38,66,117,66,178,226,156,12,36,16,195,56] littleP1ng 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147  0x8

# ctf 2

sui client call --function get_flag --module lets_move --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f --args 2e1a501722db235e07ab littleP1ng 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 0x8