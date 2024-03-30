### Task2

```bash
> sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
```

```bash
sui client publish --gas-budget 50000000 --skip-dependency-verification

UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task2
Skipping dependency verification
Transaction Digest: 7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 848                                                                                              │
│  │ Digest: 83HYmk3XJHtJjBKCikWZADLHXRDMgLTfATYFGkkx98Pq                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
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
│    3FARYizr+U+i7SrPFVXtb8Nvsg9b7AKXERoy4HnV8tlcYZk9gwt8xI2KsNrCo+cyf0JAkx+FWb+3ONwz4fa2Aw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 922                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x02802a20b130053250ea6686721e108b19e3eb3e00c1078c0d04cce7a504abfd                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 849                                                                                   │
│  │ Digest: FfSXknMiLmvrvuWg58QjCAxFVQf4tuyziFbwPxwbmyG4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 849                                                                                   │
│  │ Digest: ChLAfpsjdqgGbmT6LdkkjsfkPF4uR1zPYL749LUEuGqA                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x93165a97c4c31127c3fc6787c0277b26e50c5802ebc57346d612c23922620f3f                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 849                                                                                   │
│  │ Digest: 9q4GsirUc3Nb3Nd4xQomdk6Q6LoeRv2jJYxM5TuYKVkJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: C8NQJ1876sN1x6AJUxuNHzRJs5YQZbjFAGVMPNutqPX8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xedf85f5e8c1dabdc44a749ed48b24d36d787982dcb89eefa9d1594cfa3533be7                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 849                                                                                   │
│  │ Digest: C2CjERLy774UngfQPrVcgLjb7NtkozZhYJP68HMD9rPg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xef23e9514b1896d3814ce358438b29d4ad585bd7d9fcfd21d8344b4af90063de                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 849                                                                                   │
│  │ Digest: 9CX65igZgfmZXzuLmj2PU6x5Vng5kZwjE5JMC2F5pGzT                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 849                                                                                   │
│  │ Digest: 57sNcxmr3hhXpK8BA1YPbFwNjXcw954KdwwnNxKJKbYJ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 849                                                                                   │
│  │ Digest: 57sNcxmr3hhXpK8BA1YPbFwNjXcw954KdwwnNxKJKbYJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 23271200 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6JaoAJTHmsLTeSTBTqZB5GomHx65Fh3CvMz6bPB18Sre                                                   │
│    7Ukrc5GqdFqTA41wvWgreCdHn2vRLfgQ3YMFkdks72Vk                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x02802a20b130053250ea6686721e108b19e3eb3e00c1078c0d04cce7a504abfd                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>  │
│  │ Version: 849                                                                                                                       │
│  │ Digest: FfSXknMiLmvrvuWg58QjCAxFVQf4tuyziFbwPxwbmyG4                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>   │
│  │ Version: 849                                                                                                                       │
│  │ Digest: ChLAfpsjdqgGbmT6LdkkjsfkPF4uR1zPYL749LUEuGqA                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x93165a97c4c31127c3fc6787c0277b26e50c5802ebc57346d612c23922620f3f                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                                               │
│  │ Version: 849                                                                                                                       │
│  │ Digest: 9q4GsirUc3Nb3Nd4xQomdk6Q6LoeRv2jJYxM5TuYKVkJ                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xedf85f5e8c1dabdc44a749ed48b24d36d787982dcb89eefa9d1594cfa3533be7                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN>             │
│  │ Version: 849                                                                                                                       │
│  │ Digest: C2CjERLy774UngfQPrVcgLjb7NtkozZhYJP68HMD9rPg                                                                               │
│  └──                                                                                                                                  │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0xef23e9514b1896d3814ce358438b29d4ad585bd7d9fcfd21d8344b4af90063de                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Immutable                                                                                                                   │
│  │ ObjectType: 0x2::coin::CoinMetadata<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::mycoin::MYCOIN>            │
│  │ Version: 849                                                                                                                       │
│  │ Digest: 9CX65igZgfmZXzuLmj2PU6x5Vng5kZwjE5JMC2F5pGzT                                                                               │
│  └──                                                                                                                                  │
│ Mutated Objects:                                                                                                                      │
│  ┌──                                                                                                                                  │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                                       │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                         │
│  │ Version: 849                                                                                                                       │
│  │ Digest: 57sNcxmr3hhXpK8BA1YPbFwNjXcw954KdwwnNxKJKbYJ                                                                               │
│  └──                                                                                                                                  │
│ Published Objects:                                                                                                                    │
│  ┌──                                                                                                                                  │
│  │ PackageID: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800                                                      │
│  │ Version: 1                                                                                                                         │
│  │ Digest: C8NQJ1876sN1x6AJUxuNHzRJs5YQZbjFAGVMPNutqPX8                                                                               │
│  │ Modules: faucet_coin, mycoin                                                                                                       │
│  └──                                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -23293080                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```


