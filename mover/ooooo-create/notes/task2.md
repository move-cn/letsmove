# task2

## 发布 package

1. 命令

```
sui client publish 
```

2. 返回

```
Transaction Digest: 739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                   │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                    │
│  │ Version: 1192525                                                                                          │
│  │ Digest: 3Tou5dY2UkkkN9sF43zqrBfiPdSDBNRPkBSM1zFhyMBs                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4" │ │
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
│    UNCorXJbRBMDZbUPNmlEeI1ET80jMR4QGaoSoDFGfIj+7lfiYYc4MvnUaS7OydRpE0DMEASilW4Pk43lJX1rDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 371                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x28cdf1ca3ff0afbe0b63456e0898c4f7437a2f972475ce229739f18192c0fdf8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1192526                                                                               │
│  │ Digest: wmxpsz9TVpcQgYuqHZguqdhYBB98fFyRLYSw4NWz82W                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 84cSkms6B19QzCFfrMnzMqv6zJv2bs4VNv8bSkyz4dGo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7d09714d7e1700ff74b481b270d5cad16b441d4443757c0141ec01864a598355                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192526                                                                               │
│  │ Digest: AHPqpBzb56NcnAETyRFXUFCvFSBH5KZVfSeg1L3VfGh2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8de929aed4409be536415d1213fdc7004c0d5b290ca077ccab4fb7b231c83cf2                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1192526                                                                               │
│  │ Digest: FGeGZ61fqQWkxFbjbQNzMPPuB9U41bPokdoCfXMqJ5aw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 1192526                                                                               │
│  │ Digest: AJvLFfZRarp9sCNRzRKzxumotgD4r8yLJtYcaYVykGhV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192526                                                                               │
│  │ Digest: 8rhFd5mZbaCjbf7iXZnH7dHT5442LemSHTf4yvP3sDKb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192526                                                                               │
│  │ Digest: 8TR3tZAXMKsgUxs47YgjZ8qGi9yGUPB23aTd69aYvmkM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192526                                                                               │
│  │ Digest: 8TR3tZAXMKsgUxs47YgjZ8qGi9yGUPB23aTd69aYvmkM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 22997600 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2VvWAHU37NZoCeCKQpaHmo4uzgxcTw92G8cYkVmQE8od                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
              │
│  ┌──
              │
│  │ ObjectID: 0x28cdf1ca3ff0afbe0b63456e0898c4f7437a2f972475ce229739f18192c0fdf8
              │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
              │
│  │ Owner: Immutable
              │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::mycoin::MYCOIN>          │
│  │ Version: 1192526
              │
│  │ Digest: wmxpsz9TVpcQgYuqHZguqdhYBB98fFyRLYSw4NWz82W
              │
│  └──
              │
│  ┌──
              │
│  │ ObjectID: 0x7d09714d7e1700ff74b481b270d5cad16b441d4443757c0141ec01864a598355
              │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )
              │
│  │ ObjectType: 0x2::package::UpgradeCap
              │
│  │ Version: 1192526
              │
│  │ Digest: AHPqpBzb56NcnAETyRFXUFCvFSBH5KZVfSeg1L3VfGh2
              │
│  └──
              │
│  ┌──
              │
│  │ ObjectID: 0x8de929aed4409be536415d1213fdc7004c0d5b290ca077ccab4fb7b231c83cf2
              │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
              │
│  │ Owner: Immutable
              │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 1192526
              │
│  │ Digest: FGeGZ61fqQWkxFbjbQNzMPPuB9U41bPokdoCfXMqJ5aw
              │
│  └──
              │
│  ┌──
              │
│  │ ObjectID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983
              │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
              │
│  │ Owner: Shared
              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>   │
│  │ Version: 1192526
              │
│  │ Digest: AJvLFfZRarp9sCNRzRKzxumotgD4r8yLJtYcaYVykGhV
              │
│  └──
              │
│  ┌──
              │
│  │ ObjectID: 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c
              │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )
              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::mycoin::MYCOIN>           │
│  │ Version: 1192526
              │
│  │ Digest: 8rhFd5mZbaCjbf7iXZnH7dHT5442LemSHTf4yvP3sDKb
              │
│  └──
              │
│ Mutated Objects:
              │
│  ┌──
              │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb
              │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )
              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
              │
│  │ Version: 1192526
              │
│  │ Digest: 8TR3tZAXMKsgUxs47YgjZ8qGi9yGUPB23aTd69aYvmkM
              │
│  └──
              │
│ Published Objects:
              │
│  ┌──
              │
│  │ PackageID: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403
              │
│  │ Version: 1
              │
│  │ Digest: 84cSkms6B19QzCFfrMnzMqv6zJv2bs4VNv8bSkyz4dGo
              │
│  │ Modules: faucetcoin, mycoin
              │
│  └──
              │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯


```

