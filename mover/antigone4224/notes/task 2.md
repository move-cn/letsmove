#  完成两个Coin合约的上链部署
- 上链网络: mainnet

## 需求
### 完成 Coin相关知识的学习

阅读文档：[Create Coins and Tokens | Sui Documentation](https://docs.sui.io/guides/developer/sui-101/create-coin)

### 完成 `My Coin` 的学习并部署主网

先切换到mainnet

```zsh
 #: sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
 #: sui client switch --env mainet
 #: sui client active-env
 mainnet
```

编写MYCOIN(摘自文档)

```
module antigone4224_coin::antigone4224c {
    use std::option;
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};


    public struct ANTIGONE4224C has drop {}

    fun init(witness: ANTIGONE4224C,ctx: &mut TxContext) {
        let (treasury,metadata) = coin::create_currency(witness,6,b"ANTIGONE4224C",b"",b"",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public fun mint(
    treasury_cap: &mut TreasuryCap<ANTIGONE4224C>, 
    amount: u64, 
    recipient: address, 
    ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient)
    }

}
```



在摘抄文档之后编译报错，发现在move on sui 2024版本之后struct都需要public声明才可以正常编译

成功编译&发布

```
Successfully verified dependencies on-chain against source.
Transaction Digest: 4smahnpc1m7QRbx3M8FL69faKMnGjjaWGU2KGnCLMqe1
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data
      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
      │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
      │
│ Gas Budget: 500000000 MIST
      │
│ Gas Price: 750 MIST
      │
│ Gas Payment:
      │
│  ┌──
      │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
      │
│  │ Version: 89704684
      │
│  │ Digest: 9PgUjKfvwKG2uLMU9j2sMBekvayHc6yMkvh5F99WSnAG
      │
│  └──
      │
│
      │
│ Transaction Kind: Programmable
      │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects
    │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮
      │
│ │ Commands                                                                │
      │
│ ├─────────────────────────────────────────────────────────────────────────┤
      │
│ │ 0  Publish:                                                             │
      │
│ │  ┌                                                                      │
      │
│ │  │ Dependencies:                                                        │
      │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │
      │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │
      │
│ │  └                                                                      │
      │
│ │                                                                         │
      │
│ │ 1  TransferObjects:                                                     │
      │
│ │  ┌                                                                      │
      │
│ │  │ Arguments:                                                           │
      │
│ │  │   Result 0                                                           │
      │
│ │  │ Address: Input  0                                                    │
      │
│ │  └                                                                      │
      │
│ ╰─────────────────────────────────────────────────────────────────────────╯
      │
│
      │
│ Signatures:
      │
│    SB5CRbNOlM4C6iaKDIW7aeZ+ga8U1g/ceCQbb70MHokQYLAPXDE8k5xDJjDfMROHipni3kIYkTc7MJDg5EiZDQ==
      │
│
      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4smahnpc1m7QRbx3M8FL69faKMnGjjaWGU2KGnCLMqe1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 367                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x19aa0a4652000a44238e503465504379229d99417ffa779d4fed2e6f2efd65a0                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704685                                                                              │
│  │ Digest: 9oykwLFzffrkLj31iHtKmzbsAkQ4DsAeHHhxWCzBiCPe                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x24a46570e2e37d0c8cf96d30b1266f7a2001dfd39bad20e9606e3a24a3c4a77a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 89704685                                                                              │
│  │ Digest: HEQzgkKwwvnUsLCWEPVegwBz4oYDHzMpQbkYhRDns8MQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704685                                                                              │
│  │ Digest: 8Xjbf4uW2acPStnL2Jbgyabb7kuqcGzbZpDDyV8hwa6T                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4WtVZsyBcwcVF1qua7GfMUouKk5S2kidDfcvt1E59jwh                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704685                                                                              │
│  │ Digest: 3SUztmikCx9mmjQqizhHejboEKm36v5cLKiiusvNVTrx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704685                                                                              │
│  │ Digest: 3SUztmikCx9mmjQqizhHejboEKm36v5cLKiiusvNVTrx                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13649600 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    72F2ATmyCKexg7FZDnbnGYNgLNGjmoAkyCD516ynJAeo                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
                                   │
│  ┌──
                                   │
│  │ ObjectID: 0x19aa0a4652000a44238e503465504379229d99417ffa779d4fed2e6f2efd65a0
                                   │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                   │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                          │
│  │ ObjectType: 0x2::package::UpgradeCap
                                   │
│  │ Version: 89704685
                                   │
│  │ Digest: 9oykwLFzffrkLj31iHtKmzbsAkQ4DsAeHHhxWCzBiCPe
                                   │
│  └──
                                   │
│  ┌──
                                   │
│  │ ObjectID: 0x24a46570e2e37d0c8cf96d30b1266f7a2001dfd39bad20e9606e3a24a3c4a77a
                                   │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                   │
│  │ Owner: Immutable
                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac::antigone4224c::ANTIGONE4224C>  │
│  │ Version: 89704685
                                   │
│  │ Digest: HEQzgkKwwvnUsLCWEPVegwBz4oYDHzMpQbkYhRDns8MQ
                                   │
│  └──
                                   │
│  ┌──
                                   │
│  │ ObjectID: 0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28
                                   │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                   │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                          │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac::antigone4224c::ANTIGONE4224C>   │
│  │ Version: 89704685
                                   │
│  │ Digest: 8Xjbf4uW2acPStnL2Jbgyabb7kuqcGzbZpDDyV8hwa6T
                                   │
│  └──
                                   │
│ Mutated Objects:
                                   │
│  ┌──
                                   │
│  │ ObjectID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
                                   │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                   │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
                                   │
│  │ Version: 89704685
                                   │
│  │ Digest: 3SUztmikCx9mmjQqizhHejboEKm36v5cLKiiusvNVTrx
                                   │
│  └──
                                   │
│ Published Objects:
                                   │
│  ┌──
                                   │
│  │ PackageID: 0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac
                                   │
│  │ Version: 1
                                   │
│  │ Digest: 4WtVZsyBcwcVF1qua7GfMUouKk5S2kidDfcvt1E59jwh
                                   │
│  │ Modules: antigone4224c
                                   │
│  └──
                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13421480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Coin 名称：antigone4224c 

 antigone4224_coin packageid:0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac

TreasuryCap:0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28

给指定地址发送 antigone4224c

```zsh
#: sui client call --function mint --module antigone4224c --package 0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac --args 0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28 10 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 500000000
```

输出：

```
Transaction Digest: phiebRvjcF5iauoZvXQASmCmPvps3TdAvQTBGyCz63d
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data
      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
      │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
      │
│ Gas Budget: 500000000 MIST
      │
│ Gas Price: 750 MIST
      │
│ Gas Payment:
      │
│  ┌──
      │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
      │
│  │ Version: 89704685
      │
│  │ Digest: 3SUztmikCx9mmjQqizhHejboEKm36v5cLKiiusvNVTrx
      │
│  └──
      │
│
      │
│ Transaction Kind: Programmable
      │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects
    │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28
    │ │
│ │ 1   Pure Arg: Type: u64, Value: "10"
    │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮
      │
│ │ Commands                                                                         │
      │
│ ├──────────────────────────────────────────────────────────────────────────────────┤
      │
│ │ 0  MoveCall:                                                                     │
      │
│ │  ┌                                                                               │
      │
│ │  │ Function:  mint                                                               │
      │
│ │  │ Module:    antigone4224c                                                      │
      │
│ │  │ Package:   0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac │
      │
│ │  │ Arguments:                                                                    │
      │
│ │  │   Input  0                                                                    │
      │
│ │  │   Input  1                                                                    │
      │
│ │  │   Input  2                                                                    │
      │
│ │  └                                                                               │
      │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯
      │
│
      │
│ Signatures:
      │
│    XgBjNvMh9v1KsejiQ7osjhdFG3W4iPVsHY75XRfyy6Tdgn0BV8XKXG7NgKz/vTN10zF55YcDXvE0oAILKOjGBA==
      │
│
      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: phiebRvjcF5iauoZvXQASmCmPvps3TdAvQTBGyCz63d                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 367                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xae85cf721b70eb4a67842cb9cb6bc5fdb714b7876ae4b134b97eb45a363bfb10                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 89704686                                                                              │
│  │ Digest: 2WiRkv3TXiT6gGVfEgn3w3z5a7hkX5fJaLsxFkHfaj6Q                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704686                                                                              │
│  │ Digest: DiU4zHh3WifPdGPACqcq1eWPwrgrPV5Y63gGvyUsyWPn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704686                                                                              │
│  │ Digest: 9XHykKSNzqpiU3knr5SAccMdmTahyEPsYxdtTWqUPG36                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704686                                                                              │
│  │ Digest: DiU4zHh3WifPdGPACqcq1eWPwrgrPV5Y63gGvyUsyWPn                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4286400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2798928 MIST                                                                   │
│    Non-refundable Storage Fee: 28272 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4smahnpc1m7QRbx3M8FL69faKMnGjjaWGU2KGnCLMqe1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
                                  │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
                                  │
│  ┌──
                                  │
│  │ ObjectID: 0xae85cf721b70eb4a67842cb9cb6bc5fdb714b7876ae4b134b97eb45a363bfb10
                                  │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                  │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                         │
│  │ ObjectType: 0x2::coin::Coin<0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac::antigone4224c::ANTIGONE4224C>         │
│  │ Version: 89704686
                                  │
│  │ Digest: 2WiRkv3TXiT6gGVfEgn3w3z5a7hkX5fJaLsxFkHfaj6Q
                                  │
│  └──
                                  │
│ Mutated Objects:
                                  │
│  ┌──
                                  │
│  │ ObjectID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
                                  │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                  │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
                                  │
│  │ Version: 89704686
                                  │
│  │ Digest: DiU4zHh3WifPdGPACqcq1eWPwrgrPV5Y63gGvyUsyWPn
                                  │
│  └──
                                  │
│  ┌──
                                  │
│  │ ObjectID: 0xc2ef5016570979452996020fd231df6369761a91d916f38ec3446b6018dc9b28
                                  │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                  │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                         │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac::antigone4224c::ANTIGONE4224C>  │
│  │ Version: 89704686
                                  │
│  │ Digest: 9XHykKSNzqpiU3knr5SAccMdmTahyEPsYxdtTWqUPG36
                                  │
│  └──
                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes
        │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──
        │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )               │
