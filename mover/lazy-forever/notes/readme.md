## task1

在win上安装sui，配置环境变量，idea装插件，发布hello源码到测试网`sui client publish `

## task2

```
Transaction Digest: DgvoiZ7obDfvYrr2ZqnnDN9SBbpWKXNYUE1qeTJ5auec
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                                    │
│  │ Version: 93657031                                                                                         │
│  │ Digest: FVVZHLgUx4Bzx3rJGraAreLVjGkW9Y8bknU99ohAecRG                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
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
│    u0tLd9OvDMyRo2y64+1MPBdMsEhX6jwR+qLqGGh0hh7rEHZv/vBRtC1eWFeFFoogiCMeI55cNIyqjVD9wAvzCg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DgvoiZ7obDfvYrr2ZqnnDN9SBbpWKXNYUE1qeTJ5auec                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 372                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657032                                                                              │
│  │ Digest: dFyFWwmr3XkZ772iDZ3nwmtBtbwiHKPmga5gdxthXvB                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657032                                                                              │
│  │ Digest: Bgb2tUyeDBaM9mDsBAyCsBmcnWHT5e2TEFvNsXjrU5eL                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x1de2f3e5bd052aabde2b1b3aced2b71f295b203b92ef192b22fb251a7a54a955                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 93657032                                                                              │
│  │ Digest: 6n9y2gtHTwg6xKLk1GZTzCcox6QxoicQ2Ckc3AXiy2hd                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4a955265e27a1ef1424a830de52b6fc55870fcba840b2540fc9878bcb475a60b                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657032                                                                              │
│  │ Digest: 3eGTAWdHdutmZCDCKHm2sQu2Gtne4FQ8TtfjUWtWEyRH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x79f7d298e0e895980fa9d38fff0a5778c466a02ea7e8efe557f01aaa0c8ae8e3                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 93657032                                                                              │
│  │ Digest: 9GMZ2EbWD6ZjNvw4rN6dKss4GF15GANRhn7146n4qF6B                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: vrGePUfKAvh6RDP6vNsRaSs9xUHtZLncxT5EqB76vbH                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657032                                                                              │
│  │ Digest: BUjYuGNuaNbrh8cAEnqvbtz8F1B34eTey4AxVXaUNsfV                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657032                                                                              │
│  │ Digest: BUjYuGNuaNbrh8cAEnqvbtz8F1B34eTey4AxVXaUNsfV                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 27702000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    3zAJ6zZFTTi9ad6pPeK65Z8vkVQ4e16jmdFrZtsHV9fd                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                      │
│  ┌──                                                                                                                                                  │
│  │ ObjectID: 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2                                                                       │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET>   │
│  │ Version: 93657032                                                                                                                                  │
│  │ Digest: dFyFWwmr3XkZ772iDZ3nwmtBtbwiHKPmga5gdxthXvB                                                                                                │
│  └──                                                                                                                                                  │
│  ┌──                                                                                                                                                  │
│  │ ObjectID: 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025                                                                       │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN>       │
│  │ Version: 93657032                                                                                                                                  │
│  │ Digest: Bgb2tUyeDBaM9mDsBAyCsBmcnWHT5e2TEFvNsXjrU5eL                                                                                               │
│  └──                                                                                                                                                  │
│  ┌──                                                                                                                                                  │
│  │ ObjectID: 0x1de2f3e5bd052aabde2b1b3aced2b71f295b203b92ef192b22fb251a7a54a955                                                                       │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                         │
│  │ Owner: Immutable                                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET>  │
│  │ Version: 93657032                                                                                                                                  │
│  │ Digest: 6n9y2gtHTwg6xKLk1GZTzCcox6QxoicQ2Ckc3AXiy2hd                                                                                               │
│  └──                                                                                                                                                  │
│  ┌──                                                                                                                                                  │
│  │ ObjectID: 0x4a955265e27a1ef1424a830de52b6fc55870fcba840b2540fc9878bcb475a60b                                                                       │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                                               │
│  │ Version: 93657032                                                                                                                                  │
│  │ Digest: 3eGTAWdHdutmZCDCKHm2sQu2Gtne4FQ8TtfjUWtWEyRH                                                                                               │
│  └──                                                                                                                                                  │
│  ┌──                                                                                                                                                  │
│  │ ObjectID: 0x79f7d298e0e895980fa9d38fff0a5778c466a02ea7e8efe557f01aaa0c8ae8e3                                                                       │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                         │
│  │ Owner: Immutable                                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN>      │
│  │ Version: 93657032                                                                                                                                  │
│  │ Digest: 9GMZ2EbWD6ZjNvw4rN6dKss4GF15GANRhn7146n4qF6B                                                                                               │
│  └──                                                                                                                                                  │
│ Mutated Objects:                                                                                                                                      │
│  ┌──                                                                                                                                                  │
│  │ ObjectID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                                                                       │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                         │
│  │ Version: 93657032                                                                                                                                  │
│  │ Digest: BUjYuGNuaNbrh8cAEnqvbtz8F1B34eTey4AxVXaUNsfV                                                                                               │
│  └──                                                                                                                                                  │
│ Published Objects:                                                                                                                                    │
│  ┌──                                                                                                                                                  │
│  │ PackageID: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8                                                                      │
│  │ Version: 1                                                                                                                                         │
│  │ Digest: vrGePUfKAvh6RDP6vNsRaSs9xUHtZLncxT5EqB76vbH                                                                                                │
│  │ Modules: lazy_forever_coin, lazy_forever_faucet                                                                                                    │
│  └──                                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -27473880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```





```
sui client call --gas-budget 30000000 --package 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8 --module lazy_forever_coin --function mint --args 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025 "10000" 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc
```



