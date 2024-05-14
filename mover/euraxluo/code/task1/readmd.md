task1:
```
@Euraxluo ➜ .../mover/euraxluo/code/task1 (main) $ ./publish.sh 
[warn] Client/Server api version mismatch, client api version : 1.23.0, server api version : 1.23.1
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: 6WYDW7dtDrA4qiKFBHF5mH3aNGJfixb9FXMTzKhMYEWj
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                   │
│ Gas Owner: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0458d947d92b806c1a709e8293e6260079b43570aa92d74268eaf8aa20f6a564                                    │
│  │ Version: 21397269                                                                                         │
│  │ Digest: DF9bfcTWv6WoHX6HQXMbRFgVte6aus4qrmC2Mpwc9BaC                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3" │ │
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
│    T6n+SPGZ/jWKP0cUWDe8pva7tuPpF3yUx9CQyj9gdE+RDXJqBTS7mUj1w5aGTykgQSyKvhs5lVRJ3E8Yf2dkAg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 6WYDW7dtDrA4qiKFBHF5mH3aNGJfixb9FXMTzKhMYEWj                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 351                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x63ce69a1603c8cfc79f8283fd23977c16ad57d7bb0dad8c64e0ba02fb556e22b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7uX7YRAv7uco8gLBK2mKh5jjEvFai47rjPPgNtwkJCb8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe8e733d0d50653b8baa30bc60b957885e796b4799784e5f6b642dd410b0c15f3                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 21397270                                                                              │
│  │ Digest: DczMLdXsb84RNMYCxH1HBx5pEJBrSe9tfd2VW1ie23kk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0458d947d92b806c1a709e8293e6260079b43570aa92d74268eaf8aa20f6a564                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 21397270                                                                              │
│  │ Digest: DxAM5fBH22vKYa4fThxv2c2fKu2KwaiRit2jE2UgpxRB                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0458d947d92b806c1a709e8293e6260079b43570aa92d74268eaf8aa20f6a564                         │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ Version: 21397270                                                                              │
│  │ Digest: DxAM5fBH22vKYa4fThxv2c2fKu2KwaiRit2jE2UgpxRB                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 9241600 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    EMqM6QGKX2GQothf6i2xrWfbAL9xsWxjeqhVn4irAaHB                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xe8e733d0d50653b8baa30bc60b957885e796b4799784e5f6b642dd410b0c15f3                  │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                    │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 21397270                                                                             │
│  │ Digest: DczMLdXsb84RNMYCxH1HBx5pEJBrSe9tfd2VW1ie23kk                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0458d947d92b806c1a709e8293e6260079b43570aa92d74268eaf8aa20f6a564                  │
│  │ Sender: 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3                    │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 21397270                                                                             │
│  │ Digest: DxAM5fBH22vKYa4fThxv2c2fKu2KwaiRit2jE2UgpxRB                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x63ce69a1603c8cfc79f8283fd23977c16ad57d7bb0dad8c64e0ba02fb556e22b                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 7uX7YRAv7uco8gLBK2mKh5jjEvFai47rjPPgNtwkJCb8                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xe5a5e2cf8b4971224a07068cc9ffe410d4a0ab7382fec79fb035e929951a39f3 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -9263480                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

PackageID:
0x63ce69a1603c8cfc79f8283fd23977c16ad57d7bb0dad8c64e0ba02fb556e22b

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

@Euraxluo ➜ .../mover/euraxluo/code/task1 (main) $ 
```