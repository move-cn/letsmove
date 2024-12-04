                                              
0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615 

sui client call --package 0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615  --module chara64d_coin --function mint --args 0xef7612d8cc4bce33948ddda39143c0d62ca7035fe7a1305989e09e8d3693c90a  100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: Fqg14WEr6vZXzbREX8XnFc8XBGbUe91A5FBNdehKQKTi

sui client call --package 0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615  --module chara64d_faucet_coin --function mint --args 0x342e6b40a00192315a206bca233f73d03122469f68e32b250b6219dd69c2b60e  100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2  | head -n 1

Transaction Digest: GWwSD48zoeXuq8zW4FcaB63GczWYgtQw1py2Xny1koTs

sui client call --package 0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615   --module chara64d_faucet_coin --function mint --args 0x342e6b40a00192315a206bca233f73d03122469f68e32b250b6219dd69c2b60e  100 0x73cb4adab9aa74a44f4f828cf941f12982aebbc77e103973bb056cf8b28dc438 

Transaction Digest: EuJ4rQBsLqp5AFg7FzX157ces553Z1VEPvZWrPP8jmDa


## task3


PackageID: 0xa5f3c32ad44bfdaec60c3b3737be1300da6a036fc05265cedd746b0844a83654       

sui client call --package 0xa5f3c32ad44bfdaec60c3b3737be1300da6a036fc05265cedd746b0844a83654  --module chara64d_nft --function mint_to --args "Chara64D" 0x73cb4adab9aa74a44f4f828cf941f12982aebbc77e103973bb056cf8b28dc438
  
Transaction Digest: GDmbwiY9oMFs9sWtYqxvcwFq88Y6sjnRN6U9YR2eQoSo

ObjectID: 0xd16cd20bb3ee7c6ecb91752a1265422875b717f9580bfe9909acb4efb3e54f5f       

sui client call --package 0xa5f3c32ad44bfdaec60c3b3737be1300da6a036fc05265cedd746b0844a83654    --module chara64d_nft --function mint_to --args "SEND BY Chara64D" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 

Transaction Digest: 2dYLJaT35r2n9G5ktCRpXcvxHSeG1f1LPmCyTodeK4Vd


## task4

│  │ ObjectID: 0x32fde0998cec3a7b687fc3b71df960560e004ad2bc188e17bb174cd0801e95f3                                                                         │
│  │ Sender: 0x0622f53d9182ef79313bca597350ab29a9a6ffc9c3f8f861c1765e374e4ac021                                                                           │
│  │ Owner: Shared( 83797349 )                                                                                                                            │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xf28f844c57506e3c5a7a1b01d8a148c98d10086273ee239e7be2694401221b72::chara64d_faucet_coin::CHARA64D_FAUCET_COIN>   │
│  │ Version: 83797349                                                                                                                                    │
│  │ Digest: EEH6xzt1dLsy6fc2VmB3RgJF4qX3Zi37xDJhbvct4cY2                                                                                                  │

sui client publish

export PackageID=0xfc1c8ab7223be0a1415745967ad2da8ca7dc337a33daab27ded73d7e13ea8c43 
export FaucetId=0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615::chara64d_faucet_coin::CHARA64D_FAUCET_COIN

sui client call --package $PackageID --module game --function creat_game --type-args $FaucetId

export GameId=0x518046336b8ff8c55239fdee86cad787dc202c3e3ab7a62ecd67e6639d35d788
export AdminCap=0xca0fc68d7598f935d3554ad059144a3495d1b71fd2a37ca9d762fff4bd813a35                

export MyAddress=0x73cb4adab9aa74a44f4f828cf941f12982aebbc77e103973bb056cf8b28dc438 

export Task2Pack=0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615

export TreasureId=0x342e6b40a00192315a206bca233f73d03122469f68e32b250b6219dd69c2b60e       

sui client call --package $Task2Pack  --module chara64d_faucet_coin --function mint --args $TreasureId 10000 $MyAddress

export FaucetCoin=0xd2bc1c63a2210a07e3bac3eeef3012d235ab62be5d96270713db59fbc96168ec   

