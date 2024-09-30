1. 

2. deploy
```
 sui client publish     --gas-budget 200000000 sources/my_coin.move
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task_two
warning[W09001]: unused alias
  ┌─ sources/my_coin.move:3:27
  │
3 │     use sui::coin::{Self, Coin, TreasuryCap};
  │                           ^^^^ Unused 'use' of alias 'Coin'. Consider removing it
  │
  = This warning can be suppressed with '#[allow(unused_use)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Transaction Digest: CXV1YcDXPf6xZD1ezk6z7YFZwdevfZezG8vYuCWGS78Y
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                    │
│  │ Version: 79749902                                                                                         │
│  │ Digest: En5SsGGLaimQG4tJEPK93Ket2hivSAhAN5JMCbqxXQUC                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
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
│    ycDQZUWPynecl6RSaEKwOtyTMcSVXr4IvqAZddfMhwyskZubZ2idqoiJUt42PjLcBwKulPdPdqk2f2v+F+TQAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CXV1YcDXPf6xZD1ezk6z7YFZwdevfZezG8vYuCWGS78Y                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 342                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 43t3dseUSW5dmmAwx7cuk1nD46XJYSRKMwjDPadWENcR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd790e9997f89193937785efecb45ada96913c867a551af82083caca9ebe1efaa                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 79749903                                                                              │
│  │ Digest: GK7jSxa1edb8MfKP65GxGXvBjXEHrhaSutA5k92PQTLX                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749903                                                                              │
│  │ Digest: 5pkY53TMeFuHQkQLGfzf4f9JMc4uzE5MLRWa1sVzgjqB                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf2fb83127af1081591e8e9c50fbd20bc268bd2ceffda89c8a882ba0301e39b55                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749903                                                                              │
│  │ Digest: F4BqSD9wDY4a4qYgVWbKrkCBGybWGmKMyJLwZgR7YZBu                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749903                                                                              │
│  │ Digest: 6MiryZoDrYzYKARQ4BkkmeqUFaHp8hYLjnJPYvjG424r                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749903                                                                              │
│  │ Digest: 6MiryZoDrYzYKARQ4BkkmeqUFaHp8hYLjnJPYvjG424r                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 13148000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    A1jexVVu795xDcCjRcjczdocdqNyBK5Wu2H2rXujxfkF                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xd790e9997f89193937785efecb45ada96913c867a551af82083caca9ebe1efaa                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Immutable                                                                                                           │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>  │
│  │ Version: 79749903                                                                                                          │
│  │ Digest: GK7jSxa1edb8MfKP65GxGXvBjXEHrhaSutA5k92PQTLX                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                              │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>   │
│  │ Version: 79749903                                                                                                          │
│  │ Digest: 5pkY53TMeFuHQkQLGfzf4f9JMc4uzE5MLRWa1sVzgjqB                                                                       │
│  └──                                                                                                                          │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0xf2fb83127af1081591e8e9c50fbd20bc268bd2ceffda89c8a882ba0301e39b55                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                              │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                       │
│  │ Version: 79749903                                                                                                          │
│  │ Digest: F4BqSD9wDY4a4qYgVWbKrkCBGybWGmKMyJLwZgR7YZBu                                                                       │
│  └──                                                                                                                          │
│ Mutated Objects:                                                                                                              │
│  ┌──                                                                                                                          │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                               │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                 │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                              │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                 │
│  │ Version: 79749903                                                                                                          │
│  │ Digest: 6MiryZoDrYzYKARQ4BkkmeqUFaHp8hYLjnJPYvjG424r                                                                       │
│  └──                                                                                                                          │
│ Published Objects:                                                                                                            │
│  ┌──                                                                                                                          │
│  │ PackageID: 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7                                              │
│  │ Version: 1                                                                                                                 │
│  │ Digest: 43t3dseUSW5dmmAwx7cuk1nD46XJYSRKMwjDPadWENcR                                                                       │
│  │ Modules: my_coin                                                                                                           │
│  └──                                                                                                                          │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -12919880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
3. mint
sui client call --function mint --module mycoin --package <PACKAGE-ID> --args <TREASURY-CAP-ID> <COIN-AMOUNT> <RECIPIENT-ADDRESS> --gas-budget <GAS-AMOUNT>
```
sui client call --function mint --module my_coin --package 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7 --args 0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087 952700000000 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 --gas-budget 90000000
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: HE6scppbwotoGzuQb9odP9AUQ9jB1xmeEaiWt5pkcGna
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 90000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                    │
│  │ Version: 79749903                                                                                         │
│  │ Digest: 6MiryZoDrYzYKARQ4BkkmeqUFaHp8hYLjnJPYvjG424r                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087              │ │
│ │ 1   Pure Arg: Type: u64, Value: "952700000000"                                                           │ │
│ │ 2   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    my_coin                                                            │                         │
│ │  │ Package:   0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    WE/lWZcdzh21kvaL+FfckRDdU3ut3A2wr3H9Wc169D+YYGI6RybqzLkDS2ylY5XfncQ/CU+vGm7NKMxqCVJrAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: HE6scppbwotoGzuQb9odP9AUQ9jB1xmeEaiWt5pkcGna                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 342                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x60aeaecf81d985a6f198ce93ceee629873a6fe80f349d317bab9b2f82d8fff0b                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749904                                                                              │
│  │ Digest: 2UKoVkf3aLUh9vYKct9XuGzHJTDaJVtWKVHsUAqbkvrq                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749904                                                                              │
│  │ Digest: 5D9BNoasggixyoT9cXTDUk6zcKrwWSvsYdJ87sAL8x8A                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749904                                                                              │
│  │ Digest: D2aviUrwCL3w2fNWjLtPAer96MxYTLLhpXJJ69tGVBst                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749904                                                                              │
│  │ Digest: 5D9BNoasggixyoT9cXTDUk6zcKrwWSvsYdJ87sAL8x8A                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4104000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2708640 MIST                                                                   │
│    Non-refundable Storage Fee: 27360 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    CXV1YcDXPf6xZD1ezk6z7YFZwdevfZezG8vYuCWGS78Y                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x60aeaecf81d985a6f198ce93ceee629873a6fe80f349d317bab9b2f82d8fff0b                                              │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>         │
│  │ Version: 79749904                                                                                                         │
│  │ Digest: 2UKoVkf3aLUh9vYKct9XuGzHJTDaJVtWKVHsUAqbkvrq                                                                      │
│  └──                                                                                                                         │
│ Mutated Objects:                                                                                                             │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                              │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                │
│  │ Version: 79749904                                                                                                         │
│  │ Digest: 5D9BNoasggixyoT9cXTDUk6zcKrwWSvsYdJ87sAL8x8A                                                                      │
│  └──                                                                                                                         │
│  ┌──                                                                                                                         │
│  │ ObjectID: 0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087                                              │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                             │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>  │
│  │ Version: 79749904                                                                                                         │
│  │ Digest: D2aviUrwCL3w2fNWjLtPAer96MxYTLLhpXJJ69tGVBst                                                                      │
│  └──                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                    │
├────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )   │
│  │ CoinType: 0x2::sui::SUI                                                                         │
│  │ Amount: -2145360                                                                                │
│  └──                                                                                               │
│  ┌──                                                                                               │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )   │
│  │ CoinType: 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN  │
│  │ Amount: 952700000000                                                                            │
│  └──                                                                                               │
╰────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