```
Transaction Digest: 5zYsw1iWcMse9rExx48ok6uZwvF9YRhceiZ8CaYvL4Kz
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 30000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                                    │
│  │ Version: 93657034                                                                                         │
│  │ Digest: BNMy3UWPWdfJ9qSTRu31aab99GAxxh5JDK7ubP8X3bAX                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025              │ │
│ │ 1   Pure Arg: Type: u64, Value: "10000"                                                                  │ │
│ │ 2   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    lazy_forever_coin                                                  │                         │
│ │  │ Package:   0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    zQoTeAvlRXBAI1/JZ2SWrh5dBbkksvM1cnCMHyiOMNfBWsKMJ91xlpZE/HDK6Dw2xIuqXRo/tDNzmAxz1VZeDw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5zYsw1iWcMse9rExx48ok6uZwvF9YRhceiZ8CaYvL4Kz                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 372                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1fb6b66c8e1d925efa53c77b4ec30f116735ebf299398f87eacb5256d4ed9fc0                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657035                                                                              │
│  │ Digest: HmsNcxS15nTNhaS4a58eSgnmhEEAHVjgwzeNBKDy1YFC                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657035                                                                              │
│  │ Digest: 5QYuL1MB61rT9unySr6Bmfbdf35Sd3oGjFuBNDGh9cPG                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657035                                                                              │
│  │ Digest: HGxNXiQD3mzxDdefJADsDJXe67vGwR2Rz3wbjqvyPSer                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 93657035                                                                              │
│  │ Digest: HGxNXiQD3mzxDdefJADsDJXe67vGwR2Rz3wbjqvyPSer                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4408000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2859120 MIST                                                                   │
│    Non-refundable Storage Fee: 28880 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9NKQZtHfzp58NMrcyA8oEcMhrABkbi3CqhAoPgwZrf1h                                                   │
│    DgvoiZ7obDfvYrr2ZqnnDN9SBbpWKXNYUE1qeTJ5auec                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                 │
│  ┌──                                                                                                                                             │
│  │ ObjectID: 0x1fb6b66c8e1d925efa53c77b4ec30f116735ebf299398f87eacb5256d4ed9fc0                                                                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                 │
│  │ ObjectType: 0x2::coin::Coin<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN>         │
│  │ Version: 93657035                                                                                                                             │
│  │ Digest: HmsNcxS15nTNhaS4a58eSgnmhEEAHVjgwzeNBKDy1YFC                                                                                          │
│  └──                                                                                                                                             │
│ Mutated Objects:                                                                                                                                 │
│  ┌──                                                                                                                                             │
│  │ ObjectID: 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025                                                                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                 │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN>  │
│  │ Version: 93657035                                                                                                                             │
│  │ Digest: 5QYuL1MB61rT9unySr6Bmfbdf35Sd3oGjFuBNDGh9cPG                                                                                          │
│  └──                                                                                                                                             │
│  ┌──                                                                                                                                             │
│  │ ObjectID: 0xff82bcfe1a72077f2e2034739bb29402b63a07462f1678a26fed2985d9bb3b44                                                                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                 │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                    │
│  │ Version: 93657035                                                                                                                             │
│  │ Digest: HGxNXiQD3mzxDdefJADsDJXe67vGwR2Rz3wbjqvyPSer                                                                                          │
│  └──                                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                        │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                       │
│  │ CoinType: 0x2::sui::SUI                                                                                             │
│  │ Amount: -2298880                                                                                                    │
│  └──                                                                                                                   │
│  ┌──                                                                                                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                       │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN  │
│  │ Amount: 10000                                                                                                       │
│  └──                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## task3

sui client publish --gas-budget 200000000 --skip-dependency-verification

```
Transaction Digest: 9gnMVpge13GEbaht4CK9AcJX7BgkxpRakWsGM1H4mVwi
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                                    │
│  │ Version: 94135442                                                                                         │
│  │ Digest: 5pZYK9JfJvJeLBy4mrpFYUqkVuS33xdauN5i2WAjit9K                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
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
│    1sfIaoTt83iO0+AnMS8V/kcAjmDaKorTmUuwvb3TtRKpoik555syRDkW7ywZsINsjL2GfJKaQUwQWVAY668eCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9gnMVpge13GEbaht4CK9AcJX7BgkxpRakWsGM1H4mVwi                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 378                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xc5535a6b4507bec7e2fccba5a00b1ce173b0de0425f526a29ec26befd76c8a11                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135443                                                                              │
│  │ Digest: B6pcKXPqfFRdah6js2vyeNfAWFfVTsUSkzsNgTEeDQPU                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GtRW3NtAEL2PWDRBfCWbTFu2cWnMW8bzuiPWGoDMuQq7                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135443                                                                              │
│  │ Digest: 7nqvr1gJrxV7t9PpYMrcTbanToxbhPhByirLaAJXdqU1                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135443                                                                              │
│  │ Digest: 7nqvr1gJrxV7t9PpYMrcTbanToxbhPhByirLaAJXdqU1                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 14440000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    GbiDoEudKB2PmzVjSx4kYyMnTib4rtrDveAVsYga2LSH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xc5535a6b4507bec7e2fccba5a00b1ce173b0de0425f526a29ec26befd76c8a11                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 94135443                                                                             │
│  │ Digest: B6pcKXPqfFRdah6js2vyeNfAWFfVTsUSkzsNgTEeDQPU                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 94135443                                                                             │
│  │ Digest: 7nqvr1gJrxV7t9PpYMrcTbanToxbhPhByirLaAJXdqU1                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa                 │
│  │ Version: 1                                                                                    │
│  │ Digest: GtRW3NtAEL2PWDRBfCWbTFu2cWnMW8bzuiPWGoDMuQq7                                          │
│  │ Modules: lazy_forever_nft                                                                     │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -14211880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

sui client call --gas-budget 7500000 --package 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa --module lazy_forever_nft --function mint_nft --args 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc

