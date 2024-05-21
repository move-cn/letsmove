task1: 
sui client publish --gas-budget 20000000

提示：
Cannot find gas coin for signer address 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd with amount sufficient for the required gas budget 20000000. If you are using the pay or transfer commands, you can use pay-sui or transfer-sui commands instead, which will use the only object as gas payment.

sui client faucet

╭────────────────────────────────────────────────────────────────────┬────────────────────┬──────────────────╮
│ gasCoinId                                                          │ mistBalance (MIST) │ suiBalance (SUI) │
├────────────────────────────────────────────────────────────────────┼────────────────────┼──────────────────┤
│ 0x14235f111b81ef55c5889f9743da8977cecd760e47f20d5ac34eed24b97c065f │ 1000000000         │ 1.00             │
╰────────────────────────────────────────────────────────────────────┴────────────────────┴──────────────────╯

sui client publish --gas-budget 20000000

│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xf24f35d9cd430bd7cdfdef40127b6e43ac7dd3219fe8344f45cf7675c312b557                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 8KgNMNuf7vFXm1dc8Ypf5sWE2WSQdR1bk86BUxBkoFWF                                          │
│  │ Modules: hello_move                                                                           │
│  └──                        

task2:  

sui move new marktranet_coin

sui client publish --gas-budget 20000000

Published Objects:                                                                                                                            │
│  ┌──                                                                                                                                          │
│  │ PackageID: 0x33952751fb7ac5bea14a1e0588660ea2a3450762c83c9691c253214d998c41c9                                                              │
│  │ Version: 1                                                                                                                                 │
│  │ Digest: DWWqgjBsYbsh14AHBEMCQxTUd43DDPH5SbiW5SAvfVmq                                                                                       │
│  │ Modules: marktranet_coin                                                                                                                   │
│  └──                                                                                                                  

TreasureID: 0x189417a7a2e4fac62e4ccfb63b3c8a73c11d6dc9f13979c16143f19a14666376

0x33952751fb7ac5bea14a1e0588660ea2a3450762c83c9691c253214d998c41c9::marktranet_coin::MARKTRANET_COIN

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0x33952751fb7ac5bea14a1e0588660ea2a3450762c83c9691c253214d998c41c9  --module marktranet_coin --function mint --args 0x189417a7a2e4fac62e4ccfb63b3c8a73c11d6dc9f13979c16143f19a14666376 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: AH8KL6ZgQjTS9HW2bNT8HrkyanVBtgV8BCKZFjz2SaHE

sui move new marktranet_faucet_coin

sui client publish --gas-budget 20000000

Published Objects:                                                                                                                            │
│  ┌──                                                                                                                                          │
│  │ PackageID: 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8                                                             │
│  │ Version: 1                                                                                                                                 │
│  │ Digest: 2WCSN895y6jUssKvCnvuKWDULprrEqScQcuETFZYg63j                                                                                        │
│  │ Modules: marktranet_faucet_coin                                                                                                                    │
│  └──         


TreasureID: 0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b  

type: 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8::marktranet_faucet_coin::MARKTRANET_FAUCET_COIN>

mint给指定的地址`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8    --module marktranet_faucet_coin --function mint --args 0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b  1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000

Transaction Digest: 8fRrvpqqWNYAMbw5Tek9EEUxQZ71p2cSsoJFHBqyvEGZ

mint给自己`0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd`:

sui client call --package 0x70d4e4cc6c8cc6c49d5cd4aeb5d68b0c3b74b1a670a8bbab0d8d963e63c8e1e8    --module marktranet_faucet_coin --function mint --args 0x400159161edd67cd40cc8ff67a974f0cff2028b9c5f20bd13b5b5f162be2a16b  1000000 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd --gas-budget 50000000

Transaction Digest: CASz66X5zgMc7SNLFmGT23z4r3kowWympk6hNoY8whFt

nft:

sui client publish --gas-budget 20000000

│ Published Objects:                                                                                                             │
│  ┌──                                                                                                                           │
│  │ PackageID: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a                                               │
│  │ Version: 1                                                                                                                  │
│  │ Digest: 9N3uvgtrs3vq2BRyJgK5J2dUa1DGuNjiwZZ3SaY81xsE                                                                        │
│  │ Modules: marktranet_nft                                                                                                     │
│  └──                                                                                          

拿到包 PackageID: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a 

自己的地址： `0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd`:

sui client call --package 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a  --module marktranet_nft --function mint_to --args "Marktranet" 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd --gas-budget 20000000

│  ┌──                                                                                                    │
│  │ ObjectID: 0x114b3c14f511bc430a118719772e0051d57a2ca0aac2a44ad3387c3fb8fcd7f8                         │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                           │
│  │ Owner: Account Address ( 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd )        │
│  │ ObjectType: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a::marktranet_nft::NFT  │
│  │ Version: 123314097                                                                                   │
│  │ Digest: Ez6qiTJBQUjzWKTwbe2RKtCXdyubrzcdYgrN1K1vg8GW                                                 │
│  └──   

mint给`0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`：

sui client call --package 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a  --module marktranet_nft --function mint_to --args "Marktranet" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 20000000

│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x99e306d9d2e9791751da3de7df45518a4be639f149df11a43c7efcdc79da3f6c                         │
│  │ Sender: 0xe3931db5852f8577bbd953b8bab956a3f4f56c752b9327b153e82599ec4145dd                           │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )        │
│  │ ObjectType: 0xe31be82f4df17d375df73d5497700624725f5b0f003646ce1713dc157461026a::marktranet_nft::NFT  │
│  │ Version: 123314098                                                                                   │
│  │ Digest: 4989X3yyT5GSCmXJzfKdsBFoPNtHSat269iNHLLmUkQi                                                 │
│  └──         