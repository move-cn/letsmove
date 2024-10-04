# 2 
export ADDR1=0xf981d436b55b9f30e66b879b39682a6d7e88bfc065cf1c4028ce76024def6d25 
export ADDR2=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
export PACKAGE=0x4ec11c0624cd41569b57b92f65e9e55513cac12bb341d8b698bbdd61ce0fb003      
sui client call --package $PACKAGE --module thomahuer_coin --function mint --args 0x02a7be5ec9cba262e065a2a5a88fef708963a9c92d2b7244c468a28d839c7145  1000 $ADDR2

Transaction Digest: 5cyeHFDBPajpzQSqAigzi3RCsgwxPxjPjsbkCMwEMt72

sui client call --package $PACKAGE --module thomahuer_faucet_coin --function mint --args 0x8f73860e86cd6af37dee33adfdb3e1c623e89135c1939e5410e07833af3ac19b         1000 $ADDR1

Transaction Digest: 5H7E78nf2iGtVwatTzKJN7nAkQyusZoPwi1vXgwuceHA

sui client call --package $PACKAGE --module thomahuer_faucet_coin --function mint --args 0x8f73860e86cd6af37dee33adfdb3e1c623e89135c1939e5410e07833af3ac19b      1000 $ADDR2

Transaction Digest: 3jJ2FCH9UjcdADz5w9HajRTix51Ah49KF1yZCwpnyyE4

# 3
export PACKAGE_ID=0xe92524438738280f0145ec942255e759fe969e00b8ed9449e5d59f1367f1ab10            
export MY_ADDR=0xf981d436b55b9f30e66b879b39682a6d7e88bfc065cf1c4028ce76024def6d25 

sui client call --package $PACKAGE_ID --module thomahuer_nft --function mint_to --args "nft for thoma" $MY_ADDR 

ObjectID:  0x2dcfa41933343219f40217efc11240d734c1aa09025e783d127c784e86342a99   

export TARGET_ADDR=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2

sui client call --package $PACKAGE_ID --module thomahuer_nft --function mint_to --args "nft for thoma" $TARGET_ADDR 

Transaction Digest: 6m1g8vxCjg8qz8pL5W6mmBDrZpibeTbnigSWxQhnrkPp