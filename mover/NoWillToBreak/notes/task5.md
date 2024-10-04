1. deploy coin,使用task2中的coin
```
CNYA="0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN"
CNYW="0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN"
CNYACAP="0xf0aa8d02a219747cd5a8ed62e412d52bdccf0e719bfc65103e98fc795eefc973"
CNYWCAP="0xe5fc61ca4e38d075e59950c6a377dfaf8d6cf74faa10a418dd58bd4d38c8a087"
AMMPKG="0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524"
# 后面得到
FC="0x2ef45c8447144e0b564eefeeaeb51c99aac4663fa955fcdd6e335f24bbebca07"
MC="0x60aeaecf81d985a6f198ce93ceee629873a6fe80f349d317bab9b2f82d8fff0b"
FC2="0xff77c09009fa2cf9a4db2b3bc8769f8c460a771193aee5630dc80d0f474fd31d"

POCKETID="0xdf6a6915de74980140ff44fd635cb3264c96b5fa68564476542edbcb909b0879"
POOLID="0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d"
```

2. deploy swap
```
sui client publish --gas-budget 200000000 sources/liquidity.move  --skip-dependency-verification
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING swap
warning[W09013]: unused mutable reference '&mut'
   ┌─ sources/liquidity.move:83:42
   │
83 │         let coin_x_out = *vector::borrow(&mut vec, 0);
   │                                          ^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
   │
   = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
   ┌─ sources/liquidity.move:84:42
   │
84 │         let coin_y_out = *vector::borrow(&mut vec, 1);
   │                                          ^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
   │
   = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
   ┌─ sources/liquidity.move:86:32
   │
86 │         assert!(balance::value(&mut pool.coin_x) > coin_x_out, ErrNotEnoughXInPool);
   │                                ^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
   │
   = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
   ┌─ sources/liquidity.move:87:32
   │
87 │         assert!(balance::value(&mut pool.coin_y) > coin_y_out, ErrNotEnoughYInPool);
   │                                ^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
   │
   = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
    ┌─ sources/liquidity.move:102:32
    │
102 │         assert!(balance::value(&mut pool.coin_x) > coin_x_out, ErrNotEnoughXInPool);
    │                                ^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
    │
    = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
    ┌─ sources/liquidity.move:103:32
    │
103 │         assert!(balance::value(&mut pool.coin_y) > coin_y_out, ErrNotEnoughYInPool);
    │                                ^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
    │
    = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
    ┌─ sources/liquidity.move:123:45
    │
123 │         assert!(paid_value < balance::value(&mut pool.coin_y), ErrNotEnoughYInPool);
    │                                             ^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
    │
    = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
    ┌─ sources/liquidity.move:133:45
    │
133 │         assert!(paid_value < balance::value(&mut pool.coin_x), ErrNotEnoughXInPool);
    │                                             ^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
    │
    = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

warning[W09013]: unused mutable reference '&mut'
    ┌─ sources/liquidity.move:192:34
    │
192 │         let vec = *table::borrow(&mut pocket.table, lp_id);
    │                                  ^^^^^^^^^^^^^^^^^ Mutable reference is never used mutably, consider switching to an immutable reference '&' instead
    │
    = This warning can be suppressed with '#[allow(unused_mut_ref)]' applied to the 'module' or module member ('const', 'fun', or 'struct')

Skipping dependency verification
Transaction Digest: 2mMRhWh3bqhZUg6fhA18et5zpg9o2Nni3ZdmrG18fNAW
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
│  │ Version: 79749913                                                                                         │
│  │ Digest: G8hTRDvyEdsGm984NonFCwdzFSp8vyWmiVn3ci6uqn2w                                                      │
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
│    cTsoTaG+MM29UMcBIsQvrr0simAoTQ9tmBXarBNFsaEzH4t72954sK8Cq5pB1oTVAKrYTmro/jopIeG4j7exCQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 2mMRhWh3bqhZUg6fhA18et5zpg9o2Nni3ZdmrG18fNAW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AECwmpPKK5GKoZkbqugeBC9v118zJuaAuHPyHTaEUo48                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa9f0428f5b54c6fc0b2fb4d2b4e7b4526ae557e3d03b8a8e07fca7c5cb4cdecb                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749914                                                                              │
│  │ Digest: 4K7kRWLsJefwpmLeFy3XwBiNLH84oPD27yWatopQfXoD                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749914                                                                              │
│  │ Digest: GqaJB3ZFodWKBxkUDoKzJbYamtBt7fUeWGQemaRNgHiA                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749914                                                                              │
│  │ Digest: GqaJB3ZFodWKBxkUDoKzJbYamtBt7fUeWGQemaRNgHiA                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 31046000 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4HPyn8xLGks55WSbKRSA7DU2RBD4tDZWQNDNb8a2yUg1                                                   │
│    7FtUuSqeZ9VRGbrMs38To5Qf4qd9nuVf43Xo4G6YL8Sz                                                   │
│    BJbih1r6Zj4EuFxYZrvLzkzSZrSko9FKAs68kCV1XivT                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa9f0428f5b54c6fc0b2fb4d2b4e7b4526ae557e3d03b8a8e07fca7c5cb4cdecb                  │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                    │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 79749914                                                                             │
│  │ Digest: 4K7kRWLsJefwpmLeFy3XwBiNLH84oPD27yWatopQfXoD                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                  │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                    │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 79749914                                                                             │
│  │ Digest: GqaJB3ZFodWKBxkUDoKzJbYamtBt7fUeWGQemaRNgHiA                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524                 │
│  │ Version: 1                                                                                    │
│  │ Digest: AECwmpPKK5GKoZkbqugeBC9v118zJuaAuHPyHTaEUo48                                          │
│  │ Modules: liquidity                                                                            │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -30817880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

3.1 generate pool and pocket
```
sui client call --package $AMMPKG \
                --module liquidity \
                --function generate_pool \
                 \
                --type-args  $CNYA $CNYW
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: EhFzTpLyMUub3dS8evm13B9hrnytQ2oK8cSiVALQQDmk
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                            │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                         │
│ Gas Budget: 100000000 MIST                                                                            │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                             │
│  │ Version: 79749914                                                                                  │
│  │ Digest: GqaJB3ZFodWKBxkUDoKzJbYamtBt7fUeWGQemaRNgHiA                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│   No input objects for this transaction                                                               │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  generate_pool                                                                       │ │
│ │  │ Module:    liquidity                                                                           │ │
│ │  │ Package:   0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN │ │
│ │  │   0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN         │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    Uuepnn+EjLpLZJ3EYnOhMaG0aqRPL+NBVP1JfA7NHB709Hyl7bJXM9QErQlAi5q7Xm35SRvu4UmPePUaVqZNAw==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EhFzTpLyMUub3dS8evm13B9hrnytQ2oK8cSiVALQQDmk                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 79749915                                                                              │
│  │ Digest: AzBc4LdNiBoDiTzDXX3qNthqB9gy713KV6TLX9HQY1wn                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749915                                                                              │
│  │ Digest: HGHbQVo3HoG8R36mnW2ipT5QmU6gugqjyeJKuiak3bgY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749915                                                                              │
│  │ Digest: HGHbQVo3HoG8R36mnW2ipT5QmU6gugqjyeJKuiak3bgY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3283200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2mMRhWh3bqhZUg6fhA18et5zpg9o2Nni3ZdmrG18fNAW                                                   │
│    7kbxRhtvMwzvTgs3xz5gacbrrQnLfiL18NVbsrmiYTKn                                                   │
│    CXV1YcDXPf6xZD1ezk6z7YFZwdevfZezG8vYuCWGS78Y                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                        │
│  ┌──                                                                                                                                                                                                                                                                                    │
│  │ ObjectID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                                                                                                                                                                                                         │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                           │
│  │ Owner: Shared                                                                                                                                                                                                                                                                        │
│  │ ObjectType: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::Pool<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN, 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>  │
│  │ Version: 79749915                                                                                                                                                                                                                                                                    │
│  │ Digest: AzBc4LdNiBoDiTzDXX3qNthqB9gy713KV6TLX9HQY1wn                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                    │
│ Mutated Objects:                                                                                                                                                                                                                                                                        │
│  ┌──                                                                                                                                                                                                                                                                                    │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                                                                                                                                                                                         │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                           │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                           │
│  │ Version: 79749915                                                                                                                                                                                                                                                                    │
│  │ Digest: HGHbQVo3HoG8R36mnW2ipT5QmU6gugqjyeJKuiak3bgY                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3055080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
sui client call --package $AMMPKG \
                --module liquidity \
                --function create_pocket \
                 
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: 7zYcSAW333rdEkKuwBaTh9YxMaN5Q2965bBXuNYhgnP4
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                  │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85               │
│ Gas Budget: 100000000 MIST                                                                  │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                   │
│  │ Version: 79749915                                                                        │
│  │ Digest: HGHbQVo3HoG8R36mnW2ipT5QmU6gugqjyeJKuiak3bgY                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  create_pocket                                                      │        │
│ │  │ Module:    liquidity                                                          │        │
│ │  │ Package:   0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524 │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    A+sk/fichE2NsGr0AfgX6K8dIf0GxMZjJk/z48lfzzYYXNzNasg+sWlEwk6HjFJzCovo+IO3Vzi5auFJ6/sKDQ== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7zYcSAW333rdEkKuwBaTh9YxMaN5Q2965bBXuNYhgnP4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xdf6a6915de74980140ff44fd635cb3264c96b5fa68564476542edbcb909b0879                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749916                                                                              │
│  │ Digest: GWqAfP4SbrJQ7r487e8XxEL1B4E8ZDGAHzothSBdoqr3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749916                                                                              │
│  │ Digest: 4pEwKTdBTWUhnyEMuW5zM2FtGD4TF1EFtRuyz9zrSJrk                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749916                                                                              │
│  │ Digest: 4pEwKTdBTWUhnyEMuW5zM2FtGD4TF1EFtRuyz9zrSJrk                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2599200 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2mMRhWh3bqhZUg6fhA18et5zpg9o2Nni3ZdmrG18fNAW                                                   │
│    EhFzTpLyMUub3dS8evm13B9hrnytQ2oK8cSiVALQQDmk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0xdf6a6915de74980140ff44fd635cb3264c96b5fa68564476542edbcb909b0879                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )      │
│  │ ObjectType: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::Pocket  │
│  │ Version: 79749916                                                                                  │
│  │ Digest: GWqAfP4SbrJQ7r487e8XxEL1B4E8ZDGAHzothSBdoqr3                                               │
│  └──                                                                                                  │
│ Mutated Objects:                                                                                      │
│  ┌──                                                                                                  │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                       │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                         │
│  │ Version: 79749916                                                                                  │
│  │ Digest: 4pEwKTdBTWUhnyEMuW5zM2FtGD4TF1EFtRuyz9zrSJrk                                               │
│  └──                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2371080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
4. add liq
```
sui client call --package $AMMPKG \                                    
                --module liquidity \
                --function deposit_totally\
                 \
                --type-args  $CNYA $CNYW\
                --args $POOLID\
                $FC\
                $MC\
                $POCKETID
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: DdWf6vRiaxKkqUeLsh2JbAebfVdF9KZhi5ciEmg5w2qw
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                            │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                         │
│ Gas Budget: 100000000 MIST                                                                            │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                             │
│  │ Version: 79749916                                                                                  │
│  │ Digest: 4pEwKTdBTWUhnyEMuW5zM2FtGD4TF1EFtRuyz9zrSJrk                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d │       │
│ │ 1   Imm/Owned Object ID: 0x2ef45c8447144e0b564eefeeaeb51c99aac4663fa955fcdd6e335f24bbebca07 │       │
│ │ 2   Imm/Owned Object ID: 0x60aeaecf81d985a6f198ce93ceee629873a6fe80f349d317bab9b2f82d8fff0b │       │
│ │ 3   Imm/Owned Object ID: 0xdf6a6915de74980140ff44fd635cb3264c96b5fa68564476542edbcb909b0879 │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  deposit_totally                                                                     │ │
│ │  │ Module:    liquidity                                                                           │ │
│ │  │ Package:   0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN │ │
│ │  │   0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN         │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  │   Input  3                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    NobYxMEfWaw0XTjWp7CK0B3bTscORIgkADH8ytIAPohv7ONg+bMgbc8RZDb6XzUKvVzu59FtdOh7pu8ZdGt6Aw==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: DdWf6vRiaxKkqUeLsh2JbAebfVdF9KZhi5ciEmg5w2qw                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5ea9b56b40876cd9dc8a56f892a1e0e031ac2bd228a9550315348961d4267b48                         │
│  │ Owner: Object ID: ( 0x06ffc2e8aa32267dfaeea5af867b2191afdb7d9e702ade322fb46950c2a7e0e4 )       │
│  │ Version: 79749917                                                                              │
│  │ Digest: GkwTLuHW4scnrXHaRgnz4aVGF2RFMjKp9bAaaBRSgDsF                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6ab85597d251afebad77d0099cd9aa54efafb95d3ea99e4e792892cecc0dbe2c                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749917                                                                              │
│  │ Digest: 34thgKb4N7xRCHqY8u2Xk3ysSTbtJmz4KWVprcm137RG                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 79749917                                                                              │
│  │ Digest: jjihhvSc7xkp5uPeVkBqkR2CYJumSR6JnGdGmHZ6sfs                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749917                                                                              │
│  │ Digest: E5vWXyf2Q7BPCVoTP9TSkAYCkEz2CrcX6GYxa8uLzxYc                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdf6a6915de74980140ff44fd635cb3264c96b5fa68564476542edbcb909b0879                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749917                                                                              │
│  │ Digest: DfMpXzzmNB6SYupExpJ8zg234VpJnh5U3dcS3BYRaYC7                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                         │
│  │ Version: 79749915                                                                              │
│  │ Digest: AzBc4LdNiBoDiTzDXX3qNthqB9gy713KV6TLX9HQY1wn                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2ef45c8447144e0b564eefeeaeb51c99aac4663fa955fcdd6e335f24bbebca07                         │
│  │ Version: 79749917                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x60aeaecf81d985a6f198ce93ceee629873a6fe80f349d317bab9b2f82d8fff0b                         │
│  │ Version: 79749917                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749917                                                                              │
│  │ Digest: E5vWXyf2Q7BPCVoTP9TSkAYCkEz2CrcX6GYxa8uLzxYc                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9112400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 7614288 MIST                                                                   │
│    Non-refundable Storage Fee: 76912 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2R2HcJo4CVxrcUiW9yx2UWcEsGTwZj8ZCZzLCNsFpVEk                                                   │
│    2mMRhWh3bqhZUg6fhA18et5zpg9o2Nni3ZdmrG18fNAW                                                   │
│    7kbxRhtvMwzvTgs3xz5gacbrrQnLfiL18NVbsrmiYTKn                                                   │
│    7zYcSAW333rdEkKuwBaTh9YxMaN5Q2965bBXuNYhgnP4                                                   │
│    CXV1YcDXPf6xZD1ezk6z7YFZwdevfZezG8vYuCWGS78Y                                                   │
│    Cbmge53Y4KTAGFszhn8CQ3ygcF57MhUjGhjheYCZA4fA                                                   │
│    EhFzTpLyMUub3dS8evm13B9hrnytQ2oK8cSiVALQQDmk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                                         │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x5ea9b56b40876cd9dc8a56f892a1e0e031ac2bd228a9550315348961d4267b48                                                                                                                                                                                                                        │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                                          │
│  │ Owner: Object ID: ( 0x06ffc2e8aa32267dfaeea5af867b2191afdb7d9e702ade322fb46950c2a7e0e4 )                                                                                                                                                                                                            │
│  │ ObjectType: 0x2::dynamic_field::Field<0x2::object::ID, vector<u64>>                                                                                                                                                                                                                                 │
│  │ Version: 79749917                                                                                                                                                                                                                                                                                   │
│  │ Digest: GkwTLuHW4scnrXHaRgnz4aVGF2RFMjKp9bAaaBRSgDsF                                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x6ab85597d251afebad77d0099cd9aa54efafb95d3ea99e4e792892cecc0dbe2c                                                                                                                                                                                                                        │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::LP<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN, 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>>  │
│  │ Version: 79749917                                                                                                                                                                                                                                                                                   │
│  │ Digest: 34thgKb4N7xRCHqY8u2Xk3ysSTbtJmz4KWVprcm137RG                                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                                                   │
│ Mutated Objects:                                                                                                                                                                                                                                                                                       │
│  ┌──                                                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                                                                                                                                                                                                                        │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                                          │
│  │ Owner: Shared                                                                                                                                                                                                                                                                                       │
│  │ ObjectType: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::Pool<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN, 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>                 │
│  │ Version: 79749917                                                                                                                                                                                                                                                                                   │
│  │ Digest: jjihhvSc7xkp5uPeVkBqkR2CYJumSR6JnGdGmHZ6sfs                                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                                                                                                                                                                                                        │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                                       │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                                          │
│  │ Version: 79749917                                                                                                                                                                                                                                                                                   │
│  │ Digest: E5vWXyf2Q7BPCVoTP9TSkAYCkEz2CrcX6GYxa8uLzxYc                                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                                                   │
│  ┌──                                                                                                                                                                                                                                                                                                   │
│  │ ObjectID: 0xdf6a6915de74980140ff44fd635cb3264c96b5fa68564476542edbcb909b0879                                                                                                                                                                                                                        │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                                          │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                                       │
│  │ ObjectType: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::Pocket                                                                                                                                                                                                   │
│  │ Version: 79749917                                                                                                                                                                                                                                                                                   │
│  │ Digest: DfMpXzzmNB6SYupExpJ8zg234VpJnh5U3dcS3BYRaYC7                                                                                                                                                                                                                                                │
│  └──                                                                                                                                                                                                                                                                                                   │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                                                                                                                                                                                     │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                                                                                                                                                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                    │
│  │ CoinType: 0x2::sui::SUI                                                                                                                                                                                                                                                          │
│  │ Amount: -2248112                                                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                │
│  ┌──                                                                                                                                                                                                                                                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                    │
│  │ CoinType: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::LP<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN, 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>  │
│  │ Amount: 2904880000000                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                │
│  ┌──                                                                                                                                                                                                                                                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                    │
│  │ CoinType: 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN                                                                                                                                                                                   │
│  │ Amount: -952180000000                                                                                                                                                                                                                                                            │
│  └──                                                                                                                                                                                                                                                                                │
│  ┌──                                                                                                                                                                                                                                                                                │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                    │
│  │ CoinType: 0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN                                                                                                                                                                           │
│  │ Amount: -1952700000000                                                                                                                                                                                                                                                           │
│  └──                                                                                                                                                                                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

5. swap
```
sui client call --package $AMMPKG \
                --module liquidity \
                --function swap_x_to_y \
                 \
                --type-args $CNYA $CNYW \
                --args $POOLID \
                       '["0xff77c09009fa2cf9a4db2b3bc8769f8c460a771193aee5630dc80d0f474fd31d"]' \
                       \"3154\"
