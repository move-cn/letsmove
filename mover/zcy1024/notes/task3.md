1. 创建
```
sui move new nft_study
touch nft_study/sources/nft.move
```
2. 代码
```
module nft_study::nft {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use std::string::{Self, String};
    use sui::url::{Self, Url};
    use sui::transfer;

    struct WuKongNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = WuKongNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };
        transfer::transfer(nft, recipient);
    }
}
```
3. build
```
sui move build
```
4. 发布
```
sui client publish 

# 成功后信息如下：
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING nft_study
Successfully verified dependencies on-chain against source.
Transaction Digest: Cx1m8wGnrUUTFaGMQAUP5Y5vjPwqmxwy4RuetwpT9LRb
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                   │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                    │
│  │ Version: 81313242                                                                                         │
│  │ Digest: CE5xL57va3s8ftZepSRfoSNGf7mTmYCcz3ZraeZdv1L4                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    6sE83cGtpglM0FawCdBFt2OsnlWKeT/t/EIzx4AearBNHSPgaj+/JbSyJZ1RqUn6TsRpypzQAz3HX2WB1oBYDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Cx1m8wGnrUUTFaGMQAUP5Y5vjPwqmxwy4RuetwpT9LRb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 351                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa09039f02bd5957d25d16c7f3ff11515b76b0407e9d994c5e65525c36bbc0b53                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: U3YPGqkWe94fgZFz51tDZv4toEDf8XgbJz1tAQid3Up                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc453e030af91202945cf8c78f03ffdce17a1a4ba13ed636a6ff17b3f69046496                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313243                                                                              │
│  │ Digest: AhNrjrRwpHzVznnASwgCfSkciVZiXAfX5ArRByqGwtsd                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313243                                                                              │
│  │ Digest: 4Vr7EYVyYwjpLwTRuy2ETSP86GF55bRGcPdpQJT8YcHb                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313243                                                                              │
│  │ Digest: 4Vr7EYVyYwjpLwTRuy2ETSP86GF55bRGcPdpQJT8YcHb                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7850800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    mfu3eGvn1HzJevdZuEj5amPq5eSofRWkWmNxgwfbymV                                                    │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    5HS8mk6beiTZDouE62oQVoQ1wYhyK2geCufAMAdWKz6S                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xc453e030af91202945cf8c78f03ffdce17a1a4ba13ed636a6ff17b3f69046496                  │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                    │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 81313243                                                                             │
│  │ Digest: AhNrjrRwpHzVznnASwgCfSkciVZiXAfX5ArRByqGwtsd                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                  │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                    │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 81313243                                                                             │
│  │ Digest: 4Vr7EYVyYwjpLwTRuy2ETSP86GF55bRGcPdpQJT8YcHb                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xa09039f02bd5957d25d16c7f3ff11515b76b0407e9d994c5e65525c36bbc0b53                 │
│  │ Version: 1                                                                                    │
│  │ Digest: U3YPGqkWe94fgZFz51tDZv4toEDf8XgbJz1tAQid3Up                                           │
│  │ Modules: nft                                                                                  │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7622680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5. 设置环境变量
```
export PACKAGE_ID=0xa09039f02bd5957d25d16c7f3ff11515b76b0407e9d994c5e65525c36bbc0b53
export NAME="BLACK MYTH WUKONG"
export DESCRIPTION="CONFRONT DESTINY AUGUST 20, 2024"
export URL="https://github.com/zcy1024/SuiStudy/blob/main/coin_study/imgs/WUKONG.png?raw=true"
export TO_ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```
6. 交互
```
sui client call --package $PACKAGE_ID --module nft --function mint --args $NAME $DESCRIPTION $URL $TO_ADDRESS 

