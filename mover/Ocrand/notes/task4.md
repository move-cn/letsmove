## task4 经典刮刮卡游戏

```
packedid = 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5
```

创建刮刮卡

#### 查看轮次

```json
curl -s https://drand.cloudflare.com/52db9ba70e0cc0f6eaf7803dd07447a1f5477735fd3f661792ba94600c84e971/public/1 | jq
{
  "round": 1,
  "randomness": "1466a6cd24e327188770752f6134001c64d6efcc590ccc26b721611ad96f165a",
  "signature": "b55e7cb2d5c613ee0b2e28d6750aabbb78c39dcc96bd9d38c2c2e12198df95571de8e8e402a0cc48871c7089a2b3af4b"
}

BASE_ROUND=1
```

```bash
sui client call --function create --package 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5 --module game --args 0x248049038736ec90161371d713987dfc5bf4fcc908e326cca6b1859ce376c30a 1 1 --gas-budget 10000000
```

```
Transaction Digest: 7roqMi69iAN1dcKWiUcmkzBUZUEujDNwmEcqKFmxcNbW
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                      │
│ Gas Owner: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                   │
│ Gas Budget: 10000000 MIST                                                                       │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xb7482b234507637becdac6d8566e2608472ce4466d20c12eb88b0b3e28e0062d                       │
│  │ Version: 87889657                                                                            │
│  │ Digest: 5PdBK2UBSLWmu9rBnrc9LBTrHzCL8Mi41QJUoXNKd1vG                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x03925e7ab2c94e2129c9eda125379bae362a8fb9c7de14babe45b1bd3c5f5604 │ │
│ │ 1   Pure Arg: Type: u64, Value: "1"                                                         │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  create                                                             │            │
│ │  │ Module:    game                                                               │            │
│ │  │ Package:   0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    IqyAe02pgWAc5by42zX4tfJHtfJJAesIF8hlCTXXojXCRnRphBAmHgXHdRw7OK+n5Qvtc2WCH2uREwrwFxshDg==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7roqMi69iAN1dcKWiUcmkzBUZUEujDNwmEcqKFmxcNbW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x248049038736ec90161371d713987dfc5bf4fcc908e326cca6b1859ce376c30a                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 87889658                                                                              │
│  │ Digest: EqD44Kmmi3CZWLJXk69TYX5Nw4vwe89QGVdMdaJ7ueKV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xce5a800a9e1a66f105435e3c6e4c0bc1aa6f9532dc405ecb0125877b4e716d15                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 87889658                                                                              │
│  │ Digest: Czo7nYRNnT5w4WdGbBfNfXiguzrfGRuh36PJQ2ckXP8E                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb7482b234507637becdac6d8566e2608472ce4466d20c12eb88b0b3e28e0062d                         │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ Version: 87889658                                                                              │
│  │ Digest: 9Lht8UfFxqUzb7Pjux5nAkMuYKcgbQ6wMStErdzsf6C8                                           │
│  └──                                                                                              │
│ Deleted Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x03925e7ab2c94e2129c9eda125379bae362a8fb9c7de14babe45b1bd3c5f5604                         │
│  │ Version: 87889658                                                                              │
│  │ Digest: 7gyGAp71YXQRoxmFBaHxofQXAipvgHyBKPyxmdSJxyvz                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xb7482b234507637becdac6d8566e2608472ce4466d20c12eb88b0b3e28e0062d                         │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ Version: 87889658                                                                              │
│  │ Digest: 9Lht8UfFxqUzb7Pjux5nAkMuYKcgbQ6wMStErdzsf6C8                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4301600 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 1956240 MIST                                                                   │
│    Non-refundable Storage Fee: 19760 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    95cYuv3XAtfRLcJXEX1QL5v5sq6qG7meWS2xfbdviB7h                                                   │
│    E6omeVcmF14PXn6RXTXKwTgGMoJNtzH2jSzKkbuGdui9                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x248049038736ec90161371d713987dfc5bf4fcc908e326cca6b1859ce376c30a                  │
│  │ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                    │
│  │ Owner: Immutable                                                                              │
│  │ ObjectType: 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5::game::Game    │
│  │ Version: 87889658                                                                             │
│  │ Digest: EqD44Kmmi3CZWLJXk69TYX5Nw4vwe89QGVdMdaJ7ueKV                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xce5a800a9e1a66f105435e3c6e4c0bc1aa6f9532dc405ecb0125877b4e716d15                  │
│  │ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                    │
│  │ Owner: Shared                                                                                 │
│  │ ObjectType: 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5::game::Reward  │
│  │ Version: 87889658                                                                             │
│  │ Digest: Czo7nYRNnT5w4WdGbBfNfXiguzrfGRuh36PJQ2ckXP8E                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xb7482b234507637becdac6d8566e2608472ce4466d20c12eb88b0b3e28e0062d                  │
│  │ Sender: 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4                    │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 87889658                                                                             │
│  │ Digest: 9Lht8UfFxqUzb7Pjux5nAkMuYKcgbQ6wMStErdzsf6C8                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1006734145                                                                            │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

切换账号可以通过split命令准备好购买刮刮卡所需的代币数量：

```bash
sui client split-coin --coin-id $COIN --amounts 50 --gas-budget 10000000
```

购买一张卡

```bash
sui client call --function buy_ticket --package 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5 --module game --args 0x5e797841c0e16ec82a4e3037e7eadb05c98a0a927828a6330601a29f2be5d4af 0x248049038736ec90161371d713987dfc5bf4fcc908e326cca6b1859ce376c30a --gas-budget 5000000
```

购买成功

```
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e                      │
│ Gas Owner: 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e                   │
│ Gas Budget: 5000000 MIST                                                                        │
│ Gas Price: 750 MIST                                                                             │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0xe5f984b1bbdec5b375bcf063ddeeaeebc2fb1024ce0f997e797e43003a0da17d                       │
│  │ Version: 87889669                                                                            │
│  │ Digest: DtakNd8yZVT61zygNZsnP6QXSDq4vu8MWQbB2LqUkqsd                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x5e797841c0e16ec82a4e3037e7eadb05c98a0a927828a6330601a29f2be5d4af │ │
│ │ 1   Imm/Owned Object ID: 0x248049038736ec90161371d713987dfc5bf4fcc908e326cca6b1859ce376c30a │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  buy_ticket                                                         │            │
│ │  │ Module:    game                                                               │            │
│ │  │ Package:   0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5 │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    BlgJ0LPAo1+OnRCFG1HiuvDFAlKufuBtUKd5KjHE0lrfDeEaAmIT9+M0WoV4mubwxuAEj3ziSPN0bZZUJC87DQ==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4CwfmvnmU324BC4uxt1SJDo3trMNEoybSi7mpM26wSWU                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 363                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x68df5fcd33b7301574c1db0bedbafbaeb82d5cec17b54a42d5f97974f55c9b13                         │
│  │ Owner: Account Address ( 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e )  │
│  │ Version: 87889670                                                                              │
│  │ Digest: 2W1En3FQmwsVy682iybdkdSMEAkz9WEw89fFThsoYrnB                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x5e797841c0e16ec82a4e3037e7eadb05c98a0a927828a6330601a29f2be5d4af                         │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ Version: 87889670                                                                              │
│  │ Digest: 7iUvbyjwSLtLgKQrfxQUjimrhBHV1CB8MmBiXy7To6bw                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe5f984b1bbdec5b375bcf063ddeeaeebc2fb1024ce0f997e797e43003a0da17d                         │
│  │ Owner: Account Address ( 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e )  │
│  │ Version: 87889670                                                                              │
│  │ Digest: 3pJCxVyLpigbniqLEvSGJpqYdmbn3kg3WxPKquMkFJkL                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xe5f984b1bbdec5b375bcf063ddeeaeebc2fb1024ce0f997e797e43003a0da17d                         │
│  │ Owner: Account Address ( 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e )  │
│  │ Version: 87889670                                                                              │
│  │ Digest: 3pJCxVyLpigbniqLEvSGJpqYdmbn3kg3WxPKquMkFJkL                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 3488400 MIST                                                                     │
│    Computation Cost: 750000 MIST                                                                  │
│    Storage Rebate: 1956240 MIST                                                                   │
│    Non-refundable Storage Fee: 19760 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7roqMi69iAN1dcKWiUcmkzBUZUEujDNwmEcqKFmxcNbW                                                   │
│    95cYuv3XAtfRLcJXEX1QL5v5sq6qG7meWS2xfbdviB7h                                                   │
│    Gj3u92p7Qd19bxnNWx9oMuEmdhidiQQUpoopKbcrFgAH                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x68df5fcd33b7301574c1db0bedbafbaeb82d5cec17b54a42d5f97974f55c9b13                  │
│  │ Sender: 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e                    │
│  │ Owner: Account Address ( 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e ) │
│  │ ObjectType: 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5::game::Ticket  │
│  │ Version: 87889670                                                                             │
│  │ Digest: 2W1En3FQmwsVy682iybdkdSMEAkz9WEw89fFThsoYrnB                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x5e797841c0e16ec82a4e3037e7eadb05c98a0a927828a6330601a29f2be5d4af                  │
│  │ Sender: 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e                    │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 87889670                                                                             │
│  │ Digest: 7iUvbyjwSLtLgKQrfxQUjimrhBHV1CB8MmBiXy7To6bw                                          │
│  └──                                                                                             │
│  ┌──                                                                                             │
│  │ ObjectID: 0xe5f984b1bbdec5b375bcf063ddeeaeebc2fb1024ce0f997e797e43003a0da17d                  │
│  │ Sender: 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e                    │
│  │ Owner: Account Address ( 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 87889670                                                                             │
│  │ Digest: 3pJCxVyLpigbniqLEvSGJpqYdmbn3kg3WxPKquMkFJkL                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x86feaea1a42cb6359009c5a78bdcc52c53223adb92b965818a524d434b111d3e )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -1005920945                                                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xa623659bc73a8653f2d613e8302a8ffcd87fe7d04bbe6a32dda0258c3000f8e4 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: 1003638785                                                                             │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

查看刮刮卡

```
sui client object 0x5e797841c0e16ec82a4e3037e7eadb05c98a0a927828a6330601a29f2be5d4af
```

![image-20240410170437132](C:\Users\10545\AppData\Roaming\Typora\typora-user-images\image-20240410170437132.png)

刮奖

```bash
sui client call --function evaluate --package 0x21408556c892d8b927bf7e7dcbd7cf61c070bb1043b330ce83267669ad8840f5 --module game --args 0x5e797841c0e16ec82a4e3037e7eadb05c98a0a927828a6330601a29f2be5d4af 0x248049038736ec90161371d713987dfc5bf4fcc908e326cca6b1859ce376c30a 0xb55e7cb2d5c613ee0b2e28d6750aabbb78c39dcc96bd9d38c2c2e12198df95571de8e8e402a0cc48871c7089a2b3af4b --gas-budget 1000000
```