[warn] Client/Server api version mismatch, client api version : 1.20.0, server api version : 1.20.1
Transaction Digest: EZmyBHFDcX2qRcEMTjv5yWj1Yc9tCNHgecXfcmz7b36P
╭───────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                      │
├───────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                            │
│ Gas Owner: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                         │
│ Gas Budget: 100000000 MIST                                                                            │
│ Gas Price: 750 MIST                                                                                   │
│ Gas Payment:                                                                                          │
│  ┌──                                                                                                  │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                             │
│  │ Version: 79749918                                                                                  │
│  │ Digest: E9oGTWTkqFJuA3w8Y5RwG8PMRzU1urke62UNGNhw6vLd                                               │
│  └──                                                                                                  │
│                                                                                                       │
│ Transaction Kind: Programmable                                                                        │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮       │
│ │ Input Objects                                                                               │       │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤       │
│ │ 0   Shared Object    ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d │       │
│ │ 1   Imm/Owned Object ID: 0xff77c09009fa2cf9a4db2b3bc8769f8c460a771193aee5630dc80d0f474fd31d │       │
│ │ 2   Pure Arg: Type: u64, Value: "3154"                                                      │       │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯       │
│ ╭───────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands                                                                                          │ │
│ ├───────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0  MakeMoveVec:                                                                                   │ │
│ │  ┌                                                                                                │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  1                                                                                     │ │
│ │  └                                                                                                │ │
│ │                                                                                                   │ │
│ │ 1  MoveCall:                                                                                      │ │
│ │  ┌                                                                                                │ │
│ │  │ Function:  swap_x_to_y                                                                         │ │
│ │  │ Module:    liquidity                                                                           │ │
│ │  │ Package:   0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524                  │ │
│ │  │ Type Arguments:                                                                                │ │
│ │  │   0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN │ │
│ │  │   0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN         │ │
│ │  │ Arguments:                                                                                     │ │
│ │  │   Input  0                                                                                     │ │
│ │  │   Result 0                                                                                     │ │
│ │  │   Input  2                                                                                     │ │
│ │  └                                                                                                │ │
│ ╰───────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│                                                                                                       │
│ Signatures:                                                                                           │
│    oCbolZGzMyqnxJeLzmxjIo68dHyn5XK6gcmiWw8+m4VT/QGD5iA4g0bAApNl1AllQ2nXbuplIaS8Yor+HneyDw==           │
│                                                                                                       │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EZmyBHFDcX2qRcEMTjv5yWj1Yc9tCNHgecXfcmz7b36P                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 344                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6c76602e0fc44e5b617c75d6c82f14abbb37c3881d40c6224f7b4ccc11fa7347                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749919                                                                              │
│  │ Digest: 3kWaNvdPDpeLqQNdxmcP4SExKmiQhVpDa81exSUzTW97                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdfc1801349f2a088fe8bc97c0692ce938b910836b3f09512c8dcb6d7c154defb                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749919                                                                              │
│  │ Digest: DFvNG4rtRvJR983HPEiWLH4Z2nwrRJ9tZFC3KovDdxcm                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 79749919                                                                              │
│  │ Digest: VZLvH9j8LcjZSv8pvYZraQ2MM2cjAiDqYYMRfa1GShv                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749919                                                                              │
│  │ Digest: 8h95YhDETCxpVzaMX5X1KWpvKE9XUKamAkuTFFgBhhvj                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                         │
│  │ Version: 79749917                                                                              │
│  │ Digest: jjihhvSc7xkp5uPeVkBqkR2CYJumSR6JnGdGmHZ6sfs                                            │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xff77c09009fa2cf9a4db2b3bc8769f8c460a771193aee5630dc80d0f474fd31d                         │
│  │ Version: 79749919                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                         │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )  │
│  │ Version: 79749919                                                                              │
│  │ Digest: 8h95YhDETCxpVzaMX5X1KWpvKE9XUKamAkuTFFgBhhvj                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 6080000 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 4664880 MIST                                                                   │
│    Non-refundable Storage Fee: 47120 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2mMRhWh3bqhZUg6fhA18et5zpg9o2Nni3ZdmrG18fNAW                                                   │
│    7jsc295jz9VHjMF2E2DRzDKRR4YpBETiM2xGMywqJ98e                                                   │
│    7kbxRhtvMwzvTgs3xz5gacbrrQnLfiL18NVbsrmiYTKn                                                   │
│    CXV1YcDXPf6xZD1ezk6z7YFZwdevfZezG8vYuCWGS78Y                                                   │
│    DdWf6vRiaxKkqUeLsh2JbAebfVdF9KZhi5ciEmg5w2qw                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                                                                                                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                                                                                                                                                                        │
│  ┌──                                                                                                                                                                                                                                                                                    │
│  │ ObjectID: 0x6c76602e0fc44e5b617c75d6c82f14abbb37c3881d40c6224f7b4ccc11fa7347                                                                                                                                                                                                         │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                           │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                        │
│  │ ObjectType: 0x2::coin::Coin<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN>                                                                                                                                                            │
│  │ Version: 79749919                                                                                                                                                                                                                                                                    │
│  │ Digest: 3kWaNvdPDpeLqQNdxmcP4SExKmiQhVpDa81exSUzTW97                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                    │
│  ┌──                                                                                                                                                                                                                                                                                    │
│  │ ObjectID: 0xdfc1801349f2a088fe8bc97c0692ce938b910836b3f09512c8dcb6d7c154defb                                                                                                                                                                                                         │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                           │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                        │
│  │ ObjectType: 0x2::coin::Coin<0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>                                                                                                                                                                    │
│  │ Version: 79749919                                                                                                                                                                                                                                                                    │
│  │ Digest: DFvNG4rtRvJR983HPEiWLH4Z2nwrRJ9tZFC3KovDdxcm                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                    │
│ Mutated Objects:                                                                                                                                                                                                                                                                        │
│  ┌──                                                                                                                                                                                                                                                                                    │
│  │ ObjectID: 0x3b89a2205776ffe72dc358319ccd13964f4fefcf4d2bfacbf12fa8842f85664d                                                                                                                                                                                                         │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                           │
│  │ Owner: Shared                                                                                                                                                                                                                                                                        │
│  │ ObjectType: 0x24193f5dc9d23a8780fbf0ac1e52970e4b24487f9029a42c95094cbf5aa23524::liquidity::Pool<0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN, 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN>  │
│  │ Version: 79749919                                                                                                                                                                                                                                                                    │
│  │ Digest: VZLvH9j8LcjZSv8pvYZraQ2MM2cjAiDqYYMRfa1GShv                                                                                                                                                                                                                                  │
│  └──                                                                                                                                                                                                                                                                                    │
│  ┌──                                                                                                                                                                                                                                                                                    │
│  │ ObjectID: 0x86454c0211c70e704fcf3e7ceff7ef851db071423fb0b030f36eae3ade7b9264                                                                                                                                                                                                         │
│  │ Sender: 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85                                                                                                                                                                                                           │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )                                                                                                                                                                                        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                                                                                                                                                                           │
│  │ Version: 79749919                                                                                                                                                                                                                                                                    │
│  │ Digest: 8h95YhDETCxpVzaMX5X1KWpvKE9XUKamAkuTFFgBhhvj                                                                                                                                                                                                                                 │
│  └──                                                                                                                                                                                                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2165120                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )           │
│  │ CoinType: 0x4091e22b4e053b0afa0e8d3f2624d728d197301de74048cf3c05819390b465e7::my_coin::MY_COIN          │
│  │ Amount: 3154                                                                                            │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0x4a33321c0a11023bfe676f26f0e6a0cabdf6e430bb5130da2c5d4ee314e53b85 )           │
│  │ CoinType: 0x65d0f0d0d42953e75a054290ebb86ce4233868b1ebebcdae1cf258aa1ca437c1::faucet_coin::FAUCET_COIN  │
│  │ Amount: -3154                                                                                           │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```