# 成功后信息如下：
Transaction Digest: 8PbkD3uBb6rdHoT8PvQ5j9wfpxXW1ByUqDr3ubpdhCkf
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                                               │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                     │
│ Gas Owner: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                                                  │
│ Gas Budget: 100000000 MIST                                                                                                     │
│ Gas Price: 750 MIST                                                                                                            │
│ Gas Payment:                                                                                                                   │
│  ┌──                                                                                                                           │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                                                      │
│  │ Version: 81313243                                                                                                           │
│  │ Digest: 4Vr7EYVyYwjpLwTRuy2ETSP86GF55bRGcPdpQJT8YcHb                                                                        │
│  └──                                                                                                                           │
│                                                                                                                                │
│ Transaction Kind: Programmable                                                                                                 │
│ ╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                                              │ │
│ ├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "BLACK MYTH WUKONG"                                                                 │ │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "CONFRONT DESTINY AUGUST 20, 2024"                                                  │ │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://github.com/zcy1024/SuiStudy/blob/main/coin_study/imgs/WUKONG.png?raw=true" │ │
│ │ 3   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2"                   │ │
│ ╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                                           │
│ │ Commands                                                                         │                                           │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                                           │
│ │ 0  MoveCall:                                                                     │                                           │
│ │  ┌                                                                               │                                           │
│ │  │ Function:  mint                                                               │                                           │
│ │  │ Module:    nft                                                                │                                           │
│ │  │ Package:   0xa09039f02bd5957d25d16c7f3ff11515b76b0407e9d994c5e65525c36bbc0b53 │                                           │
│ │  │ Arguments:                                                                    │                                           │
│ │  │   Input  0                                                                    │                                           │
│ │  │   Input  1                                                                    │                                           │
│ │  │   Input  2                                                                    │                                           │
│ │  │   Input  3                                                                    │                                           │
│ │  └                                                                               │                                           │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                                           │
│                                                                                                                                │
│ Signatures:                                                                                                                    │
│    V32QNc9Gp7nfzS7P7ymcf+u6dvWu7aW1b9GTNAJz8DKUaRbUE7D/I2TV4MTDXMnAw3/Z0lHbTnBtdRcYT6cuAw==                                    │
│                                                                                                                                │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8PbkD3uBb6rdHoT8PvQ5j9wfpxXW1ByUqDr3ubpdhCkf                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 351                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e66e79f46e31cbe69c9db0f6eadecd54669eb191390d1a72f5cc7921eb2f1d7                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 81313244                                                                              │
│  │ Digest: 767xZEZi2ZbB6ykrXPBL7PtfAHdvisgK1Qfd17WH46Uz                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313244                                                                              │
│  │ Digest: CsMopT8jToUMk9TAYBtPp9M6TbXLtGWCqDRKvj4MrW7p                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                         │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ Version: 81313244                                                                              │
│  │ Digest: CsMopT8jToUMk9TAYBtPp9M6TbXLtGWCqDRKvj4MrW7p                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3283200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Cx1m8wGnrUUTFaGMQAUP5Y5vjPwqmxwy4RuetwpT9LRb                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                   │
│  ┌──                                                                                               │
│  │ ObjectID: 0x5e66e79f46e31cbe69c9db0f6eadecd54669eb191390d1a72f5cc7921eb2f1d7                    │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                      │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )   │
│  │ ObjectType: 0xa09039f02bd5957d25d16c7f3ff11515b76b0407e9d994c5e65525c36bbc0b53::nft::WuKongNFT  │
│  │ Version: 81313244                                                                               │
│  │ Digest: 767xZEZi2ZbB6ykrXPBL7PtfAHdvisgK1Qfd17WH46Uz                                            │
│  └──                                                                                               │
│ Mutated Objects:                                                                                   │
│  ┌──                                                                                               │
│  │ ObjectID: 0x6a8d2d47ad669e0ff5d4c4d32ddb282014daca375f3eabf454a42701beb1ec06                    │
│  │ Sender: 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67                      │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                      │
│  │ Version: 81313244                                                                               │
│  │ Digest: CsMopT8jToUMk9TAYBtPp9M6TbXLtGWCqDRKvj4MrW7p                                            │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9e4092b6a894e6b168aa1c6c009f5c1c1fcb83fb95e5aa39144e1d2be4ee0d67 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3055080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

# 通过新创建的 ObjectID: 0x5e66e79f46e31cbe69c9db0f6eadecd54669eb191390d1a72f5cc7921eb2f1d7 去浏览器查询可得 hash: 8PbkD3uBb6rdHoT8PvQ5j9wfpxXW1ByUqDr3ubpdhCkf
# 详细信息可点击 [这里](https://suiscan.xyz/mainnet/tx/8PbkD3uBb6rdHoT8PvQ5j9wfpxXW1ByUqDr3ubpdhCkf) 查看。
```