```
Transaction Digest: D63g523RhSFLd3ZzjryM7ca7CbiSbP2UcGfiyJSXK6G
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 7500000 MIST                                                                                     │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                                    │
│  │ Version: 94135443                                                                                         │
│  │ Digest: 7nqvr1gJrxV7t9PpYMrcTbanToxbhPhByirLaAJXdqU1                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint_nft                                                           │                         │
│ │  │ Module:    lazy_forever_nft                                                   │                         │
│ │  │ Package:   0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    G8iuPGMeLmtjzcVCJeTLTzC28r6fycGtRYlCS6ocw8JLiBeBHLYs1mToG8G6nHQuBx6hcBeBbKO05+f5JcUKAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: D63g523RhSFLd3ZzjryM7ca7CbiSbP2UcGfiyJSXK6G                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 378                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135444                                                                              │
│  │ Digest: 5Eh7ahDKpDvDHW33P1DhZrHL9hRiarsBFJj3bJDJTFnU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135444                                                                              │
│  │ Digest: 8RnsrfuVWoJpYcupgoh6v3SzUAV28wHVzUc8LyzHNFKp                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135444                                                                              │
│  │ Digest: 8RnsrfuVWoJpYcupgoh6v3SzUAV28wHVzUc8LyzHNFKp                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2994400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    9gnMVpge13GEbaht4CK9AcJX7BgkxpRakWsGM1H4mVwi                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                    │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                        │
│  │ EventID: D63g523RhSFLd3ZzjryM7ca7CbiSbP2UcGfiyJSXK6G:0                                                                   │
│  │ PackageID: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa                                            │
│  │ Transaction Module: lazy_forever_nft                                                                                     │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                               │
│  │ EventType: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa::lazy_forever_nft::LazyforeverNftMintEvent │
│  │ ParsedJSON:                                                                                                              │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                                     │
│  │   │ creator   │ 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc │                                     │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                                     │
│  │   │ name      │ lazy_forever                                                       │                                     │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                                     │
│  │   │ object_id │ 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932 │                                     │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                                     │
│  └──                                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                     │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932                                      │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                        │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                     │
│  │ ObjectType: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa::lazy_forever_nft::LazyforeverNFT  │
│  │ Version: 94135444                                                                                                 │
│  │ Digest: 5Eh7ahDKpDvDHW33P1DhZrHL9hRiarsBFJj3bJDJTFnU                                                              │
│  └──                                                                                                                 │
│ Mutated Objects:                                                                                                     │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                                      │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                        │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                        │
│  │ Version: 94135444                                                                                                 │
│  │ Digest: 8RnsrfuVWoJpYcupgoh6v3SzUAV28wHVzUc8LyzHNFKp                                                              │
│  └──                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2766280                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

sui client call --gas-budget 7500000 --package 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa --module lazy_forever_nft --function transfer_nft --args 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc

```
Transaction Digest: 3pKFEBbtfZKekmn99QzYAcynC2fcBkFTC8HyerAuzGBH
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 7500000 MIST                                                                                     │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                                    │
│  │ Version: 94135444                                                                                         │
│  │ Digest: 8RnsrfuVWoJpYcupgoh6v3SzUAV28wHVzUc8LyzHNFKp                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer_nft                                                       │                         │
│ │  │ Module:    lazy_forever_nft                                                   │                         │
│ │  │ Package:   0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    JY5tiTrce/QYzKfejsLUjtWxQ/ZleBBXdrASg2nYXTBQJtAaG9gDz4sc3uTNoRvXgLRlce7FC5VUhJjR7kJ4CQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3pKFEBbtfZKekmn99QzYAcynC2fcBkFTC8HyerAuzGBH                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 379                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135445                                                                              │
│  │ Digest: 5ZhAU9VsTT9oSzkLYsypcMnjJQCcGHAxUaFUQiWRQmkB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135445                                                                              │
│  │ Digest: EypMEPC7XcJhxuQ3GLqJDaavRGhNXU4GxFn5mr8fSHUx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 94135445                                                                              │
│  │ Digest: 5ZhAU9VsTT9oSzkLYsypcMnjJQCcGHAxUaFUQiWRQmkB                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2994400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2964456 MIST                                                                   │
│    Non-refundable Storage Fee: 29944 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    D63g523RhSFLd3ZzjryM7ca7CbiSbP2UcGfiyJSXK6G                                                    │
│    9gnMVpge13GEbaht4CK9AcJX7BgkxpRakWsGM1H4mVwi                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                        │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                            │
│  │ EventID: 3pKFEBbtfZKekmn99QzYAcynC2fcBkFTC8HyerAuzGBH:0                                                                      │
│  │ PackageID: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa                                                │
│  │ Transaction Module: lazy_forever_nft                                                                                         │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                   │
│  │ EventType: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa::lazy_forever_nft::LazyforeverNftTransferEvent │
│  │ ParsedJSON:                                                                                                                  │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                                         │
│  │   │ from      │ 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc │                                         │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                                         │
│  │   │ object_id │ 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932 │                                         │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                                         │
│  │   │ to        │ 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc │                                         │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                                         │
│  └──                                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                     │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0xa6b334af6d4c507e74b01478eee51be4de4a705191fc8aeca77782affc510138                                      │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                        │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                        │
│  │ Version: 94135445                                                                                                 │
│  │ Digest: 5ZhAU9VsTT9oSzkLYsypcMnjJQCcGHAxUaFUQiWRQmkB                                                              │
│  └──                                                                                                                 │
│  ┌──                                                                                                                 │
│  │ ObjectID: 0xb4d458ba82c2f63b302f9217f717734cc64cbc3ebae402bbc6484721cffbf932                                      │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                        │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                     │
│  │ ObjectType: 0xed87fadfcd5dc87c1e9804d715f363f4394dcc306cea2c20dd5ae13d4eea9eaa::lazy_forever_nft::LazyforeverNFT  │
│  │ Version: 94135445                                                                                                 │
│  │ Digest: EypMEPC7XcJhxuQ3GLqJDaavRGhNXU4GxFn5mr8fSHUx                                                              │
│  └──                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -779944                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## task4

sui client publish --gas-budget 300000000