4.faucet coin
```
sui client publish     --gas-budget 200000000 sources/faucet_coin.move 
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task_two
warning[W09001]: unused alias
  ┌─ sources/faucet_coin.move:3:27
  │
3 │     use sui::coin::{Self, Coin, TreasuryCap};
  │                           ^^^^ Unused 'use' of alias 'Coin'. Consider removing it
  │
  = This warning can be suppressed with '#[allow(unused_use)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09001]: unused alias
  ┌─ sources/my_coin.move:3:27
  │
3 │     use sui::coin::{Self, Coin, TreasuryCap};
  │                           ^^^^ Unused 'use' of alias 'Coin'. Consider removing it
  │
  = This warning can be suppressed with '#[allow(unused_use)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Successfully verified dependencies on-chain against source.
Transaction Digest: 7kbxRhtvMwzvTgs3xz5gacbrrQnLfiL18NVbsrmiYTKn
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 200000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                    │
│  │ Version: 79749904                                                                                         │
│  │ Digest: 5D9BNoasggixyoT9cXTDUk6zcKrwWSvsYdJ87sAL8x8A                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
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
│    +uzmitfwfd0z/znuRmHlm6DeRzE1bMQqrO5UEl8jmeQK5qfiDmxfMIsaAQGjAmmWozd+5+CPH0voR5auQE6aBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7kbxRhtvMwzvTgs3xz5gacbrrQnLfiL18NVbsrmiYTKn                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 342                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x08703d591289d9cad45845eaf4ea1a357d59333c9f8dec246aad365bd2ef232b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 79749905                                                                              │
│  │ Digest: 32b6an2srncs7wdJJcSXLfRMSF5L45Gr7trfFQN357RR                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x10590fc8277d173daaae13bfbc7e6f616603ecdfb4b791a37a82e3f164b294f2                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749905                                                                              │
│  │ Digest: C2fu539Qujbog8o9jpCdzvxyjhUVqMgtFYQtY4UzXgEj                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2hcZWRMER8Lbyx7nVGL2g3ixwKE62kWtcvjexDYijD7d                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x69f3208ec757a6ac5853d1dfedf27afcf2f5ec16f80522e753c94ddad9cd0bd5                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749905                                                                              │
│  │ Digest: FJycZ4TtyjeQbJT716vJNWxVHEVkAmQNHKUqWX65hKH8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6d1152f3cc505286152e37f3a6d171f8a60041a547402bedc455d90de22c682c                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 79749905                                                                              │
│  │ Digest: ARFdJSvexKgsoaaxTVhYthtv4cAvz99UjaT3nmucpZaa                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749905                                                                              │
│  │ Digest: E7PnVbZrHkt5cJvzJnnUoaUGMg914y9EYSVwYqRRrhvH                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749905                                                                              │
│  │ Digest: 7TQK19w1ANHHFRkwrCbn6FRPxTzbNGxxATgnm2amRDMe                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749905                                                                              │
│  │ Digest: 7TQK19w1ANHHFRkwrCbn6FRPxTzbNGxxATgnm2amRDMe                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 22245200 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    HE6scppbwotoGzuQb9odP9AUQ9jB1xmeEaiWt5pkcGna                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x08703d591289d9cad45845eaf4ea1a357d59333c9f8dec246aad365bd2ef232b                                                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::my_coin::MY_COIN>          │
│  │ Version: 79749905                                                                                                                  │
│  │ Digest: 32b6an2srncs7wdJJcSXLfRMSF5L45Gr7trfFQN357RR                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x10590fc8277d173daaae13bfbc7e6f616603ecdfb4b791a37a82e3f164b294f2                                                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 79749905                                                                                                                  │
│  │ Digest: C2fu539Qujbog8o9jpCdzvxyjhUVqMgtFYQtY4UzXgEj                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x69f3208ec757a6ac5853d1dfedf27afcf2f5ec16f80522e753c94ddad9cd0bd5                                                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::my_coin::MY_COIN>           │
│  │ Version: 79749905                                                                                                                  │
│  │ Digest: FJycZ4TtyjeQbJT716vJNWxVHEVkAmQNHKUqWX65hKH8                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x6d1152f3cc505286152e37f3a6d171f8a60041a547402bedc455d90de22c682c                                                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN>  │
│  │ Version: 79749905                                                                                                                  │
│  │ Digest: ARFdJSvexKgsoaaxTVhYthtv4cAvz99UjaT3nmucpZaa                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973                                                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN>   │
│  │ Version: 79749905                                                                                                                  │
│  │ Digest: E7PnVbZrHkt5cJvzJnnUoaUGMg914y9EYSVwYqRRrhvH                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 79749905                                                                                                                  │
│  │ Digest: 7TQK19w1ANHHFRkwrCbn6FRPxTzbNGxxATgnm2amRDMe                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: 2hcZWRMER8Lbyx7nVGL2g3ixwKE62kWtcvjexDYijD7d                                                                               │
│  │ Modules: faucet_coin, my_coin                                                                                                      │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -22017080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
mint
```
sui client call --function mint --module faucet_coin --package 0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1 --args 0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973 1952700000000 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 --gas-budget 90000000
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: Cbmge53Y4KTAGFszhn8CQ3ygcF57MhUjGhjheYCZA4fA
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                   │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                │
│ Gas Budget: 90000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                    │
│  │ Version: 79749906                                                                                         │
│  │ Digest: 7V1FEHEteo6JrVWsVhjS2rAwThD2LmdagtwtHQwk2cFD                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1952700000000"                                                          │ │
│ │ 2   Pure Arg: Type: address, Value: "0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    LSIZ2dLoc3x6sdwSkjnfJvq3cHiuU9yf6zPA2MxUu81wegpjbQLvc5ZLTFUwBKQ8ODTCQUpRpHNcxJnyDAwzAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Cbmge53Y4KTAGFszhn8CQ3ygcF57MhUjGhjheYCZA4fA                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 342                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2ef45c8447144e0b564eefeeaeb51c99aac4663fa955fcdd6e335f24bbebca07                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749907                                                                              │
│  │ Digest: GxVwJ8EZGJvHRetPCVA9NLCXc9pyDbmdMmBsFQBSgfaa                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749907                                                                              │
│  │ Digest: CbU4UDwNiSLP93VHK2Jh1YUgeJdvdir1fVRhAjfvb7or                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749907                                                                              │
│  │ Digest: EeQWnJB72DEEvRNzN6HKEcnK6JjoL2iYVkgMGi7oor4n                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749907                                                                              │
│  │ Digest: CbU4UDwNiSLP93VHK2Jh1YUgeJdvdir1fVRhAjfvb7or                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2kY6NkS5BWE5RPLYeouA6aNbJYiMGPQZVztjQP4ZVFSr                                                   │
│    7kbxRhtvMwzvTgs3xz5gacbrrQnLfiL18NVbsrmiYTKn                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x2ef45c8447144e0b564eefeeaeb51c99aac4663fa955fcdd6e335f24bbebca07                                                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN>         │
│  │ Version: 79749907                                                                                                                 │
│  │ Digest: GxVwJ8EZGJvHRetPCVA9NLCXc9pyDbmdMmBsFQBSgfaa                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 79749907                                                                                                                 │
│  │ Digest: CbU4UDwNiSLP93VHK2Jh1YUgeJdvdir1fVRhAjfvb7or                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973                                                      │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                        │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN>  │
│  │ Version: 79749907                                                                                                                 │
│  │ Digest: EeQWnJB72DEEvRNzN6HKEcnK6JjoL2iYVkgMGi7oor4n                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2206768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )           │
│  │ CoinType: 0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN  │
│  │ Amount: 1952700000000                                                                                   │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

4. 发送币,使用浏览器插件Sui
