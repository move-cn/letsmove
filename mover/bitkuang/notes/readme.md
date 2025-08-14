# hello move

## 安装sui

- 安装rust
```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
- 安装sui
```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
```

## sui常用命令
```shell
sui client envs
sui client switch --env testnet
sui client addresses
sui client active-address
sui client switch --address [ADDRESS]
sui client gas
sui client new-address ed25519
sui move new hello_world
sui client publish --gas-budget 20000000
```

## Hello Move

```shell
Transaction Digest: Gsk5A4vLhKhxyD4NDTib5GdMVGPXBF93tQfXtu568U4
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf                                   │
│ Gas Owner: 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf                                │
│ Gas Budget: 20000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xf041a487ee963fabfe243f940c6cbef80ca48c182f0091d3653b19d8376ba1c9                                    │
│  │ Version: 897094                                                                                           │
│  │ Digest: BbGKNohh7F3zWZFzA1w5yJ7WXeYPXz4ohu5gv54Bmtpb                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf" │ │
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
│    W9uDW1CHF6uChBVIOjOmMYjoyjgNXnbLlNzIVgBQ1ng6VNXFWKOsTd3rPSZGoKc4/UngUOaygrx5PMTQViAVCA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: Gsk5A4vLhKhxyD4NDTib5GdMVGPXBF93tQfXtu568U4                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 333                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x6c48ba0aedd7ee157011b1b9161ef892176a1ac245fc6195a039cb8d40220a0b                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: AQyCdqMyK2CwrwhDJ8eeUkzbfWBdG6t2rKAbyM2zRsuX                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x6d33771203153d2da9392cf620c4e5588df625bced19a24fe3b33690f212e7a8                         │
│  │ Owner: Account Address ( 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf )  │
│  │ Version: 897095                                                                                │
│  │ Digest: 9PpFzm4tMK4KncsK2DWuCQvKFkxG1XhGLWt9PkXR2LU8                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xf041a487ee963fabfe243f940c6cbef80ca48c182f0091d3653b19d8376ba1c9                         │
│  │ Owner: Account Address ( 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf )  │
│  │ Version: 897095                                                                                │
│  │ Digest: DPxVuviompve2bsW3jDahVMb2VhH9MJ8HcGHkVRHGowM                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xf041a487ee963fabfe243f940c6cbef80ca48c182f0091d3653b19d8376ba1c9                         │
│  │ Owner: Account Address ( 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf )  │
│  │ Version: 897095                                                                                │
│  │ Digest: DPxVuviompve2bsW3jDahVMb2VhH9MJ8HcGHkVRHGowM                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7957200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    54kRVRDTktFx1dmHDxS7LxRyeZhyuhyZzi6ZpTwPJfqd                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x6d33771203153d2da9392cf620c4e5588df625bced19a24fe3b33690f212e7a8                  │
│  │ Sender: 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf                    │
│  │ Owner: Account Address ( 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 897095                                                                               │
│  │ Digest: 9PpFzm4tMK4KncsK2DWuCQvKFkxG1XhGLWt9PkXR2LU8                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xf041a487ee963fabfe243f940c6cbef80ca48c182f0091d3653b19d8376ba1c9                  │
│  │ Sender: 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf                    │
│  │ Owner: Account Address ( 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 897095                                                                               │
│  │ Digest: DPxVuviompve2bsW3jDahVMb2VhH9MJ8HcGHkVRHGowM                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x6c48ba0aedd7ee157011b1b9161ef892176a1ac245fc6195a039cb8d40220a0b                 │
│  │ Version: 1                                                                                    │
│  │ Digest: AQyCdqMyK2CwrwhDJ8eeUkzbfWBdG6t2rKAbyM2zRsuX                                          │
│  │ Modules: hello_world                                                                          │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x848496ebcc019595b48d5b97aac264454c19e07f094431256f5bffeda020a4cf )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7979080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```