```
Transaction Digest: 8HyXQfHGQDewsZJTBDEXkS3X8i14vCoh2gTiMrcs3jrs
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 300000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                                    │
│  │ Version: 98123396                                                                                         │
│  │ Digest: 2kzYXiGrCjkPA5uvKPi19m3aqHyUMPBAs9A1dzESnUUN                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8 │                                  │
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
│    J0q4mLexADnF84E1wmIX4CNEBIBqw6zK0Z7ascIier1ox74q2sLMM14MawkFCEHrkJxNPu072rEdNB3RkpSqCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8HyXQfHGQDewsZJTBDEXkS3X8i14vCoh2gTiMrcs3jrs                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 387                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x76ac9f9e72a24687854316056fbe97bf790f5d5727e7e8fe94a36bdd4dcd84c8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 1oYYBuDwhyPoYyka33XL3FGj2Ahjz4Pd4aL5ACet7Eu                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xcf70bee55c5fd9d0e4892aef1295348f54245f0235048fd84c71928702f7be12                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 98123397                                                                              │
│  │ Digest: 9zNP1aiUAD9hFnVsSKrRm3LELsrmbTRiwKE5kFWNdShm                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 98123397                                                                              │
│  │ Digest: Bn8ryEPpoKT6cFpAS9BGiCpsyUZGQcWY9bLretAfZxAR                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 98123397                                                                              │
│  │ Digest: Bn8ryEPpoKT6cFpAS9BGiCpsyUZGQcWY9bLretAfZxAR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13315200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4dXaEgoJmc8PehBQ1ZAwQyG22jet4QS5HfcfCXVQd55m                                                   │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    DgvoiZ7obDfvYrr2ZqnnDN9SBbpWKXNYUE1qeTJ5auec                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xcf70bee55c5fd9d0e4892aef1295348f54245f0235048fd84c71928702f7be12                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 98123397                                                                             │
│  │ Digest: 9zNP1aiUAD9hFnVsSKrRm3LELsrmbTRiwKE5kFWNdShm                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                    │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 98123397                                                                             │
│  │ Digest: Bn8ryEPpoKT6cFpAS9BGiCpsyUZGQcWY9bLretAfZxAR                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x76ac9f9e72a24687854316056fbe97bf790f5d5727e7e8fe94a36bdd4dcd84c8                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 1oYYBuDwhyPoYyka33XL3FGj2Ahjz4Pd4aL5ACet7Eu                                           │
│  │ Modules: lazy_forever_game                                                                    │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -13087080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

sui client call --gas-budget 7500000 --package 0x76ac9f9e72a24687854316056fbe97bf790f5d5727e7e8fe94a36bdd4dcd84c8  --module lazy_forever_game --function play --args 1 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2 0x6

```
Transaction Digest: DKBBG21V7asSvPxWLUjerRhWkDSB4KFYMkSnYWu5QXeu
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 7500000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                       │
│  │ Version: 98123399                                                                            │
│  │ Digest: JDfd5zjZB9k2SNfuXYu1xdfCAztZjJSH4pveWEZdKMi7                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: u8, Value: 1                                                            │ │
│ │ 1   Imm/Owned Object ID: 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2 │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000006 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  play                                                               │            │
│ │  │ Module:    lazy_forever_game                                                  │            │
│ │  │ Package:   0x76ac9f9e72a24687854316056fbe97bf790f5d5727e7e8fe94a36bdd4dcd84c8 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    lnRF7/ZwnVo8l4a5v+H/Qfuz8Lwym0MMmoLTH4cmS6KjWat7VUtcxBetqUMIVcXcXPKKC8ISeC3zxAF+FJHcCA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DKBBG21V7asSvPxWLUjerRhWkDSB4KFYMkSnYWu5QXeu                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 387                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 98123400                                                                              │
│  │ Digest: 77TqeA3awBXRg51kcx82vwesT5dw7vcuvqcvZmuGjJtv                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 98123400                                                                              │
│  │ Digest: AgK4D9o5KC6Btp3NHnYejahPHoqRiSepsoxjuEFWSpUZ                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000006                         │
│  │ Version: 33097235                                                                              │
│  │ Digest: EtVmTAVZWvUHybcbymJ11Lz4fSvndMNQE9F2yhFPqwKv                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 98123400                                                                              │
│  │ Digest: AgK4D9o5KC6Btp3NHnYejahPHoqRiSepsoxjuEFWSpUZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2918400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2889216 MIST                                                                   │
│    Non-refundable Storage Fee: 29184 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    TQLbDzusDx8aZ7EXYh9GR7trV5LpNA1UMiHXwKBbJMP                                                    │
│    84sgVHh4CY8CsbiCxkhe8vT4AmSf8FsUXWSdXZAF5oZj                                                   │
│    8HyXQfHGQDewsZJTBDEXkS3X8i14vCoh2gTiMrcs3jrs                                                   │
│    DgvoiZ7obDfvYrr2ZqnnDN9SBbpWKXNYUE1qeTJ5auec                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                               │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                   │
│  │ EventID: DKBBG21V7asSvPxWLUjerRhWkDSB4KFYMkSnYWu5QXeu:0                                                             │
│  │ PackageID: 0x76ac9f9e72a24687854316056fbe97bf790f5d5727e7e8fe94a36bdd4dcd84c8                                       │
│  │ Transaction Module: lazy_forever_game                                                                               │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                          │
│  │ EventType: 0x76ac9f9e72a24687854316056fbe97bf790f5d5727e7e8fe94a36bdd4dcd84c8::lazy_forever_game::GamingResultEvent │
│  │ ParsedJSON:                                                                                                         │
│  │   ┌─────────────────┬───────┐                                                                                       │
│  │   │ computer_choice │ rock  │                                                                                       │
│  │   ├─────────────────┼───────┤                                                                                       │
│  │   │ is_win          │ false │                                                                                       │
│  │   ├─────────────────┼───────┤                                                                                       │
│  │   │ result          │ Lose  │                                                                                       │
│  │   ├─────────────────┼───────┤                                                                                       │
│  │   │ your_choice     │ paper │                                                                                       │
│  │   └─────────────────┴───────┘                                                                                       │
│  └──                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                                                     │
│  ┌──                                                                                                                                                 │
│  │ ObjectID: 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2                                                                      │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                        │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET>  │
│  │ Version: 98123400                                                                                                                                 │
│  │ Digest: 77TqeA3awBXRg51kcx82vwesT5dw7vcuvqcvZmuGjJtv                                                                                              │
│  └──                                                                                                                                                 │
│  ┌──                                                                                                                                                 │
│  │ ObjectID: 0x7e08e3a7dd0cab7fcd107ffc122d9c59bac600826245f973e9def75c5d11ce11                                                                      │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                        │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                        │
│  │ Version: 98123400                                                                                                                                 │
│  │ Digest: AgK4D9o5KC6Btp3NHnYejahPHoqRiSepsoxjuEFWSpUZ                                                                                              │
│  └──                                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -779184                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## task5

sui client publish --gas-budget 200000000 --skip-dependency-verification

