task3: 

ObjectID: 0x812c9110578cf42117311d37fb2b22346c463e30f736fc5ed7f1460866e0b021   
ObjectType: 0x2::coin::TreasuryCap<0x5d1e79142c2f6cb453f5c660e0760fdf069875bd5cafc50ac00593b6acdf8efb::taenggu308_faucet_coin::TAENGGU308_FAUCET_COIN>

ObjectID: 0x60abf32244973dcc4ef90cd8b118167709fcfb0bf1caef15826bd7659adc8e6e  
ObjectType: 0x2::coin::TreasuryCap<0x5d1e79142c2f6cb453f5c660e0760fdf069875bd5cafc50ac00593b6acdf8efb::taenggu308_coin::TAENGGU308_COIN>   

0x5d1e79142c2f6cb453f5c660e0760fdf069875bd5cafc50ac00593b6acdf8efb

sui client call --package 0x5d1e79142c2f6cb453f5c660e0760fdf069875bd5cafc50ac00593b6acdf8efb --module taenggu308_coin --function mint --args 0x60abf32244973dcc4ef90cd8b118167709fcfb0bf1caef15826bd7659adc8e6e  1000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: 8Kcj9gRaZSHSgeBLPDcgRUtfdnRYyFEoZ6km8CLegUtg

sui client call --package 0x5d1e79142c2f6cb453f5c660e0760fdf069875bd5cafc50ac00593b6acdf8efb --module taenggu308_faucet_coin --function mint --args 0x812c9110578cf42117311d37fb2b22346c463e30f736fc5ed7f1460866e0b021   1000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

Transaction Digest: Faf7gmKNZpDwCvfQDTNpXxrnYbdQufejiVjoDxFtn8RN

sui client call --package 0x5d1e79142c2f6cb453f5c660e0760fdf069875bd5cafc50ac00593b6acdf8efb  --module taenggu308_faucet_coin --function mint --args 0x812c9110578cf42117311d37fb2b22346c463e30f736fc5ed7f1460866e0b021 1000 0xbe3ed1c5cd63b24b4792476ae6650fb274f5cfe099651b011b7dae4a5d4ed215

Transaction Digest: H3yxTLRUAqGuXJZeThtgqvRxSApo4kaXbPW3iPt6hMNX

task4:

sui client publish

PackageID: 0xeace002148dfefdd3ea8a01982b29a3db8f70c31d102ee58d86bdc62c14d71b3          

sui client call --package 0xeace002148dfefdd3ea8a01982b29a3db8f70c31d102ee58d86bdc62c14d71b3 --module taenggu308_nft --function mint_to --args "taenggu308" 0xbe3ed1c5cd63b24b4792476ae6650fb274f5cfe099651b011b7dae4a5d4ed215

ObjectID: 0x4b93a6e65ed348467bfcea518c083ec9a0ea16010c5ee78038ffbe7c4fdf2aa5      

Transaction Digest: 7RJa6i9JCDFmR4ZkjDRqZJTkhrcszn16LpscrWo2f5uT

sui client call --package 0xeace002148dfefdd3ea8a01982b29a3db8f70c31d102ee58d86bdc62c14d71b3 --module taenggu308_nft --function mint_to --args "SEND BY taenggu308" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 

Transaction Digest: EG7Kwsgc52K9Ss2XGvxJaNSGN8GbMs1Pt3YnPQfqQApT

task7:

task7需要拿到hash，发了个简单的package来获得flag hash

sui client object 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147

调用函数：
sui client call --function get_flag --module check_hash --package $PACKAGE_ID --args taenggu308 "j8(V3=L&8I~v>%^u-'KU"

根据交易hash找到输出flag hash的vector串

调用公共包的公共函数：
sui client call --function get_flag --module check_in --package 0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d --args [147,93,67,193,252,155,212,58,148,115,205,98,186,171,197,159,173,15,76,118,61,160,77,82,199,244,145,166,239,217,226,30] taenggu308 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147  0x8

digest: EEzRzfVwxhzs1P7w8iHFXWsr4wMaZSuDQd8QvMxN8hHW
