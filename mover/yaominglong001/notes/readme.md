## task1 hello move 

sui client faucet 

╭────────────────────────────────────────╮
│ Balance of coins owned by this address │
├────────────────────────────────────────┤
│ ╭─────────────────────────────────╮    │
│ │ coin  balance (raw)  balance    │    │
│ ├─────────────────────────────────┤    │
│ │ Sui   2000000000     2.00 SUI   │    │
│ ╰─────────────────────────────────╯    │
╰────────────────────────────────────────╯

sui client publish 

 PackageID: 0xbc0d506d085d31917b7416923eb9c19e98750098fff5113ba62911756c258127 


## task2 

sui client publish

PackageID: 0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f 
ObjectID: 0xbfe0861e4dfff7b57abfac202bc75c5f7fd4a7d37358dffed560d84b47a42cf0  
0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f::yaominglong001_faucet_coin::YAOMINGLONG001_FAUCET_COIN

ObjectID: 0x17f3279b33d5739f263012eb8279dd8c545971eb2666d3e601115da680a91194
0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f::yaominglong001_coin::YAOMINGLONG001_COIN

export ADDR1=0xad6ae9a90e742c884906f852b63944606815bc324899b31c2f626f8b3f2d1a43
export ADDR2=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package 0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f  --module yaominglong001_coin --function mint --args 0x17f3279b33d5739f263012eb8279dd8c545971eb2666d3e601115da680a91194 1000 $ADDR2

Transaction Digest: 4HYiZmS6CEn7qQpyitE1GeqWva17ZgBiskNTtVCFw4Tq

sui client call --package 0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f   --module yaominglong001_faucet_coin --function mint --args 0xbfe0861e4dfff7b57abfac202bc75c5f7fd4a7d37358dffed560d84b47a42cf0     1000 $ADDR1

Transaction Digest: He245LZYWX8FLyZfe22jC4B2edps5Xvq9eoh5EEaU8iV

sui client call --package 0x2dbd6e3eddfd792695e9da3beb1519f09cd8f3671fc2159a25eaf3210a73fe5f  --module yaominglong001_faucet_coin --function mint --args 0xbfe0861e4dfff7b57abfac202bc75c5f7fd4a7d37358dffed560d84b47a42cf0  1000 $ADDR2

Transaction Digest: EZiEdZvHWV4KJrhbHFjVBpsfUD8PBDifKfFXLjMxcSin


## task3

export PACKAGE_ID=0xb8808437c7fe64d667baa8af677ec329d035de4d11bfbf3277458e6677a9f2aa                         
export MY_ADDR=0xad6ae9a90e742c884906f852b63944606815bc324899b31c2f626f8b3f2d1a43 

sui client call --package $PACKAGE_ID --module yaominglong001_nft --function mint_to --args "yaominglong" $MY_ADDR 

Transaction Digest: 5WDcBPLa5WWqMPkqkB1xvKqp2JheMFLmsRJnP7APdxmx

ObjectID:  0xb9faaf32425cceb31c738eac6e3c3fdf0453017e50186ffca9f52c54c7f22f72        

export TARGET_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module yaominglong001_nft --function mint_to --args "yaominglong001" $TARGET_ADDR 

Transaction Digest: 25ossVvh9CdanZ9RRDrGSXa4pq5nCtEFBuXsRDDGG1iE