```bash
sui client call --function mint --module faucet_coin --package 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800 --gas-budget 5000000 --args 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406 100 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc 

[warn] Client/Server api version mismatch, client api version : 1.21.1, server api version : 1.22.0
Transaction Digest: 26TT2y5nSH2ywLvcx7DaRjapjVuCJda9mrxUmEYPcSxr
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                   │
│ Gas Owner: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                │
│ Gas Budget: 5000000 MIST                                                                                     │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                    │
│  │ Version: 851                                                                                              │
│  │ Digest: CmbaMEJkuLfSdZ6D31fYB6TN2TKQJJPaM5ihp35tK54K                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100"                                                                    │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    faucet_coin                                                        │                         │
│ │  │ Package:   0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    GGMPU+WvKLqM+hKVuolTkR0GAvwEyB89/7ROclIQFhGOO359aoEtsVDvWNMJoAGq9QT5ltaQbhWgAw5oACJmDA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 26TT2y5nSH2ywLvcx7DaRjapjVuCJda9mrxUmEYPcSxr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 924                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xae13e1c8e2fa65bccfba044bf8ad20cc4afb26eb97d1ba04776bbfe295d08c86                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 852                                                                                   │
│  │ Digest: BB8zfYdeEk4GvjhhTbXdPGzheuUpWmuK7ZSm8ypQ4foV                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 852                                                                                   │
│  │ Digest: Dur1TRbJzJFmnMWLWDBrRJwa9JxNSRsTxXzD6yyW3pRJ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 852                                                                                   │
│  │ Digest: D9hjvt2yCnpd7gdbvKuHaoKKxsB2MGUVJ85hTpCpKPrd                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                         │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )  │
│  │ Version: 852                                                                                   │
│  │ Digest: Dur1TRbJzJFmnMWLWDBrRJwa9JxNSRsTxXzD6yyW3pRJ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4225600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2768832 MIST                                                                   │
│    Non-refundable Storage Fee: 27968 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2hpGejGPMiDcJrcXf7jYXxPGPaREz1SffwocH6xJRPuL                                                   │
│    7MtFCeMjSMmJTfgGE7m6FtC5WffVDJjHcez9cfGJrFQx                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                       │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0xae13e1c8e2fa65bccfba044bf8ad20cc4afb26eb97d1ba04776bbfe295d08c86                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>         │
│  │ Version: 852                                                                                                                      │
│  │ Digest: BB8zfYdeEk4GvjhhTbXdPGzheuUpWmuK7ZSm8ypQ4foV                                                                              │
│  └──                                                                                                                                 │
│ Mutated Objects:                                                                                                                     │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x2a70f890e7b10ac51af75dc77bc8721c9d9446dc62cfc31534b12bdb9b4d5862                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                        │
│  │ Version: 852                                                                                                                      │
│  │ Digest: Dur1TRbJzJFmnMWLWDBrRJwa9JxNSRsTxXzD6yyW3pRJ                                                                              │
│  └──                                                                                                                                 │
│  ┌──                                                                                                                                 │
│  │ ObjectID: 0x41ca5ea5e5ca29d834ecad38e3655ef9d03f3dfbb459acf15cc1cad54363b406                                                      │
│  │ Sender: 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc                                                        │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )                                     │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN>  │
│  │ Version: 852                                                                                                                      │
│  │ Digest: D9hjvt2yCnpd7gdbvKuHaoKKxsB2MGUVJ85hTpCpKPrd                                                                              │
│  └──                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                            │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0x2::sui::SUI                                                                                 │
│  │ Amount: -2456768                                                                                        │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ Owner: Account Address ( 0xdb5265b6807b97c15a80059c8df5f8e9287c2c3ec7354cac2a95d3968b4f85cc )           │
│  │ CoinType: 0xc846b5c2ecd10aaf62f645e1c6f4bd2718c8782378a0059893cc6bb7f9d8e800::faucet_coin::FAUCET_COIN  │
│  │ Amount: 100                                                                                             │
│  └──                                                                                                       │
```
