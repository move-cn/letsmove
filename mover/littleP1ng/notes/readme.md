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