## My Coin Mint

1. 命令

```
sui client call --function mint --module mycoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 
```

2. 返回

```
Transaction Digest: 6faauLuzxCnq2HDZR9VcuFRWa7RAz7CHRv2WowWDpFxX
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                   │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                    │
│  │ Version: 1192534                                                                                          │
│  │ Digest: 3dtHeA6LY3uCU7FPRhjP6PEVPeHxctPKe6aDx4fSNo2S                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    mycoin                                                             │                         │
│ │  │ Package:   0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    TJgB0mH8KhtgEDtoa5bEtBRJ8hUz7SzNJdU49PbLw/v1QKrCFSSn3RP5dQCfYCggEDrKGa3MLgWRgEVRC/wbBw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6faauLuzxCnq2HDZR9VcuFRWa7RAz7CHRv2WowWDpFxX                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 371                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7e1a27949f8baa9ae7601197c841130eea6848632adb206ebcebdf1695181ea9                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 1192535                                                                               │
│  │ Digest: AbSfbmDuxgotrpvZyhDL3T8FWsE52BHGEe6nRZ8JbVXA                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192535                                                                               │
│  │ Digest: 6kqfo52SJziekAqBXZ7cKSChDSAuDvDwED5eS6Ycqe8Z                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192535                                                                               │
│  │ Digest: 2rYY5gzeXZhYU2qRNz3PAtuP4dqVSmQvirF6RyCzp6eN                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192535                                                                               │
│  │ Digest: 6kqfo52SJziekAqBXZ7cKSChDSAuDvDwED5eS6Ycqe8Z                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1                                                   │
│    DDKgZyMLq25yNVRzLBbmhtv2XotW4G3fJUrLGTx1EtdT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x7e1a27949f8baa9ae7601197c841130eea6848632adb206ebcebdf1695181ea9                                            │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::mycoin::MYCOIN>         │
│  │ Version: 1192535                                                                                                        │
│  │ Digest: AbSfbmDuxgotrpvZyhDL3T8FWsE52BHGEe6nRZ8JbVXA                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                            │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 1192535                                                                                                        │
│  │ Digest: 6kqfo52SJziekAqBXZ7cKSChDSAuDvDwED5eS6Ycqe8Z                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0xd735520f429f73845c8193e724d7cb1c3631bc716b719d01dd783074ce0b8c0c                                            │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::mycoin::MYCOIN>  │
│  │ Version: 1192535                                                                                                        │
│  │ Digest: 2rYY5gzeXZhYU2qRNz3PAtuP4dqVSmQvirF6RyCzp6eN                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2380008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::mycoin::MYCOIN   │
│  │ Amount: 100                                                                                    │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `Faucet Coin` address1

1. 指令

```
sui client call --function mint --module faucetcoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args  0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983 1 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
```

2. 返回

```
Transaction Digest: EhRDVA1YeL9MZSgPxcbdJen2f16bofQKqho94JPLkUos
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                   │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                │
│ Gas Budget: 4419536 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                    │
│  │ Version: 1192529                                                                                          │
│  │ Digest: 8V4zawR8swaYSxxGyHF2WZugrkLyAcsGdTSwUMknB6XM                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucetcoin                                                         │                         │
│ │  │ Package:   0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    5o9UJyEbosKlfEQYeF9AIFhUEMHM2FD6HKbPzQ9zkTBs8qyW83VYZack1q8l8pIBhy/wyphwP054NC9M2t9ZAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EhRDVA1YeL9MZSgPxcbdJen2f16bofQKqho94JPLkUos                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 371                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x989d50a745947bb8a60d1387a7127114d52c372925baf7d97f36dc38189633b6                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 1192530                                                                               │
│  │ Digest: wySxPPjUvxB9ppKSKnvQP7AJP9TigcZhQ29B9isbp11                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192530                                                                               │
│  │ Digest: HShyo7MojXinTt5Ey55hwhnvNUkg9nwukAqybwWsKQuk                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 1192530                                                                               │
│  │ Digest: GmpE95aAeH6swnNMqjQj2bQiyE9NmCo4vS7g22rKCg6e                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Version: 1192526                                                                               │
│  │ Digest: AJvLFfZRarp9sCNRzRKzxumotgD4r8yLJtYcaYVykGhV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192530                                                                               │
│  │ Digest: HShyo7MojXinTt5Ey55hwhnvNUkg9nwukAqybwWsKQuk                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4195200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2753784 MIST                                                                   │
│    Non-refundable Storage Fee: 27816 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1                                                   │
│    GQYk6hpM94MbV2asFa1H9CaEX1122pPzTBg3H631hbGh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                     │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0x989d50a745947bb8a60d1387a7127114d52c372925baf7d97f36dc38189633b6                                                    │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                                      │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>         │
│  │ Version: 1192530                                                                                                                │
│  │ Digest: wySxPPjUvxB9ppKSKnvQP7AJP9TigcZhQ29B9isbp11                                                                             │
│  └──                                                                                                                               │
│ Mutated Objects:                                                                                                                   │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                                    │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                                      │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )                                   │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                      │
│  │ Version: 1192530                                                                                                                │
│  │ Digest: HShyo7MojXinTt5Ey55hwhnvNUkg9nwukAqybwWsKQuk                                                                            │
│  └──                                                                                                                               │
│  ┌──                                                                                                                               │
│  │ ObjectID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                                                    │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                                      │
│  │ Owner: Shared                                                                                                                   │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 1192530                                                                                                                │
│  │ Digest: GmpE95aAeH6swnNMqjQj2bQiyE9NmCo4vS7g22rKCg6e                                                                            │
│  └──                                                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2441416                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )         │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN  │
│  │ Amount: 1                                                                                             │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## `Faucet Coin` address2

