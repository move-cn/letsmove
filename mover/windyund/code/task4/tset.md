
```shell
package: 0xc653c62991ffb78263bb0b4dc5314e6218bd1dc50b007d837e85a47701ea720f
pool: 0x740ce848cb02cf094cdf6fb322d09e07bc69159e6ccec4a0759c90de41d9ed00


│ Created Objects:                                                                                           │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x740ce848cb02cf094cdf6fb322d09e07bc69159e6ccec4a0759c90de41d9ed00                            │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                              │
│  │ Owner: Shared                                                                                           │
│  │ ObjectType: 0xc653c62991ffb78263bb0b4dc5314e6218bd1dc50b007d837e85a47701ea720f::guess_number::Pool      │
│  │ Version: 30118628                                                                                       │
│  │ Digest: 63KzJGqGB7BCZTHC8c9wid4BNUzCUQnLwjvWupDbCxy1                                                    │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ ObjectID: 0x876223d175a8b13cb4fb097f19c4f57abc1714672a68ce89b07bb5b2f1ad5c8e                            │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                              │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )           │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                    │
│  │ Version: 30118628                                                                                       │
│  │ Digest: EsUM833TrLD4f2LLe22BXzyiLxL9isTpzr63sAcdTd9Q                                                    │
│  └──                                                                                                       │
│  ┌──                                                                                                       │
│  │ ObjectID: 0xba85c35f7348ac1da249c4a35d2dbe903a153db30d066a4df2fc03efe5603187                            │
│  │ Sender: 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c                              │
│  │ Owner: Account Address ( 0xe29fa8db4cb05d9b3b436784f146e1297f65fffdd5f69f7803844a5d81e0850c )           │
│  │ ObjectType: 0xc653c62991ffb78263bb0b4dc5314e6218bd1dc50b007d837e85a47701ea720f::guess_number::AdminCap  │
│  │ Version: 30118628                                                                                       │
│  │ Digest: DKinpQFq9X6thbM4cBw353aAdBMHxNLa1QRnEHzZrNPD   
```



## deposit
```shell
package: 0xc653c62991ffb78263bb0b4dc5314e6218bd1dc50b007d837e85a47701ea720f
pool: 0x740ce848cb02cf094cdf6fb322d09e07bc69159e6ccec4a0759c90de41d9ed00

coin: 0xa4fc7e772481e4ac56b343d6ba460aefd849c1c6d23ca23113f357dc15993bb5

play coin: 0xc5efea045b2a08a16fd4411c39c90da77912a90074f3833a9ab5392fe4c68f3b

sui client call --package 0xc653c62991ffb78263bb0b4dc5314e6218bd1dc50b007d837e85a47701ea720f  \
                --module guess_number  \
                --function depoist  \
                  \
                --args 0x740ce848cb02cf094cdf6fb322d09e07bc69159e6ccec4a0759c90de41d9ed00 0xa4fc7e772481e4ac56b343d6ba460aefd849c1c6d23ca23113f357dc15993bb5
                

```

```shell
# play
sui client call --package  0xc653c62991ffb78263bb0b4dc5314e6218bd1dc50b007d837e85a47701ea720f\
                --module guess_number \
                --function play \
                 \
                --args 0xc5efea045b2a08a16fd4411c39c90da77912a90074f3833a9ab5392fe4c68f3b \
                       0x740ce848cb02cf094cdf6fb322d09e07bc69159e6ccec4a0759c90de41d9ed00 \
                       8 \
                       0x6
```