sui client call --package $PackageID --module game --function deposit  --type-args $FaucetId --args $GameId $FaucetCoin 5000

Transaction Digest: Aah1B4pXmswaPzgF53LuUsJwToWpZzVq68ng1NXQ546v

export GameCoin=0x95a354714872a437e8603cdb197ff025ad9602a5b442ab4ec52e34293c5c5e2d   

sui client call --package $PackageID --module game --function play --type-args $FaucetId --args $GameId $GameCoin 0x8

Transaction Digest: CEApGjydQACWoqzFK8Snc9ZKjR6LMA2ApUMVigdRZowP

sui client call --package $PackageID --module game --function withdraw --type-args $FaucetId --args $AdminCap $GameId 2000

Transaction Digest: 3EvpVsjzejyv4Rpna4HQH94DkAGxBWaC8SPKrt5te43M


0x8db22e82e718f3c9dcaa38014fddb7bd9ac6702d97ac3f333034d80ea5712a65
2000:
0x5eee4c2c37087fc0bf114518f259ced840ad257ba0f4f20a1cdb1e0a09363921
1000:
0x61136a7bbed01eca475c9b4553616ea194135eec4fe2aa00ca19dec87551a74c
## task5

export PACKID=0xf3ac362431841e49f11d89865026c270b6ce189c0a064498c8c3481609ade170   


export BANK=0x123f89a7aab63845acb2519e44dfbc8b0276471ebcc90dbdb5096dd7ffbf30a2

export MY_ADDRESS=0x73cb4adab9aa74a44f4f828cf941f12982aebbc77e103973bb056cf8b28dc438

export PACKAGE_ID=0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615
export PACKAGE_ID_FAUCET=0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615
export COIN=0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615::chara64d_coin::CHARA64D_COIN
export FAUCET=0x722335fed7ef240e3890ef4bd8d77c26c633855d93f0388a6fafa7eb9fd59615::chara64d_faucet_coin::CHARA64D_FAUCET_COIN

export COIN_TREASURY_CAP_ID=0xef7612d8cc4bce33948ddda39143c0d62ca7035fe7a1305989e09e8d3693c90a  
export FAUCET_TREASURY_CAP_ID=0x342e6b40a00192315a206bca233f73d03122469f68e32b250b6219dd69c2b60e     

sui client call --package $PACKAGE_ID --module chara64d_coin --function mint --args $COIN_TREASURY_CAP_ID 1000 $MY_ADDRESS

sui client call --package $PACKAGE_ID_FAUCET --module chara64d_faucet_coin --function mint --args $FAUCET_TREASURY_CAP_ID 1000 $MY_ADDRESS

export COIN_ID_1=0x6e1dcef49b1947c8ad72d2e361324b43923c2d3caf46722b443cc59f766d4b91     

export FAUCET_ID_1=0x61136a7bbed01eca475c9b4553616ea194135eec4fe2aa00ca19dec87551a74c

sui client call --package $PACKID --module swap --function deposit_RMB --args $BANK $FAUCET_ID_1

sui client call --package $PACKID --module swap --function deposit_USD --args $BANK $COIN_ID_1

sui client call --package $PACKAGE_ID --module chara64d_coin --function mint --args $COIN_TREASURY_CAP_ID 50 $MY_ADDRESS

export COIN_ID_2=0xef1dcc99d60d5946d6e4e89a052d6522a7829f5c52ec6d89189681728b68a492        

sui client call --package $PACKID --module swap --function swap_usd2rmb --args $BANK $COIN_ID_2

Transaction Digest: 8SG53vE1oAjpv1eb2AfX3VXiSD6fmucoWC7pXeiGGYoD


export FAUCET_ID_2=0xa0454189d32c550d19182b8359a0750d8be1c22992c4026d848be0aa35af3e22     


sui client call --package $PACKID --module swap --function swap_rmb2usd --args $BANK $FAUCET_ID_2


Transaction Digest: 5JGUzMDeswNCtmZtfEWLfWpQWCPKbjQMBMQJtSgbSQhk