1. 指令

```
sui client call --function mint --module faucetcoin --package 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 --args  0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983 1  0x8b1ef6109200de58a41453a40399684d18390d95e14ae614a351a55a1f30a562
```

2. 结果

```
Transaction Digest: 62j3ufKp5WdezkYT7o7nWGzd7DxemrsUAvsCoumfN7q2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                   │
│ Gas Owner: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4                                │
│ Gas Budget: 4419536 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                                    │
│  │ Version: 1192535                                                                                          │
│  │ Digest: 6kqfo52SJziekAqBXZ7cKSChDSAuDvDwED5eS6Ycqe8Z                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1"                                                                      │ │
│ │ 2   Pure Arg: Type: address, Value: "0x8b1ef6109200de58a41453a40399684d18390d95e14ae614a351a55a1f30a562" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucetcoin                                                         │                         │
│ │  │ Package:   0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    4a/zCBEDboHNxeLZtKklh2/Nt61DjnMK2oLcFhCQfPnViU0Mt5g2iRh/nbLysWvX0RskN7DR+josz8nhmIE2AA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 62j3ufKp5WdezkYT7o7nWGzd7DxemrsUAvsCoumfN7q2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 371                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x9381fe3de8d3cd443ff5d29db0d953037c1ef44ba02d393ca8a0bd75cade0c5f                         │
│  │ Owner: Account Address ( 0x8b1ef6109200de58a41453a40399684d18390d95e14ae614a351a55a1f30a562 )  │
│  │ Version: 1192536                                                                               │
│  │ Digest: HXABPdJSniYjoJPox98uA6TsKZ1Vx79Ka8Y8bC6fZg5G                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192536                                                                               │
│  │ Digest: 4h5hxKqfMcom3Ekn93FhAN9xWwU8tmkwTZzVY5cxL7Gu                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 1192536                                                                               │
│  │ Digest: yeXJR35XahLmLtECne64grhj9J13m8jnBmuJPJXQqrN                                            │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983                         │
│  │ Version: 1192530                                                                               │
│  │ Digest: GmpE95aAeH6swnNMqjQj2bQiyE9NmCo4vS7g22rKCg6e                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb                         │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )  │
│  │ Version: 1192536                                                                               │
│  │ Digest: 4h5hxKqfMcom3Ekn93FhAN9xWwU8tmkwTZzVY5cxL7Gu                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4195200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2753784 MIST                                                                   │
│    Non-refundable Storage Fee: 27816 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6faauLuzxCnq2HDZR9VcuFRWa7RAz7CHRv2WowWDpFxX                                                   │
│    739WxomUU7rkxfzoJFdd2huvD8jR1Td5quQ5X4gUmnY1                                                   │
│    EhRDVA1YeL9MZSgPxcbdJen2f16bofQKqho94JPLkUos                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes
             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:
             │
│  ┌──
             │
│  │ ObjectID: 0x9381fe3de8d3cd443ff5d29db0d953037c1ef44ba02d393ca8a0bd75cade0c5f
             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
             │
│  │ Owner: Account Address ( 0x8b1ef6109200de58a41453a40399684d18390d95e14ae614a351a55a1f30a562 )
             │
│  │ ObjectType: 0x2::coin::Coin<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>         │
│  │ Version: 1192536
             │
│  │ Digest: HXABPdJSniYjoJPox98uA6TsKZ1Vx79Ka8Y8bC6fZg5G
             │
│  └──
             │
│ Mutated Objects:
             │
│  ┌──
             │
│  │ ObjectID: 0xbddf927c89d3eda6136c2d34bcf1c2b1552b662601c14a63acb8bd5d08dbcdbb
             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
             │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )
             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>
             │
│  │ Version: 1192536
             │
│  │ Digest: 4h5hxKqfMcom3Ekn93FhAN9xWwU8tmkwTZzVY5cxL7Gu
             │
│  └──
             │
│  ┌──
             │
│  │ ObjectID: 0xbe2b232fb67ee76f5e9adfcdf2d3d2785d8c5a5cd0f2cf2af4ba3981fb8a4983
             │
│  │ Sender: 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4
             │
│  │ Owner: Shared
             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN>  │
│  │ Version: 1192536
             │
│  │ Digest: yeXJR35XahLmLtECne64grhj9J13m8jnBmuJPJXQqrN
             │
│  └──
             │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                          │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x118abaa1d8254a0c1e0a2a8287560701aad59b74ca33801826d4a10e0153abb4 )         │
│  │ CoinType: 0x2::sui::SUI                                                                               │
│  │ Amount: -2441416                                                                                      │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ Owner: Account Address ( 0x8b1ef6109200de58a41453a40399684d18390d95e14ae614a351a55a1f30a562 )         │
│  │ CoinType: 0x7247004b03f116499058575daac468d59ad6c4e84d0878628b785e16c39f5403::faucetcoin::FAUCETCOIN  │
│  │ Amount: 1                                                                                             │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
