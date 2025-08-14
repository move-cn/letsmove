## command

```shell
# create address.

sui client new-address ed25519 testnet

```

```shell
# switch env.

sui client switch --env testnet

```

```shell
# publish package.

sui client publish --gas-budget 10000000

```

## publish result.

```text

Transaction Digest: E69wQmqPhHcvvgEjchCPqqVuVBdfve5tJtJSfA8roV8u
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943                                   │
│ Gas Owner: 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x441c1e9b52292368a5a8ecf839133904583f24bb853ed40e8053284e163df5de                                    │
│  │ Version: 971921                                                                                           │
│  │ Digest: DLJP2rML4qYRGjdPTZ1LuNJhfTb93hMzcK4a14nA6Vh                                                       │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943" │ │
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
│    oT/j1uNFoVYX6L7uipqKj5JZfdbbNFWe2lWHasfc7fjDk3KDUIKDYUYpaO+TNPJG85Ub057JfkVgrEsl9a8eBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: E69wQmqPhHcvvgEjchCPqqVuVBdfve5tJtJSfA8roV8u                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 386                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa3a58a3eb22ceca4a7c6092345052cb0bf6c3617f8e4bf09b86386efdc8aa2fd                         │
│  │ Owner: Account Address ( 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943 )  │
│  │ Version: 971922                                                                                │
│  │ Digest: AoTu44QfZRy4Xphy8J3cHanNV32AVx58xo1CHKKmcRgJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc058ade4e367c72a2f5884fb02a7496e8db2493d72dd17a27d2d6cfd51292ed9                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: By1juyY3EthuS88yTDQPQcXdeHeiq3i4ahK1y66j5yw6                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x441c1e9b52292368a5a8ecf839133904583f24bb853ed40e8053284e163df5de                         │
│  │ Owner: Account Address ( 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943 )  │
│  │ Version: 971922                                                                                │
│  │ Digest: AngoMDtzrSiKPxiNbXLJLcUPMEemqvTXERkcXwQ6Y4Qi                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x441c1e9b52292368a5a8ecf839133904583f24bb853ed40e8053284e163df5de                         │
│  │ Owner: Account Address ( 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943 )  │
│  │ Version: 971922                                                                                │
│  │ Digest: AngoMDtzrSiKPxiNbXLJLcUPMEemqvTXERkcXwQ6Y4Qi                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7683600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6c3hAbXwoKqSv8Grf4wv7VAJYpT7UnPxV3zqeRjmN1JY                                                   │
│    9au69QfQwHHNVKsoW4QinXXmXxzSZMzJHepyoJPdsr9o                                                   │
│    HAu8Q91VQ6kVbhxadSjYmBwNo2j9xN6j185oHAvH3ACk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa3a58a3eb22ceca4a7c6092345052cb0bf6c3617f8e4bf09b86386efdc8aa2fd                  │
│  │ Sender: 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943                    │
│  │ Owner: Account Address ( 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 971922                                                                               │
│  │ Digest: AoTu44QfZRy4Xphy8J3cHanNV32AVx58xo1CHKKmcRgJ                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x441c1e9b52292368a5a8ecf839133904583f24bb853ed40e8053284e163df5de                  │
│  │ Sender: 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943                    │
│  │ Owner: Account Address ( 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 971922                                                                               │
│  │ Digest: AngoMDtzrSiKPxiNbXLJLcUPMEemqvTXERkcXwQ6Y4Qi                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xc058ade4e367c72a2f5884fb02a7496e8db2493d72dd17a27d2d6cfd51292ed9                 │
│  │ Version: 1                                                                                    │
│  │ Digest: By1juyY3EthuS88yTDQPQcXdeHeiq3i4ahK1y66j5yw6                                          │
│  │ Modules: task1                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7bda1b3d4e36590ba9116c448753eb2971bf36f60bd65bb8bffca0ddfe6cb943 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7705480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯


```