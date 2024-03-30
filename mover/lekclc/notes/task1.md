## 1 发布
```
sui client publish --gas-budget 20000000 . 
```
## 2 发布后的输出

```
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Transaction Digest: BrmDz3ipzUFux1P7max6Z3Vq9D7AgiSw4BYteb73ASLZ
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                                   │
│ Gas Owner: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                                    │
│  │ Version: 922312                                                                                           │
│  │ Digest: 9Nb8mFQPDDzi29gk8Us9hPREupbMEHRkkEPaJ9TkUBJz                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449" │ │
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
│    8ROpPyBzMy+zWq90ps90O+hFDOQhkqEaVodtFyxQe2vF/af1cLgXlqyrZeluxfTkHCa0s6V68j3x1nadi3B+Cw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: BrmDz3ipzUFux1P7max6Z3Vq9D7AgiSw4BYteb73ASLZ                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 324                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xa36a6d3635718bc974c57934180be5825a7d2592fb395f1a10c5ad29a2771a2e                         │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ Version: 922313                                                                                │
│  │ Digest: 5K4CnnP1KhAoNLWM5CYMNXPh87mxBkMej7wNS5rV8iUq                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd893bb4bbb49fd1326c91addea0833f753fa6c3b11afbc2f7d5794bf7ba43f6f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GdqW1zBSkuBJ1cm6HnxGUtCeVVdaBKfzD9oSSLsjadFk                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                         │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ Version: 922313                                                                                │
│  │ Digest: 9wxJQ5xnNYZdcpD5M13GERCASt8SdmH6KCzLutfCU4UP                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                         │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ Version: 922313                                                                                │
│  │ Digest: 9wxJQ5xnNYZdcpD5M13GERCASt8SdmH6KCzLutfCU4UP                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    6L4UbNFsK1RnL4sr4U3akcKE7zDRgcWkdKpQNY4Fd3f1                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xa36a6d3635718bc974c57934180be5825a7d2592fb395f1a10c5ad29a2771a2e                  │
│  │ Sender: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                    │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 922313                                                                               │
│  │ Digest: 5K4CnnP1KhAoNLWM5CYMNXPh87mxBkMej7wNS5rV8iUq                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                  │
│  │ Sender: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                    │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 922313                                                                               │
│  │ Digest: 9wxJQ5xnNYZdcpD5M13GERCASt8SdmH6KCzLutfCU4UP                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0xd893bb4bbb49fd1326c91addea0833f753fa6c3b11afbc2f7d5794bf7ba43f6f                 │
│  │ Version: 1                                                                                    │
│  │ Digest: GdqW1zBSkuBJ1cm6HnxGUtCeVVdaBKfzD9oSSLsjadFk                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
可以看到 package ID 为 `0xd893bb4bbb49fd1326c91addea0833f753fa6c3b11afbc2f7d5794bf7ba43f6f`

## 3 调用函数
```
public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, tx_context::sender(ctx));
    }
```
使用如下调用
```
sui client call --function mint --module hello_world --package 0xd893bb4bbb49fd1326c91addea0833f753fa6c3b
11afbc2f7d5794bf7ba43f6f --gas-budget 300000000
```
执行正确,生成下列信息
```
Transaction Digest: CtSm9vUuvGT6RiosAzmA2s7QdgLseSJrAd49YnGSmjCa
╭─────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                            │
├─────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                  │
│ Gas Owner: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449               │
│ Gas Budget: 300000000 MIST                                                                  │
│ Gas Price: 1000 MIST                                                                        │
│ Gas Payment:                                                                                │
│  ┌──                                                                                        │
│  │ ID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                   │
│  │ Version: 922313                                                                          │
│  │ Digest: 9wxJQ5xnNYZdcpD5M13GERCASt8SdmH6KCzLutfCU4UP                                     │
│  └──                                                                                        │
│                                                                                             │
│ Transaction Kind: Programmable                                                              │
│   No input objects for this transaction                                                     │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮        │
│ │ Commands                                                                         │        │
│ ├──────────────────────────────────────────────────────────────────────────────────┤        │
│ │ 0  MoveCall:                                                                     │        │
│ │  ┌                                                                               │        │
│ │  │ Function:  mint                                                               │        │
│ │  │ Module:    hello_world                                                        │        │
│ │  │ Package:   0xd893bb4bbb49fd1326c91addea0833f753fa6c3b11afbc2f7d5794bf7ba43f6f │        │
│ │  └                                                                               │        │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯        │
│                                                                                             │
│ Signatures:                                                                                 │
│    PP1rx5lam6FaD0pPC/jNhM/6I7qq6LYxx/J7foFF31zMFgb+2j8f3S3heqwKoVy3cb8Bg98X761BdSGYIVy7DA== │
│                                                                                             │
╰─────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: CtSm9vUuvGT6RiosAzmA2s7QdgLseSJrAd49YnGSmjCa                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 324                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1c46b46a471dc45bc81c572a59149713e2ba2e28f9aa18c814a9f9006b6134b5                         │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ Version: 922314                                                                                │
│  │ Digest: 3qR5NkexhFL1tBeniXNYnhd7azX3CJLpSjiLpZvgBSfT                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                         │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ Version: 922314                                                                                │
│  │ Digest: BeYURd5472L8MbrZ4oFKqzXjmVm7sjNBL6fG9ApguwWR                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                         │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ Version: 922314                                                                                │
│  │ Digest: BeYURd5472L8MbrZ4oFKqzXjmVm7sjNBL6fG9ApguwWR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 2485200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    BrmDz3ipzUFux1P7max6Z3Vq9D7AgiSw4BYteb73ASLZ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                    │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x1c46b46a471dc45bc81c572a59149713e2ba2e28f9aa18c814a9f9006b6134b5                                   │
│  │ Sender: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                                     │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )                  │
│  │ ObjectType: 0xd893bb4bbb49fd1326c91addea0833f753fa6c3b11afbc2f7d5794bf7ba43f6f::hello_world::HelloWorldObject  │
│  │ Version: 922314                                                                                                │
│  │ Digest: 3qR5NkexhFL1tBeniXNYnhd7azX3CJLpSjiLpZvgBSfT                                                           │
│  └──                                                                                                              │
│ Mutated Objects:                                                                                                  │
│  ┌──                                                                                                              │
│  │ ObjectID: 0x76da045956a74311af21577315d6825c9d9afde715667db316549364929a05b5                                   │
│  │ Sender: 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449                                     │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )                  │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                     │
│  │ Version: 922314                                                                                                │
│  │ Digest: BeYURd5472L8MbrZ4oFKqzXjmVm7sjNBL6fG9ApguwWR                                                           │
│  └──                                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x7fab85ecfab9656003e6994ee90968f23be892d50ef852a8dd131fd7149b3449 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -2507080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
此时有一个新的object被创建,ID为`0x1c46b46a471dc45bc81c572a59149713e2ba2e28f9aa18c814a9f9006b6134b5`