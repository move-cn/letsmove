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