```
Transaction Digest: CNn3BHPneF8MqXXEh8Jk4EXNTqNc27sAcqPtP96jYDQV
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 752 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                                    │
│  │ Version: 246326023                                                                                        │
│  │ Digest: 38hRtufjiqGUvsw1KzWfMekWVCnRKw2hY34jKWx8zc9o                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  │   0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8 │                                  │
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
│    z/mIcNay/D9ytdCGLAerJ8hxoY7tjIv3TiL8vLiUeLnWfiTagHYAX0rLda8iiOMeKyFAyPkLYw0IH6t/mm2hDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CNn3BHPneF8MqXXEh8Jk4EXNTqNc27sAcqPtP96jYDQV                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 445                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x276ae8d24ddb8c9014dbe95dc3c191248f4d5e054e47d9e24ba9a948c0b79c23                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326024                                                                             │
│  │ Digest: Bfw6DryiqkVVy8V1EBG8wRevuakh3DW3NKg9Jga8Zye                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7ESNLhMT9zaFZUKibKP15C5FgJPmyX2VrK8hLqEmEZ61                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x538dda72d336a1014af92b9b5ed371ac5eb307a4e50e3948020fc766943f1715                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326024                                                                             │
│  │ Digest: 8ZwRrorYxffoKLcHLpiF5vF3cYQBtXFsoNaqL26Jq3Rz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Owner: Shared( 246326024 )                                                                     │
│  │ Version: 246326024                                                                             │
│  │ Digest: BA9oSoTfVbqxxmtNxvAncrB4Nj2gRrNCmTnW1SwA4bHu                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326024                                                                             │
│  │ Digest: 89Tgjy72bkZcUaU4jMajs3tmUsrn7zYKA5D1NbJMkKSA                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326024                                                                             │
│  │ Digest: 89Tgjy72bkZcUaU4jMajs3tmUsrn7zYKA5D1NbJMkKSA                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 17259600 MIST                                                                    │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AEHnWRWySoT5jA3JbkEdhqFxSKza8i6sPFB3Ysko1iDr                                                   │
│    DgvoiZ7obDfvYrr2ZqnnDN9SBbpWKXNYUE1qeTJ5auec                                                   │
│    EY8ZaDkjhyBXX8iu9HXPQWznBp4QUcpAaTuwXSheDVuq                                                   │
│    FZQQfVC428RKpDcuobUQVp45DMM4PwiELT4YH4ivaHZA                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                  │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x276ae8d24ddb8c9014dbe95dc3c191248f4d5e054e47d9e24ba9a948c0b79c23                                 │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                         │
│  │ Version: 246326024                                                                                           │
│  │ Digest: Bfw6DryiqkVVy8V1EBG8wRevuakh3DW3NKg9Jga8Zye                                                          │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x538dda72d336a1014af92b9b5ed371ac5eb307a4e50e3948020fc766943f1715                                 │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                │
│  │ ObjectType: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de::lazy_forever_swap::AdminCap  │
│  │ Version: 246326024                                                                                           │
│  │ Digest: 8ZwRrorYxffoKLcHLpiF5vF3cYQBtXFsoNaqL26Jq3Rz                                                         │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                                 │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│  │ Owner: Shared( 246326024 )                                                                                   │
│  │ ObjectType: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de::lazy_forever_swap::Bank      │
│  │ Version: 246326024                                                                                           │
│  │ Digest: BA9oSoTfVbqxxmtNxvAncrB4Nj2gRrNCmTnW1SwA4bHu                                                         │
│  └──                                                                                                            │
│ Mutated Objects:                                                                                                │
│  ┌──                                                                                                            │
│  │ ObjectID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                                 │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                   │
│  │ Version: 246326024                                                                                           │
│  │ Digest: 89Tgjy72bkZcUaU4jMajs3tmUsrn7zYKA5D1NbJMkKSA                                                         │
│  └──                                                                                                            │
│ Published Objects:                                                                                              │
│  ┌──                                                                                                            │
│  │ PackageID: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de                                │
│  │ Version: 1                                                                                                   │
│  │ Digest: 7ESNLhMT9zaFZUKibKP15C5FgJPmyX2VrK8hLqEmEZ61                                                         │
│  │ Modules: lazy_forever_swap                                                                                   │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -17033480                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function deposit_coin_a --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0x1216014cb95e94def546584c00f5688fa03587a9461f852ac3437da2ded02654



sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function deposit_coin_b --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0x43bede79ac68adcd30f58eaa5afc23c9def94c20ada3d7c297068a08f98b2c41



sui client call --gas-budget 30000000 --package 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8 --module lazy_forever_coin --function mint --args 0x1bcbe722887fa45f7ac69121af5e7d9d0d39855e6e9b17ccf03d9bbd80f4f025 "1000000" 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc



sui client call --gas-budget 30000000 --package 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8 --module lazy_forever_faucet --function mint --args 0x1ae7381e7dad739aad5b4cc58eab815dfb3bae5eaa76ac15fd0bb3af03546ba2 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc

注入资金池

```
sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function deposit_coin_a --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0x1216014cb95e94def546584c00f5688fa03587a9461f852ac3437da2ded02654
Transaction Digest: 5xeQGJ6b6aScGwe4PKUVQ6Mv1seNdWK9v73mYxgfmCnc
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 30000000 MIST                                                                       │
│ Gas Price: 752 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                       │
│  │ Version: 246326027                                                                           │
│  │ Digest: AdQDEzhSUUNsa82HRTMoKRLMGoFRn6SFkqP8mRdSbMtC                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 │ │
│ │ 1   Imm/Owned Object ID: 0x1216014cb95e94def546584c00f5688fa03587a9461f852ac3437da2ded02654 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit_coin_a                                                     │            │
│ │  │ Module:    lazy_forever_swap                                                  │            │
│ │  │ Package:   0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    npxtDmAnfve6rIvTRvQa307mdFhVtXcxLFqgMsgsHNsoJEnaKgDXSjWild31yzhHuGLqYd4WBYNXwdqDymgBBA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5xeQGJ6b6aScGwe4PKUVQ6Mv1seNdWK9v73mYxgfmCnc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 445                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326028                                                                             │
│  │ Digest: 2mQuGfDEtBfP48TyPrj2vxYhJHAc2swFXEKYt7ouaFDT                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Owner: Shared( 246326024 )                                                                     │
│  │ Version: 246326028                                                                             │
│  │ Digest: MoFrbjdsHBoZvGKFqfWS4pX9dr6ZZhrMG4ig5VkjSk4                                            │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Version: 246326026                                                                             │
│  │ Digest: GHTtgdxXVEj9zDRPQG6T15jbXwFr8awefmimHnihVHKV                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1216014cb95e94def546584c00f5688fa03587a9461f852ac3437da2ded02654                         │
│  │ Version: 246326028                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326028                                                                             │
│  │ Digest: 2mQuGfDEtBfP48TyPrj2vxYhJHAc2swFXEKYt7ouaFDT                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2462400 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 3942576 MIST                                                                   │
│    Non-refundable Storage Fee: 39824 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AdqBKZKGUpAp9eucmSXdW8KN7cypwKqz1MLGNNi9zHiz                                                   │
│    CNn3BHPneF8MqXXEh8Jk4EXNTqNc27sAcqPtP96jYDQV                                                   │
│    EhmjwirHs5sgCRbkmL3WDHFHXk1Azy3ouKB3CjaXCXy3                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                            │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                             │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                               │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                               │
│  │ Version: 246326028                                                                                       │
│  │ Digest: 2mQuGfDEtBfP48TyPrj2vxYhJHAc2swFXEKYt7ouaFDT                                                     │
│  └──                                                                                                        │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                             │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                               │
│  │ Owner: Shared( 246326024 )                                                                               │
│  │ ObjectType: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de::lazy_forever_swap::Bank  │
│  │ Version: 246326028                                                                                       │
│  │ Digest: MoFrbjdsHBoZvGKFqfWS4pX9dr6ZZhrMG4ig5VkjSk4                                                      │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                        │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                       │
│  │ CoinType: 0x2::sui::SUI                                                                                             │
│  │ Amount: 728176                                                                                                      │
│  └──                                                                                                                   │
│  ┌──                                                                                                                   │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                       │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN  │
│  │ Amount: -1000000                                                                                                    │
│  └──                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

