sui client publish --gas-budget 1000000000                             
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
Successfully verified dependencies on-chain against source.
Transaction Digest: E3WK5LzrmwiCmzByuJeuVcN8mXxVogi9h58tVM8yXQTx
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                   │
│ Gas Owner: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                                │
│ Gas Budget: 1000000000 MIST                                                                                  │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0288d67ab9003f18e1d3c2dda157624c6deeabb0d5f985e2f1f4143f3de9b74d                                    │
│  │ Version: 206232427                                                                                        │
│  │ Digest: 2UKqTxGnJFxdRhgUtMQmkocgCx7qy5VVwRyygrnBxcuN                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc" │ │
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
│    vT9gbu4egUCRFx1+c8m/8DICi+MLzH+Gsw0mVQCeCk/BWjl6o82Erk3XWAClyn3cANb9TnoHY940ybC+PYcmBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: E3WK5LzrmwiCmzByuJeuVcN8mXxVogi9h58tVM8yXQTx                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 545                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x542a0667adeade3a3e5304eba10c3d0ce19762107debd8c6f8a6a781d1a9c666                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 206232428                                                                             │
│  │ Digest: DD1B8ixn1Nn9mzhQnSSqzm6arwGrVdy5Sd4dRj149Mjx                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x589d1edc3897d5650ebe0fed42f96142c99093c4f68d6b06f8ce5ae95be5e72b                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 206232428                                                                             │
│  │ Digest: Cwt6koDNp3j4hWzq1J6q4VVnHkLzWPzVgFKAJVmVDE2R                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x649f4acee5d47ea606010f23b0f094512c829124104abd9f0fe751cf3c57ddb4                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Ggyvnt1UA8ff6ThyQ65RL8anzhmDsKeZo6hwSSbKAKtU                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0288d67ab9003f18e1d3c2dda157624c6deeabb0d5f985e2f1f4143f3de9b74d                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 206232428                                                                             │
│  │ Digest: Ekf6th5YsfdgW2voiSASLDFr897he51nKK2WubBqt8Cw                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0288d67ab9003f18e1d3c2dda157624c6deeabb0d5f985e2f1f4143f3de9b74d                         │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ Version: 206232428                                                                             │
│  │ Digest: Ekf6th5YsfdgW2voiSASLDFr897he51nKK2WubBqt8Cw                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8816000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2VBiXoKJAfDeVgi8ntkra1wDszKN2diDdp8u1UiqM3i2                                                   │
│    3RoxMpKxiw1uP5Xa9cKhkbDfdJ1ULK1PR73FcjVR2bcc                                                   │
│    EFBpqYLusT6HSt1SmtemgaNjdtgFwB2RhaduRGQiiB5D                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x542a0667adeade3a3e5304eba10c3d0ce19762107debd8c6f8a6a781d1a9c666                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x649f4acee5d47ea606010f23b0f094512c829124104abd9f0fe751cf3c57ddb4::task1::Hello  │
│  │ Version: 206232428                                                                            │
│  │ Digest: DD1B8ixn1Nn9mzhQnSSqzm6arwGrVdy5Sd4dRj149Mjx                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0x589d1edc3897d5650ebe0fed42f96142c99093c4f68d6b06f8ce5ae95be5e72b                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 206232428                                                                            │
│  │ Digest: Cwt6koDNp3j4hWzq1J6q4VVnHkLzWPzVgFKAJVmVDE2R                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x0288d67ab9003f18e1d3c2dda157624c6deeabb0d5f985e2f1f4143f3de9b74d                  │
│  │ Sender: 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc                    │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 206232428                                                                            │
│  │ Digest: Ekf6th5YsfdgW2voiSASLDFr897he51nKK2WubBqt8Cw                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x649f4acee5d47ea606010f23b0f094512c829124104abd9f0fe751cf3c57ddb4                 │
│  │ Version: 1                                                                                    │
│  │ Digest: Ggyvnt1UA8ff6ThyQ65RL8anzhmDsKeZo6hwSSbKAKtU                                          │
│  │ Modules: task1                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x9f0389fccd23a7a307c9c18bc2b9a1eafd9b3c2d28c26c026781b40602e225dc )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8837880                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
