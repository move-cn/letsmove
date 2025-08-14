```
export PACKAGE_ID=0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91
export COIN_A=$PACKAGE_ID::coin_a::COIN_A
export COIN_B=$PACKAGE_ID::coin_b::COIN_B

export COIN_A_TREASURY_CAP_ID=0x07701363c63ec8e9105623f659e3bfd981d45ae1657afc4a0ab72eacdcb09285
export COIN_B_TREASURY_CAP_ID=0xe65b417772ba4f81a11dba2404222fd31757dcd219de2f9076b505e5b08dcbcf

export ADDRESS=0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4

```
a:0x07701363c63ec8e9105623f659e3bfd981d45ae1657afc4a0ab72eacdcb09285
b:0xe65b417772ba4f81a11dba2404222fd31757dcd219de2f9076b505e5b08dcbcf
```
```PS D:\sui m\study\cnell_swap> sui client call --gas-budget 7500000 --package 0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91 --module coin_a --function mint --args 0x07701363c63ec8e9105623f659e3bfd981d45ae1657afc4a0ab72eacdcb09285 1000 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4
[warn] Client/Server api version mismatch, client api version : 1.22.0, server api version : 1.23.0
Transaction Digest: 8mWyqSf2HPS6srSsTLXWbrHHPuahZLMq9h7947z8sUnU
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                   │
│ Gas Owner: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                │
│ Gas Budget: 7500000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                                    │
│  │ Version: 29517317                                                                                         │
│  │ Digest: 6k8ujmd4CJd3x5ekcWbcnepyKUKUhLWaycrLKtNEUT7W                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x07701363c63ec8e9105623f659e3bfd981d45ae1657afc4a0ab72eacdcb09285              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000"                                                                   │ │
│ │ 2   Pure Arg: Type: address, Value: "0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    coin_a                                                             │                         │
│ │  │ Package:   0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    5A2yUn8wT7DCjybqw1eA9+Ajk3BhrPN73VgglD15DLpiT3ErXj9I9oU/Aw+FqtXqha4/mcMP9UfAB4daBc8+cw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 8mWyqSf2HPS6srSsTLXWbrHHPuahZLMq9h7947z8sUnU                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x7f09915fc39f1fb3cebabae368bf1e1101f007ef3a538a47b68234c20877b61f                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517318                                                                              │
│  │ Digest: 6vLaeamAks2BMSKFP44xS9MfoPQ9bL6MehxJC7mfoJCy                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517318                                                                              │
│  │ Digest: 2CntFSDApPQhbXf4WUj4d6TmNZ81gNkf3SCa7iPxQbb1                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x07701363c63ec8e9105623f659e3bfd981d45ae1657afc4a0ab72eacdcb09285                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517318                                                                              │
│  │ Digest: DaV7CovdcbheCEuZdf68tK8PBVhZjD1SKbuNymVQTeMf                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                         │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ Version: 29517318                                                                              │
│  │ Digest: 2CntFSDApPQhbXf4WUj4d6TmNZ81gNkf3SCa7iPxQbb1                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4073600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2693592 MIST                                                                   │
│    Non-refundable Storage Fee: 27208 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    ZoRA6hsbn7fUeSppuB3JUqx5LjBum48wFWgbFc5mSVB                                                    │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                             │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x7f09915fc39f1fb3cebabae368bf1e1101f007ef3a538a47b68234c20877b61f                                            │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )                           │
│  │ ObjectType: 0x2::coin::Coin<0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91::coin_a::COIN_A>         │
│  │ Version: 29517318                                                                                                       │
│  │ Digest: 6vLaeamAks2BMSKFP44xS9MfoPQ9bL6MehxJC7mfoJCy                                                                    │
│  └──                                                                                                                       │
│ Mutated Objects:                                                                                                           │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x02b0928fc1768fda08825c8f58ee1fde78f73df8b3b85abaaf3d3b768d046635                                            │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )                           │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                              │
│  │ Version: 29517318                                                                                                       │
│  │ Digest: 2CntFSDApPQhbXf4WUj4d6TmNZ81gNkf3SCa7iPxQbb1                                                                    │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ ObjectID: 0x07701363c63ec8e9105623f659e3bfd981d45ae1657afc4a0ab72eacdcb09285                                            │
│  │ Sender: 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )                           │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91::coin_a::COIN_A>  │
│  │ Version: 29517318                                                                                                       │
│  │ Digest: DaV7CovdcbheCEuZdf68tK8PBVhZjD1SKbuNymVQTeMf                                                                    │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2380008                                                                               │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 )  │
│  │ CoinType: 0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91::coin_a::COIN_A   │
│  │ Amount: 1000                                                                                   │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
5

sui client call --package 0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91 --module myswap --function "swap_a_to_b" --args 0xb2552c5dc9bd0118251e4fd8ce42bf085d6754f4e0094a7b5acc2225b714c512 0xccc5c2f15557a3ee61e32cb6daee0314626a72c36d4b80db5c7a533a4326d0a4 1 --type-args "0x2::sui::SUI" "0xa27e8dca5cf11147b4fa8ac4590a06b2fd84dac24e4b499fded6b4b885c60f91::myswap::MYSWAP" --gas-budget 5000000