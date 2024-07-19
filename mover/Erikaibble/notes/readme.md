│  │ ObjectID: 0x83f8d372e9b831361878db158fcb879cb24dcaf498c4b4ed14fdf0f7fea8aad9                                                                           │
│  │ Sender: 0x79d44f33f13afe96f095c9afbb9bf2b0fe187869ad1e3c2c3b46d2d5788f47d1                                                                             │
│  │ Owner: Shared( 299154046 )                                                                                                                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xcba092a7037174b482be3ee3b44cd9be4544ebe0f5397902264de5ab27cf94::erikaibble_faucet_coin::ERIKAIBBLE_FAUCET_COIN>   │
│  │ Version: 299154046                                                                                                                                     │
│  │ Digest: DjakAs7c2m32PeMaFmfqQ5C7pYWuXj9QRWoUiZxphMzZ                                                                                                   │

│  │ ObjectID: 0x359962ed2d27897479528075e6bb641df3d9b1e484c0d4d55567233c9f9b52d5                                                                           │
│  │ Sender: 0x79d44f33f13afe96f095c9afbb9bf2b0fe187869ad1e3c2c3b46d2d5788f47d1                                                                             │
│  │ Owner: Account Address ( 0x79d44f33f13afe96f095c9afbb9bf2b0fe187869ad1e3c2c3b46d2d5788f47d1 )                                                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xcba092a7037174b482be3ee3b44cd9be4544ebe0f5397902264de5ab27cf94::erikaibble_coin::ERIKAIBBLE_COIN>                 │
│  │ Version: 299154046                                                                                                                                     │
│  │ Digest: J8wbFaSdaR5XAoMP8dioaBfvMpgvdXkjVzSswkyQ8WyM                                                                                                   │

export ADDR1=0x79d44f33f13afe96f095c9afbb9bf2b0fe187869ad1e3c2c3b46d2d5788f47d1 
export ADDR2=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
export PACKAGE=0x00cba092a7037174b482be3ee3b44cd9be4544ebe0f5397902264de5ab27cf94         
sui client call --package $PACKAGE --module erikaibble_coin --function mint --args 0x359962ed2d27897479528075e6bb641df3d9b1e484c0d4d55567233c9f9b52d5 1000 $ADDR2

Transaction Digest: Gn4sxyHyM3WzQxdmpekfU8QZR6orGDGuzB6rJDpNvcTH

sui client call --package $PACKAGE --module erikaibble_faucet_coin --function mint --args 0x83f8d372e9b831361878db158fcb879cb24dcaf498c4b4ed14fdf0f7fea8aad9         1000 $ADDR1

Transaction Digest: 3JibGxyMVFRVy5Kd5G6ziCjvkbQewqmixp1RiphszXkF

sui client call --package $PACKAGE --module erikaibble_faucet_coin --function mint --args 0x83f8d372e9b831361878db158fcb879cb24dcaf498c4b4ed14fdf0f7fea8aad9      1000 $ADDR2

Transaction Digest: 7zFEegXoFRvea3u7aPxrFXQAYC2r2VX8jzaFs9tG65B




export PACKAGE_ID=0x93b8a9f76de0f8bcd084e32575ef5b48c22e43065688a3a888190a681ab54af1                        
export MY_ADDR=0x79d44f33f13afe96f095c9afbb9bf2b0fe187869ad1e3c2c3b46d2d5788f47d1

sui client call --package $PACKAGE_ID --module erikaibble_nft --function mint_to --args "erikaibble" $MY_ADDR 

Transaction Digest: EPHaYYYymuQJeRkEc1SmSAsRZ8zpuyLLcLP47LWaAgBT

ObjectID:  0x4a706ff4e9585f8df6314930164f03e30b68655f8accf3d97e84a55dd6351de0         

export TARGET_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module erikaibble_nft --function mint_to --args "erikaibble" $TARGET_ADDR 

Transaction Digest: FaoQ4L7Fj8q9qADGgoQxejrg2BC6EPzmqLYTLXkuJtA2



## task4

sui client publish

export PackageID=0xedf9aad195e01bbb8e421df49f69b15a5328141b7514e4c11d40d83437fa74c2             
export FaucetId=0xcba092a7037174b482be3ee3b44cd9be4544ebe0f5397902264de5ab27cf94::erikaibble_faucet_coin::ERIKAIBBLE_FAUCET_COIN

sui client call --package $PackageID --module erikaibble_game --function creat_game --type-args $FaucetId

export GameId=0xb6d2975c8f4cb8035a358a23dfbf564524dcd9326c39d8222e30ba9e0994dd5a       
export AdminCap=0x0b7ace182350a14ce39e8f974e1e2fa2c67b9e018e2ad24d814dba60625e54de         

export MyAddress=0x79d44f33f13afe96f095c9afbb9bf2b0fe187869ad1e3c2c3b46d2d5788f47d1

export Task2Pack=0xcba092a7037174b482be3ee3b44cd9be4544ebe0f5397902264de5ab27cf94

export TreasureId=0x83f8d372e9b831361878db158fcb879cb24dcaf498c4b4ed14fdf0f7fea8aad9       

sui client call --package $Task2Pack  --module erikaibble_faucet_coin --function mint --args $TreasureId 10000 $MyAddress

export FaucetCoin=0x2fb1278b58b82c890a0154dfca72c5efbff52099af4c5109b8ea560c4c6df469              

sui client call --package $PackageID --module erikaibble_game --function deposit  --type-args $FaucetId --args $GameId $FaucetCoin 5000

Transaction Digest: GBo5xh21HNiZVet4wcCWDD1wbk5T9M2T8yMtVpPFwGL2

export GameCoin=0xd9285d71da222c523ee93208ebf1543d5406c389a5f6746faa27e59dfad2f9d9   

sui client call --package $PackageID --module erikaibble_game --function play --type-args $FaucetId --args $GameId $GameCoin

Transaction Digest: 4GbCUiaJj7z15iMgiizXNQjLRooSKFNNrixYWzJ2xpC6

sui client call --package $PackageID --module erikaibble_game --function withdraw --type-args $FaucetId --args $AdminCap $GameId 2000


Transaction Digest: 5R4WmD4CY2YCg8Scpbzqebb5EqJTaEi9pgWAcKPtEyiV