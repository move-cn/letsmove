
sui client call --function mint --module YJSHI2015 --package 0xf2f9f932744b1430d721d18e1b6fc5b767e67a0858a0d76340b2b55cdcdc77df --args 0x1686882ecc4e3cd85ad68ff70df688dd85eed8801d2a29bd3b89ab18d94bd317 666000000000 0xc4301a727914c051c987331f30d002ef907f6f6e4badfec8981e6275ed22486c --gas-budget 10000000

sui client call --function mint --module YJSHI2015FAUCET --package 0xf2f9f932744b1430d721d18e1b6fc5b767e67a0858a0d76340b2b55cdcdc77df --args 0x70a9863ed508b37f0a3cf8d1debb33ee1a94e25a87335e334cb21c08e63d6c12 888000000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000


sui client transfer [OPTIONS] --to <TO> --object-id <OBJECT_ID> --gas-budget <GAS_BUDGET>

sui client transfer --to 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --object-id 0x9c4d630b88b3ae441d5fa24fa75cdd9c884b49f35dfb582da288e1c285d0e1ed 

sui client pay [OPTIONS] --gas-budget <GAS_BUDGET>

sui client pay   --input-coins 0x9c4d630b88b3ae441d5fa24fa75cdd9c884b49f35dfb582da288e1c285d0e1ed --recipients 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --amounts 6000000000


Usage: sui client call [OPTIONS] --package <PACKAGE> --module <MODULE> --function <FUNCTION> --gas-budget <GAS_BUDGET>

sui client call --package 0x10ab2a6b138ae496bc18e1668ba030202b65ab1104e374ebcac24dcab1f2ad64 --module YJSHI2015NFT --function mint --args YJSHI2015 https://avatars.githubusercontent.com/u/10650592?v=4 