│  │ CoinType: 0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac::antigone4224c::ANTIGONE4224C  │
│  │ Amount: 10
        │
│  └──
        │
│  ┌──
        │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )               │
│  │ CoinType: 0x2::sui::SUI
        │
│  │ Amount: -2237472
        │
│  └──
        │
╰─────────────
```



### 完成 `Faucet Coin` 的学习并部署主网

```
module faucet::antigone4224Faucet {
    use std::option;
    use sui::coin::{Self,TreasuryCap};
    use sui::event::emit;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct ANTIGONE4224FAUCET has drop {}

    public struct MintEvent has copy, drop{
        amount: u64,
        recipient: address
    }

    fun init(witness: ANTIGONE4224FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"ANTIGONE4224FAUCET", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<ANTIGONE4224FAUCET>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext,
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);

        emit(MintEvent{
            amount,
            recipient
        })
    }
}
```

```
#: sui client publish --gas-budget 500000000
```

```
Transaction Digest: 6tLVqkMjA84frmeV2dw61o8gNyTmeBhPTwz7qKFWu3Ph
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data
      │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
      │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
      │
│ Gas Budget: 500000000 MIST
      │
│ Gas Price: 750 MIST
      │
│ Gas Payment:
      │
│  ┌──
      │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
      │
