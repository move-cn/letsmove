## task1

在win上安装sui，配置环境变量，idea装插件，发布hello源码到测试网`sui client publish --gas-budget 100000000`

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