```
sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function deposit_coin_b --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0x43bede79ac68adcd30f58eaa5afc23c9def94c20ada3d7c297068a08f98b2c41
Transaction Digest: GL4Zmxb5FwMeY7qduBZbPA6oU95evCudbhfd1fYzmnhz
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 30000000 MIST                                                                       │
│ Gas Price: 752 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                       │
│  │ Version: 246326029                                                                           │
│  │ Digest: 6vsL9kzwcEechaZKaoFuGWvQhq8oLPfx46ja7rpv8UEN                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 │ │
│ │ 1   Imm/Owned Object ID: 0x43bede79ac68adcd30f58eaa5afc23c9def94c20ada3d7c297068a08f98b2c41 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  deposit_coin_b                                                     │            │
│ │  │ Module:    lazy_forever_swap                                                  │            │
│ │  │ Package:   0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    +1X7sCL+Dgd82zpcgNRPipkEy4KTUU/KfZ23iqq+oUQGbAWkXZ98WNQ6sFZwxAcwEVZNHRLwROZ7YY6EBvQIDw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GL4Zmxb5FwMeY7qduBZbPA6oU95evCudbhfd1fYzmnhz                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 445                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326030                                                                             │
│  │ Digest: 898UwTXB9MskrA23KW9CF3T2BtxA4j7G5gh96AsGdemY                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Owner: Shared( 246326024 )                                                                     │
│  │ Version: 246326030                                                                             │
│  │ Digest: J7MTqoWvsuaCMUgEy9HcaumCTnBm9BxzBrZ5eZ9MPVh2                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Version: 246326028                                                                             │
│  │ Digest: MoFrbjdsHBoZvGKFqfWS4pX9dr6ZZhrMG4ig5VkjSk4                                            │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x43bede79ac68adcd30f58eaa5afc23c9def94c20ada3d7c297068a08f98b2c41                         │
│  │ Version: 246326030                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326030                                                                             │
│  │ Digest: 898UwTXB9MskrA23KW9CF3T2BtxA4j7G5gh96AsGdemY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2462400 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 3972672 MIST                                                                   │
│    Non-refundable Storage Fee: 40128 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2pS8U9PPou65xvQqFRndS5LhQkUzSo77UaB2S1xxghNP                                                   │
│    5xeQGJ6b6aScGwe4PKUVQ6Mv1seNdWK9v73mYxgfmCnc                                                   │
│    CNn3BHPneF8MqXXEh8Jk4EXNTqNc27sAcqPtP96jYDQV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                              │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                            │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                             │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                               │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )            │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                               │
│  │ Version: 246326030                                                                                       │
│  │ Digest: 898UwTXB9MskrA23KW9CF3T2BtxA4j7G5gh96AsGdemY                                                     │
│  └──                                                                                                        │
│  ┌──                                                                                                        │
│  │ ObjectID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                             │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                               │
│  │ Owner: Shared( 246326024 )                                                                               │
│  │ ObjectType: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de::lazy_forever_swap::Bank  │
│  │ Version: 246326030                                                                                       │
│  │ Digest: J7MTqoWvsuaCMUgEy9HcaumCTnBm9BxzBrZ5eZ9MPVh2                                                     │
│  └──                                                                                                        │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0x2::sui::SUI                                                                                                 │
│  │ Amount: 758272                                                                                                          │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET  │
│  │ Amount: -1000000                                                                                                        │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

A->B

sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function a_swap_b --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0x2626e1f94efff2917a6db587e4987640fdb877955d6a9c259a53de24381268d4

```
sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function a_swap_b --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0x2626e1f94efff2917a6db587e4987640fdb877955d6a9c259a53de24381268d4
Transaction Digest: J6NDT2fMvFazDCdYTpziks4zZyYp6E5pTQ73LHqMpt8a
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 30000000 MIST                                                                       │
│ Gas Price: 752 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                       │
│  │ Version: 246326032                                                                           │
│  │ Digest: EH1n5Dm1rpxeSmj7VhHgt7v6AzENa3yrcEfaBWLGCV94                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 │ │
│ │ 1   Imm/Owned Object ID: 0x2626e1f94efff2917a6db587e4987640fdb877955d6a9c259a53de24381268d4 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  a_swap_b                                                           │            │
│ │  │ Module:    lazy_forever_swap                                                  │            │
│ │  │ Package:   0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    L7jO6VS3b6ZmvPqbjM8wLY7vcp4oQcj8spJL3/j0a34sTUEyAanzkdOjf/ukYEdWcflsSMb6dgx3bV0DoquTAQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: J6NDT2fMvFazDCdYTpziks4zZyYp6E5pTQ73LHqMpt8a                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 445                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa9ff18a9a34ac2287f2978f4e41ee72751769ab98dc95cc51a9900750e6e355                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326033                                                                             │
│  │ Digest: GoJX8TTnvwWLub94S4RTnnYJaaBgLRbyFSQxPiFFq1iv                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326033                                                                             │
│  │ Digest: HUiSsfVUXFY4Zvv3Y1ExSVRPNHYGUMzWthojBP3TvX97                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Owner: Shared( 246326024 )                                                                     │
│  │ Version: 246326033                                                                             │
│  │ Digest: 4Ppd4NMsWQFNUGMSvrLEfzYDjn6eB8Wb8tFKu58cxFPX                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Version: 246326030                                                                             │
│  │ Digest: J7MTqoWvsuaCMUgEy9HcaumCTnBm9BxzBrZ5eZ9MPVh2                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2626e1f94efff2917a6db587e4987640fdb877955d6a9c259a53de24381268d4                         │
│  │ Version: 246326033                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326033                                                                             │
│  │ Digest: HUiSsfVUXFY4Zvv3Y1ExSVRPNHYGUMzWthojBP3TvX97                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4012800 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 3942576 MIST                                                                   │
│    Non-refundable Storage Fee: 39824 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4JMLA84wkBVMHKSXG2rFvovXnEEkiLkffNSJDXs4EDWV                                                   │
│    CNn3BHPneF8MqXXEh8Jk4EXNTqNc27sAcqPtP96jYDQV                                                   │
│    GL4Zmxb5FwMeY7qduBZbPA6oU95evCudbhfd1fYzmnhz                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                              │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0xaa9ff18a9a34ac2287f2978f4e41ee72751769ab98dc95cc51a9900750e6e355                                                               │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                 │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                              │
│  │ ObjectType: 0x2::coin::Coin<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET>  │
│  │ Version: 246326033                                                                                                                         │
│  │ Digest: GoJX8TTnvwWLub94S4RTnnYJaaBgLRbyFSQxPiFFq1iv                                                                                       │
│  └──                                                                                                                                          │
│ Mutated Objects:                                                                                                                              │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                                                               │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                 │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                 │
│  │ Version: 246326033                                                                                                                         │
│  │ Digest: HUiSsfVUXFY4Zvv3Y1ExSVRPNHYGUMzWthojBP3TvX97                                                                                       │
│  └──                                                                                                                                          │
│  ┌──                                                                                                                                          │
│  │ ObjectID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                                                               │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                                 │
│  │ Owner: Shared( 246326024 )                                                                                                                 │
│  │ ObjectType: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de::lazy_forever_swap::Bank                                    │
│  │ Version: 246326033                                                                                                                         │
│  │ Digest: 4Ppd4NMsWQFNUGMSvrLEfzYDjn6eB8Wb8tFKu58cxFPX                                                                                       │
│  └──                                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0x2::sui::SUI                                                                                                 │
│  │ Amount: -822224                                                                                                         │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN      │
│  │ Amount: -10000                                                                                                          │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET  │
│  │ Amount: 20000                                                                                                           │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

B->A

sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function b_swap_a --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0xaa9ff18a9a34ac2287f2978f4e41ee72751769ab98dc95cc51a9900750e6e355