│  │ Version: 89704686
      │
│  │ Digest: DiU4zHh3WifPdGPACqcq1eWPwrgrPV5Y63gGvyUsyWPn
      │
│  └──
      │
│
      │
│ Transaction Kind: Programmable
      │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects
    │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮
      │
│ │ Commands                                                                │
      │
│ ├─────────────────────────────────────────────────────────────────────────┤
      │
│ │ 0  Publish:                                                             │
      │
│ │  ┌                                                                      │
      │
│ │  │ Dependencies:                                                        │
      │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │
      │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │
      │
│ │  └                                                                      │
      │
│ │                                                                         │
      │
│ │ 1  TransferObjects:                                                     │
      │
│ │  ┌                                                                      │
      │
│ │  │ Arguments:                                                           │
      │
│ │  │   Result 0                                                           │
      │
│ │  │ Address: Input  0                                                    │
      │
│ │  └                                                                      │
      │
│ ╰─────────────────────────────────────────────────────────────────────────╯
      │
│
      │
│ Signatures:
      │
│    hqjC7J0KWUPsQL/j/ltBcTNkbtENCxcljruFSlMFIIkj8Rsn0QGDpQ0IySL9W61Q0AZxfj9z8g5j3wT18uAIBA==
      │
│
      │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6tLVqkMjA84frmeV2dw61o8gNyTmeBhPTwz7qKFWu3Ph                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 367                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Etu3JTyWdyNtJD6Vm6C2SUDAjEdpQX3pvDLYbRvAvFtQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x26a3eda372c87b744456952d1167347c5549deb356487fb33f50c8000a7a8d36                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704687                                                                              │
