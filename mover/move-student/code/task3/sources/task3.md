# task 3
上链网络: 主网(mainnet)
完成 NFT相关知识的学习
完成可以mint NFT的合约上链
给自己地址mint一个NFT
NFT必须是自己 github 的头像作为图片
mint 一个 nft 发送到地址: 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2


build：
```bash
❯ sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
```

发布合约：
```bash
❯ sui client publish --gas-budget 500000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task3
Successfully verified dependencies on-chain against source.
Transaction Digest: EYQ3axkAAeyk1EKqRp73NZS433etjfN8Ng6gk18t8ZJs
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                   │
│ Gas Owner: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                    │
│  │ Version: 94426591                                                                                         │
│  │ Digest: 9r6CVqCCfMuFnJVeKkN2Mu563i2KNuA8aJqMTkp8rgCZ                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251" │ │
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
│    OqOLSljr5hHSOCrMIzDWr+YuMAqTS4+Be9zfYC3+03wwlwvU9RzHvnu8HWRXEXqqotA/Iq0uFtPZ/bSPuwc0Bw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EYQ3axkAAeyk1EKqRp73NZS433etjfN8Ng6gk18t8ZJs                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 375                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb66a82f8cd7155abf3c16f4db2e09d699eb4300d25fd1c6df4a64505c1e1fa2a                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426592                                                                              │
│  │ Digest: E2ipPw6GMVrjMEEfjiZp5ZdPbBejuwcfy24pizniQwty                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: D61i4csvyYzgYZWaTMUkJsqyQfHmqH13Rd4XcRWSubVR                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426592                                                                              │
│  │ Digest: AH61kr8hXByPq2GLVEzfj4Vp124NYV8L3j6auMC3Jpko                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426592                                                                              │
│  │ Digest: AH61kr8hXByPq2GLVEzfj4Vp124NYV8L3j6auMC3Jpko                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10016800 MIST                                                                    │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6psMjdwU5c2UVjphSHsSX5HmMDqPqyKFCUevGimZvtxN                                                   │
│    9PVAAKAumVyLKhc5apFaGmbq4pC2qjgdTLcxxxQ7BTEu                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb66a82f8cd7155abf3c16f4db2e09d699eb4300d25fd1c6df4a64505c1e1fa2a                  │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                    │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 94426592                                                                             │
│  │ Digest: E2ipPw6GMVrjMEEfjiZp5ZdPbBejuwcfy24pizniQwty                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                  │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                    │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 94426592                                                                             │
│  │ Digest: AH61kr8hXByPq2GLVEzfj4Vp124NYV8L3j6auMC3Jpko                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93                 │
│  │ Version: 1                                                                                    │
│  │ Digest: D61i4csvyYzgYZWaTMUkJsqyQfHmqH13Rd4XcRWSubVR                                          │
│  │ Modules: movestuduentnft                                                                      │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9788680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

mint
```bash
❯ sui client call --package 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93 --module movestuduentnft --function mint --args "uvd1000" "Test" "https://www.duitang.com/blog/?id=1458729927" --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: EterUDigJAxhBc8MRcQfjGfQ24QGiaKkD227sQ9SDXjr
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                  │
│ Gas Owner: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251               │
│ Gas Budget: 50000000 MIST                                                                   │
│ Gas Price: 750 MIST                                                                         │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                   │
│  │ Version: 94426592                                                                        │
│  │ Digest: AH61kr8hXByPq2GLVEzfj4Vp124NYV8L3j6auMC3Jpko                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│ ╭──────────────────────────────────────────────────────────────────────────────────────╮    │
│ │ Input Objects                                                                        │    │
│ ├──────────────────────────────────────────────────────────────────────────────────────┤    │
│ │ 0   Pure Arg: Type: vector<u8>, Value: "uvd1000"                                     │    │
│ │ 1   Pure Arg: Type: vector<u8>, Value: "Test"                                        │    │
│ │ 2   Pure Arg: Type: vector<u8>, Value: "https://www.duitang.com/blog/?id=1458729927" │    │
│ ╰──────────────────────────────────────────────────────────────────────────────────────╯    │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    movestuduentnft                                                    │        │
│ │  │ Package:   0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93 │        │
│ │  │ Arguments:                                                                    │        │
│ │  │   Input  0                                                                    │        │
│ │  │   Input  1                                                                    │        │
│ │  │   Input  2                                                                    │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    tr85+16Vt08PHRqDneq1yCSx38DedZ3r/z4XJYodqp42xSx15LG3JQL1PfPulecpVcmN6HOpEuIAVtRZ4j5YBg== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EterUDigJAxhBc8MRcQfjGfQ24QGiaKkD227sQ9SDXjr                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 375                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426593                                                                              │
│  │ Digest: HWthrYh4uYuGEWapXinivBwGkpHVhx1b9zLJny42kYUr                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426593                                                                              │
│  │ Digest: 3oc161gzqxnFtpX8497ADQ1jZr4jycoxjPVhVrqoard5                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426593                                                                              │
│  │ Digest: 3oc161gzqxnFtpX8497ADQ1jZr4jycoxjPVhVrqoard5                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2834800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EYQ3axkAAeyk1EKqRp73NZS433etjfN8Ng6gk18t8ZJs                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                       │
│  │ EventID: EterUDigJAxhBc8MRcQfjGfQ24QGiaKkD227sQ9SDXjr:0                                                 │
│  │ PackageID: 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93                           │
│  │ Transaction Module: movestuduentnft                                                                     │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                              │
│  │ EventType: 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93::movestuduentnft::NFTMint │
│  │ ParsedJSON:                                                                                             │
│  │   ┌───────────┬────────────────────────────────────────────────────────────────────┐                    │
│  │   │ creater   │ 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 │                    │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                    │
│  │   │ name      │ uvd1000                                                            │                    │
│  │   ├───────────┼────────────────────────────────────────────────────────────────────┤                    │
│  │   │ object_id │ 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9 │                    │
│  │   └───────────┴────────────────────────────────────────────────────────────────────┘                    │
│  └──                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9                                     │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                       │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                    │
│  │ ObjectType: 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93::movestuduentnft::MoveStudentNFT  │
│  │ Version: 94426593                                                                                                │
│  │ Digest: HWthrYh4uYuGEWapXinivBwGkpHVhx1b9zLJny42kYUr                                                             │
│  └──                                                                                                                │
│ Mutated Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                     │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                       │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                       │
│  │ Version: 94426593                                                                                                │
│  │ Digest: 3oc161gzqxnFtpX8497ADQ1jZr4jycoxjPVhVrqoard5                                                             │
│  └──                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2606680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```



transfer
```bash
❯ sui client call --package 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93 --module movestuduentnft --function transfer --args 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.22.0
Transaction Digest: 55MqrJca88d3bWdkcZVtRvAhbKf3KHAXK19uWdTFvL4h
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                   │
│ Gas Owner: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 750 MIST                                                                                          │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                    │
│  │ Version: 94426593                                                                                         │
│  │ Digest: 3oc161gzqxnFtpX8497ADQ1jZr4jycoxjPVhVrqoard5                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9              │ │
│ │ 1   Pure Arg: Type: address, Value: "0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  transfer                                                           │                         │
│ │  │ Module:    movestuduentnft                                                    │                         │
│ │  │ Package:   0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    c3kxFSaQ0Z5rSlD52rFV/GzpS2b0csOuU8MwEPN+c3VrtuLEiDWzTsD8tr7tKzcY3Ot317Sj82pbqHrTj6laDg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 55MqrJca88d3bWdkcZVtRvAhbKf3KHAXK19uWdTFvL4h                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 375                                                                               │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9                         │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )  │
│  │ Version: 94426594                                                                              │
│  │ Digest: 8b8PFxmTiLbr5VxG3b7SFtWQ7Ac53GPQeVFvy2FRPvW                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426594                                                                              │
│  │ Digest: 8gxroTYncFf7q9PXTBKoPqEVeaDEVeL9Ua3zm1zWimXY                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                         │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ Version: 94426594                                                                              │
│  │ Digest: 8gxroTYncFf7q9PXTBKoPqEVeaDEVeL9Ua3zm1zWimXY                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2834800 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 2806452 MIST                                                                   │
│    Non-refundable Storage Fee: 28348 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    EYQ3axkAAeyk1EKqRp73NZS433etjfN8Ng6gk18t8ZJs                                                   │
│    EterUDigJAxhBc8MRcQfjGfQ24QGiaKkD227sQ9SDXjr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                      │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Mutated Objects:                                                                                                    │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x4bb2e0027999b72a78dce8762e90f86195b7dee40e3067247ad44c7cd88a61a9                                     │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                       │
│  │ Owner: Account Address ( 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 )                    │
│  │ ObjectType: 0xbbcca976dda3a2474d30fc57be0fef14a00fee4891246ad79d0db77063d7ce93::movestuduentnft::MoveStudentNFT  │
│  │ Version: 94426594                                                                                                │
│  │ Digest: 8b8PFxmTiLbr5VxG3b7SFtWQ7Ac53GPQeVFvy2FRPvW                                                              │
│  └──                                                                                                                │
│  ┌──                                                                                                                │
│  │ ObjectID: 0x5b3362414da35e3486eae135ce96836a0584c0c24d23d4fc88b3c158f0613fba                                     │
│  │ Sender: 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251                                       │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )                    │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                       │
│  │ Version: 94426594                                                                                                │
│  │ Digest: 8gxroTYncFf7q9PXTBKoPqEVeaDEVeL9Ua3zm1zWimXY                                                             │
│  └──                                                                                                                │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x1592241ffbb4fd58ce33ce592d1b5c7bc9308f4cf96fde5b24fb4c6de1b51251 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -778348                                                                                │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
