# task 1

* Build Package：

```bash
cd ../code/task1
sui move build
```

* Publish Package：

```bash
cd ../code/task1
sui client publish --gas-budget 50000000
```

Publish Log:

```text
sui client publish --gas-budget 50000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING helloMove
Successfully verified dependencies on-chain against source.
Transaction Digest: ECN7J4nDeNGsMp3VdRd9f6NjNFLuVNyDzsu5fTKBLcNP
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074                                   │
│ Gas Owner: 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074                                │
│ Gas Budget: 50000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x00097c8d908adf4f1d478a32ae6d96a3f699a58c7282e4fab3d991b07b0e03e5                                    │
│  │ Version: 29573679                                                                                         │
│  │ Digest: Dpqpch7Kt5v2tXfN2gNvt6jmpAKZHjg7ReNN7Nba6W9C                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074" │ │
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
│    VD3U8zPkpvl0djM6GM3R2+cILJmzr8uooEh/283DtQnz5ZZ2GnxsdxwbvFiuJDESz5YW7ev3xFHZXmpKMfZ1DA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: ECN7J4nDeNGsMp3VdRd9f6NjNFLuVNyDzsu5fTKBLcNP                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 347                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb0fd4c401708d975f7d43a9ce53df20e9f2b77dc9680c1482d5eb3d70c9fa21c                         │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )  │
│  │ Version: 29573680                                                                              │
│  │ Digest: 5C14yR2wQtrSCdbfombk89yY4pg1y4P5nX8HoSr9HZ8H                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd3d0ed4ca0cba947d88a584fe40d02dd27fbb17176c583192b2f9b01276a5cda                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: acEw1Dg13y1BcKXPQxdt4XupJd9ftT4wWCDMxMxoGMe                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xe07a98a07b77c40f2d7a6c514c968c0efd8cd99688ef3aa726c06bc7a9343eeb                         │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )  │
│  │ Version: 29573680                                                                              │
│  │ Digest: 89z4wYLr3oEG9KirfCvrDUUBs8vyohjYpYBTAp4C9rJP                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00097c8d908adf4f1d478a32ae6d96a3f699a58c7282e4fab3d991b07b0e03e5                         │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )  │
│  │ Version: 29573680                                                                              │
│  │ Digest: E4RYqQ9DLF6xCPHbTGjhEQru7Gp2BaQ6i6CeKNLY87am                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x00097c8d908adf4f1d478a32ae6d96a3f699a58c7282e4fab3d991b07b0e03e5                         │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )  │
│  │ Version: 29573680                                                                              │
│  │ Digest: E4RYqQ9DLF6xCPHbTGjhEQru7Gp2BaQ6i6CeKNLY87am                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 8306800 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
│    7cxBLupp9Y9Gu5m7W4CVyPRUcJ7GRVSh3cWqAWqkXBYZ                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                               │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xb0fd4c401708d975f7d43a9ce53df20e9f2b77dc9680c1482d5eb3d70c9fa21c                              │
│  │ Sender: 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074                                │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )             │
│  │ ObjectType: 0xd3d0ed4ca0cba947d88a584fe40d02dd27fbb17176c583192b2f9b01276a5cda::hello::CreatorCapability  │
│  │ Version: 29573680                                                                                         │
│  │ Digest: 5C14yR2wQtrSCdbfombk89yY4pg1y4P5nX8HoSr9HZ8H                                                      │
│  └──                                                                                                         │
│  ┌──                                                                                                         │
│  │ ObjectID: 0xe07a98a07b77c40f2d7a6c514c968c0efd8cd99688ef3aa726c06bc7a9343eeb                              │
│  │ Sender: 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074                                │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )             │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                      │
│  │ Version: 29573680                                                                                         │
│  │ Digest: 89z4wYLr3oEG9KirfCvrDUUBs8vyohjYpYBTAp4C9rJP                                                      │
│  └──                                                                                                         │
│ Mutated Objects:                                                                                             │
│  ┌──                                                                                                         │
│  │ ObjectID: 0x00097c8d908adf4f1d478a32ae6d96a3f699a58c7282e4fab3d991b07b0e03e5                              │
│  │ Sender: 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074                                │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )             │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                │
│  │ Version: 29573680                                                                                         │
│  │ Digest: E4RYqQ9DLF6xCPHbTGjhEQru7Gp2BaQ6i6CeKNLY87am                                                      │
│  └──                                                                                                         │
│ Published Objects:                                                                                           │
│  ┌──                                                                                                         │
│  │ PackageID: 0xd3d0ed4ca0cba947d88a584fe40d02dd27fbb17176c583192b2f9b01276a5cda                             │
│  │ Version: 1                                                                                                │
│  │ Digest: acEw1Dg13y1BcKXPQxdt4XupJd9ftT4wWCDMxMxoGMe                                                       │
│  │ Modules: hello                                                                                            │
│  └──                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x32bc1e4cbb78e843dbe8be2c233bf1b4d2b4e776c04e7bd73c612aae44b6c074 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -8328680                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```