```
sui client call --gas-budget 30000000 --package 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de --module lazy_forever_swap --function b_swap_a --args 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 0xaa9ff18a9a34ac2287f2978f4e41ee72751769ab98dc95cc51a9900750e6e355
Transaction Digest: 4NJ7qL7NxSAfXD665cwppw4EMRWVYGLCbi4NQPxwwExg
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 30000000 MIST                                                                       │
│ Gas Price: 752 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                       │
│  │ Version: 246326033                                                                           │
│  │ Digest: HUiSsfVUXFY4Zvv3Y1ExSVRPNHYGUMzWthojBP3TvX97                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Shared Object    ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959 │ │
│ │ 1   Imm/Owned Object ID: 0xaa9ff18a9a34ac2287f2978f4e41ee72751769ab98dc95cc51a9900750e6e355 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  b_swap_a                                                           │            │
│ │  │ Module:    lazy_forever_swap                                                  │            │
│ │  │ Package:   0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    dz6/1XrzX+p4gizlkRJfRzb49YvxXtlKPxZcis18UGMFL0Izu6ohkf7qDKegkgFw1c2q1V9g+YnR02Ca801uDw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4NJ7qL7NxSAfXD665cwppw4EMRWVYGLCbi4NQPxwwExg                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 445                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x859d1e3f5c1f1a2ada2a0a4ddeeee92b884284c9c7f354c14239d6757e6063a8                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326034                                                                             │
│  │ Digest: ERiXy6HE9CXPJgCWXdhJNSJtwXveLGAPAwrepb6xguSo                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326034                                                                             │
│  │ Digest: DCwu2wUxz9qEzjNJAVMQW4oMUyTew3hKEf2JP78s5t3M                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Owner: Shared( 246326024 )                                                                     │
│  │ Version: 246326034                                                                             │
│  │ Digest: Ar1Q3YPwyPgZYYsqMsV3VDw3pPeBQmv1iAkDgb8MsqwN                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                         │
│  │ Version: 246326033                                                                             │
│  │ Digest: 4Ppd4NMsWQFNUGMSvrLEfzYDjn6eB8Wb8tFKu58cxFPX                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xaa9ff18a9a34ac2287f2978f4e41ee72751769ab98dc95cc51a9900750e6e355                         │
│  │ Version: 246326034                                                                             │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 246326034                                                                             │
│  │ Digest: DCwu2wUxz9qEzjNJAVMQW4oMUyTew3hKEf2JP78s5t3M                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3982400 MIST                                                                     │
│    Computation Cost: 752000 MIST                                                                  │
│    Storage Rebate: 3972672 MIST                                                                   │
│    Non-refundable Storage Fee: 40128 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CNn3BHPneF8MqXXEh8Jk4EXNTqNc27sAcqPtP96jYDQV                                                   │
│    J6NDT2fMvFazDCdYTpziks4zZyYp6E5pTQ73LHqMpt8a                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                            │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                          │
│  ┌──                                                                                                                                      │
│  │ ObjectID: 0x859d1e3f5c1f1a2ada2a0a4ddeeee92b884284c9c7f354c14239d6757e6063a8                                                           │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                             │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                          │
│  │ ObjectType: 0x2::coin::Coin<0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN>  │
│  │ Version: 246326034                                                                                                                     │
│  │ Digest: ERiXy6HE9CXPJgCWXdhJNSJtwXveLGAPAwrepb6xguSo                                                                                   │
│  └──                                                                                                                                      │
│ Mutated Objects:                                                                                                                          │
│  ┌──                                                                                                                                      │
│  │ ObjectID: 0x03694e1c269708f5d0c98d122e382be6b153398e93bf78a40d2157d19e5eddf3                                                           │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                             │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                                          │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                             │
│  │ Version: 246326034                                                                                                                     │
│  │ Digest: DCwu2wUxz9qEzjNJAVMQW4oMUyTew3hKEf2JP78s5t3M                                                                                   │
│  └──                                                                                                                                      │
│  ┌──                                                                                                                                      │
│  │ ObjectID: 0x539ce28d980d839a6c49662febc1152d21840ef57f1b1458cf9c6513fff39959                                                           │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                                                             │
│  │ Owner: Shared( 246326024 )                                                                                                             │
│  │ ObjectType: 0x4623775b932a4bbd5b3c6b93ab61ddc492c0ed19c81e9d6da59c4815aa7981de::lazy_forever_swap::Bank                                │
│  │ Version: 246326034                                                                                                                     │
│  │ Digest: Ar1Q3YPwyPgZYYsqMsV3VDw3pPeBQmv1iAkDgb8MsqwN                                                                                   │
│  └──                                                                                                                                      │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0x2::sui::SUI                                                                                                 │
│  │ Amount: -761728                                                                                                         │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_coin::LAZY_FOREVER_COIN      │
│  │ Amount: 10000                                                                                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )                           │
│  │ CoinType: 0xe61bb7d2e294a1a69489bca5041ce85928d18060cfb4e425a3cd77514ae331b8::lazy_forever_faucet::LAZY_FOREVER_FAUCET  │
│  │ Amount: -20000                                                                                                          │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```



## task7

sui client call --function get_flag --package 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd --module check_in --args [60,51,80,86,108,126,70,98,104,108,96,120,71,53,57,90,75,87,57,112,113,114,99,89,66] 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 0x8  

```
Transaction Digest: GmM1YcJM4SMzPYf9oQ5CBUXqt6j3LZ4nD6RdGUjH69za
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 100000000 MIST                                                                      │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x18cbb8c8d6fc33e23e4e3e566bc8a6816730ca408c0f7abf6eedbe77b554c783                       │
│  │ Version: 48002550                                                                            │
│  │ Digest: QJHs5BBNdYJxRcKbn4JRxxbCDMQjsncxsNqbCSuzSDV                                          │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "<3PVl~Fbhl`xG59ZKW9pqrcYB"                          │ │
│ │ 1   Shared Object    ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56 │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  get_flag                                                           │            │
│ │  │ Module:    check_in                                                           │            │
│ │  │ Package:   0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    8qD+yF80V2i1l5o/kGzm7L5i0hrA7wG2+H7wrsJqKAD1ZrtrWC7rmJpjc0rf+9P9v5xe/wCf5u5qQMe/6y6yBA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GmM1YcJM4SMzPYf9oQ5CBUXqt6j3LZ4nD6RdGUjH69za                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 395                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 48002551                                                                              │
│  │ Digest: 7mcJQDjrVhuejcj2DdSRvT5oqjpRMSsZTsvC8cMTqC9V                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x18cbb8c8d6fc33e23e4e3e566bc8a6816730ca408c0f7abf6eedbe77b554c783                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 48002551                                                                              │
│  │ Digest: 8dvWAAAZrc89aLoGTmbArkgDTPfnLWezSQ9E53pPKG58                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                         │
│  │ Version: 48002550                                                                              │
│  │ Digest: sdVBJwdaz8Vybi9Aisv43Dwcqx6tJYGzRyNfDXKYJMT                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008                         │
│  │ Version: 45250457                                                                              │
│  │ Digest: DWHzL3YDbaLFLDLToN6XpfxdadxyBbyPjKGgrgA44eii                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x18cbb8c8d6fc33e23e4e3e566bc8a6816730ca408c0f7abf6eedbe77b554c783                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 48002551                                                                              │
│  │ Digest: 8dvWAAAZrc89aLoGTmbArkgDTPfnLWezSQ9E53pPKG58                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2614400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2550636 MIST                                                                   │
│    Non-refundable Storage Fee: 25764 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    AcaeDygFgzoGTA7akwt39Au7K6snf1Kn73ePk78VUCsu                                                   │
│    FG1SewBDoUfeYKgmYxKw5rX3oHvuqAQBKXg7JBWWcAWQ                                                   │
│    GvtDcAEMFwzCSEPUqkaPGxD4CpKyD7DDfhLrnU8KuMBR                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                             │
│  │ EventID: GmM1YcJM4SMzPYf9oQ5CBUXqt6j3LZ4nD6RdGUjH69za:0                                       │
│  │ PackageID: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd                 │
│  │ Transaction Module: check_in                                                                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                    │
│  │ EventType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::Flag │
│  │ ParsedJSON:                                                                                   │
│  │   ┌────────┬────────────────────────────────────────────────────────────────────┐             │
│  │   │ flag   │ true                                                               │             │
│  │   ├────────┼────────────────────────────────────────────────────────────────────┤             │
│  │   │ sender │ 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc │             │
│  │   └────────┴────────────────────────────────────────────────────────────────────┘             │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x10f3302f86607d758ab4e8519314aa368d2e53b3661e530fbc3e8a6988f82b56                          │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                            │
│  │ Owner: Shared                                                                                         │
│  │ ObjectType: 0x5f67669cbad74f7eccdb9ff9310e540fbe09cae5c81281e962cb65ac5094aadd::check_in::FlagString  │
│  │ Version: 48002551                                                                                     │
│  │ Digest: 7mcJQDjrVhuejcj2DdSRvT5oqjpRMSsZTsvC8cMTqC9V                                                  │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x18cbb8c8d6fc33e23e4e3e566bc8a6816730ca408c0f7abf6eedbe77b554c783                          │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                            │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 48002551                                                                                     │
│  │ Digest: 8dvWAAAZrc89aLoGTmbArkgDTPfnLWezSQ9E53pPKG58                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1063764                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## task8