│  │ Digest: Hf8fyQq7q9c3Sv18jndmH8ugDFdJAQdhtURguFoMgqpq                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x805258cc707c834325d8ba3d9469aff3b034647c8b765e880cf42c91900d4ef0                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704687                                                                              │
│  │ Digest: 7dw64VwJkCpDgfTrQEBgDqCiP37HepfiisC1brREYfCJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe671793569b0a368015ce460f97babc9ea3e1bba9863d53c2ee9c6ca54544f90                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 89704687                                                                              │
│  │ Digest: 41SpS7w2BUpe29TgV1XAaNSR6ipBiRyL28rXajafa7Ud                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704687                                                                              │
│  │ Digest: 75daYzWWFmjB9VA9UfM5cs4FkBYU8Xf45ZfUrAJCGx5u                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 89704687                                                                              │
│  │ Digest: 75daYzWWFmjB9VA9UfM5cs4FkBYU8Xf45ZfUrAJCGx5u                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 15048000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    phiebRvjcF5iauoZvXQASmCmPvps3TdAvQTBGyCz63d                                                    │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
                                             │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
                                             │
│  ┌──
                                             │
│  │ ObjectID: 0x26a3eda372c87b744456952d1167347c5549deb356487fb33f50c8000a7a8d36
                                             │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                             │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                                    │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8::antigone4224Faucet::ANTIGONE4224FAUCET>   │
│  │ Version: 89704687
                                             │
│  │ Digest: Hf8fyQq7q9c3Sv18jndmH8ugDFdJAQdhtURguFoMgqpq
                                             │
│  └──
                                             │
│  ┌──
                                             │
│  │ ObjectID: 0x805258cc707c834325d8ba3d9469aff3b034647c8b765e880cf42c91900d4ef0
                                             │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                             │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                                    │
│  │ ObjectType: 0x2::package::UpgradeCap
                                             │
│  │ Version: 89704687
                                             │
│  │ Digest: 7dw64VwJkCpDgfTrQEBgDqCiP37HepfiisC1brREYfCJ
                                             │
│  └──
                                             │
│  ┌──
                                             │
│  │ ObjectID: 0xe671793569b0a368015ce460f97babc9ea3e1bba9863d53c2ee9c6ca54544f90
                                             │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                             │
│  │ Owner: Immutable
                                             │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8::antigone4224Faucet::ANTIGONE4224FAUCET>  │
│  │ Version: 89704687
                                             │
│  │ Digest: 41SpS7w2BUpe29TgV1XAaNSR6ipBiRyL28rXajafa7Ud
                                             │
│  └──
                                             │
│ Mutated Objects:
                                             │
│  ┌──
                                             │
│  │ ObjectID: 0x4892c081ebedfeb087a5d225c85fae1e083f369ec56959ab4153a2e85b0e7c94
                                             │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8
                                             │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )                                                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
                                             │
│  │ Version: 89704687
                                             │
│  │ Digest: 75daYzWWFmjB9VA9UfM5cs4FkBYU8Xf45ZfUrAJCGx5u
                                             │
│  └──
                                             │
│ Published Objects:
                                             │
│  ┌──
                                             │
│  │ PackageID: 0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8
                                             │
│  │ Version: 1
                                             │
│  │ Digest: Etu3JTyWdyNtJD6Vm6C2SUDAjEdpQX3pvDLYbRvAvFtQ
                                             │
│  │ Modules: antigone4224Faucet
                                             │
│  └──
                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14819880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

antigone4224Faucet

packageid:0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8

提交 `My Coin` 和 `Faucet Coin` 合约发布`package id`

coin:0xc570d3d2910473578c2a268cbeab362253613d5c29c92904d851cbceed5c89ac

faucet:0x184fdb38d567d335ac518b06004b33f48ae97e1eceeac467c35027d0437922e8

### 发送 `My Coin`  给地址 `0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2`

done