sui client call --function get_flag --package 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf --module lets_move --args 0zfOD 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff 0x8 

```
Transaction Digest: 3Fdtr3gQiFxnjwrkgAPP7FiyWLsc3YFkASJA2vKYhDq2
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                      │
│ Gas Owner: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                   │
│ Gas Budget: 100000000 MIST                                                                      │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x0f2532cff96fb731c282a62f1315d2246a0a9210ec4acb02653f2ac8a3c74a39                       │
│  │ Version: 48026606                                                                            │
│  │ Digest: 8niY85Zxw5Va3WKiY8Za8iswDw4Nw3qiMKDVYqsPdUhQ                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "0zfOD"                                              │ │
│ │ 1   Shared Object    ID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff │ │
│ │ 2   Shared Object    ID: 0x0000000000000000000000000000000000000000000000000000000000000008 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  get_flag                                                           │            │
│ │  │ Module:    lets_move                                                          │            │
│ │  │ Package:   0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    yIflne6KuyTM5wzIPnHjPqlX5Ir6tv8aufZoGqTZwlwDknkiVWurUiPaoJCG9jmrUEnuNBxcOv4loF7FrPuBAA==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3Fdtr3gQiFxnjwrkgAPP7FiyWLsc3YFkASJA2vKYhDq2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 395                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0f2532cff96fb731c282a62f1315d2246a0a9210ec4acb02653f2ac8a3c74a39                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 48026612                                                                              │
│  │ Digest: CdnsVep2RQ73WtouyLTM7kuECbxGmjDCdn64n39eoB3z                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 48026612                                                                              │
│  │ Digest: CtFnXkmQmEtQxsdL9h1NijVjYWUYEaewcy8tHu2Eo92h                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff                         │
│  │ Version: 48026611                                                                              │
│  │ Digest: Ho2XCrCaqhZvYkt9PiHVWpq9KTphiQnV7vFPdSnaGfr1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x0000000000000000000000000000000000000000000000000000000000000008                         │
│  │ Version: 45404444                                                                              │
│  │ Digest: 6T3qwiJrEwcUVopAFmDcXEArJhfwsSCqV3GWUumXZe1F                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0f2532cff96fb731c282a62f1315d2246a0a9210ec4acb02653f2ac8a3c74a39                         │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ Version: 48026612                                                                              │
│  │ Digest: CdnsVep2RQ73WtouyLTM7kuECbxGmjDCdn64n39eoB3z                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2591600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2520540 MIST                                                                   │
│    Non-refundable Storage Fee: 25460 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    Xh741dPy22C9S63hREhCbWFe6JmtCdU1xpH8QRu5SHd                                                    │
│    j3t2JDv3HDTqx1xkPpuwnoCNo1SPP8CfcxfUT5LWgC5                                                    │
│    6D4bKjsG1dtyAgmDjwcMwmjQ7ASo5WaEYBwVPrWADkCH                                                   │
│    AG5yZesgaZ31N2baMAASbLcu2WyVNVUpQfmHjXHszz4N                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                          │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ EventID: 3Fdtr3gQiFxnjwrkgAPP7FiyWLsc3YFkASJA2vKYhDq2:0                                        │
│  │ PackageID: 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf                  │
│  │ Transaction Module: lets_move                                                                  │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                     │
│  │ EventType: 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf::lets_move::Flag │
│  │ ParsedJSON:                                                                                    │
│  │   ┌────────┬────────────────────────────────────────────────────────────────────┐              │
│  │   │ flag   │ true                                                               │              │
│  │   ├────────┼────────────────────────────────────────────────────────────────────┤              │
│  │   │ sender │ 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc │              │
│  │   └────────┴────────────────────────────────────────────────────────────────────┘              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                         │
│  ┌──                                                                                                     │
│  │ ObjectID: 0x0f2532cff96fb731c282a62f1315d2246a0a9210ec4acb02653f2ac8a3c74a39                          │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                            │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                            │
│  │ Version: 48026612                                                                                     │
│  │ Digest: CdnsVep2RQ73WtouyLTM7kuECbxGmjDCdn64n39eoB3z                                                  │
│  └──                                                                                                     │
│  ┌──                                                                                                     │
│  │ ObjectID: 0xac8019e319c6139b2cf6ea937aedab2d584fbeca28d0a7040518bac5aadbdbff                          │
│  │ Sender: 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc                            │
│  │ Owner: Shared                                                                                         │
│  │ ObjectType: 0xd5c6f9f40969f7af6f97c17d86ade578899f81b519f13e01dd551b12c3d99abf::lets_move::Challenge  │
│  │ Version: 48026612                                                                                     │
│  │ Digest: CtFnXkmQmEtQxsdL9h1NijVjYWUYEaewcy8tHu2Eo92h                                                  │
│  └──                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x167318d9fb3b6bf21eb84cca0d346d2f333f2dfedc61690d4431a55ae98ac7dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1071060                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
