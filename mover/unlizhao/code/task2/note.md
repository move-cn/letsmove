中文，我现在的工作目录是unlizhao/task2

d:/workdir/code/move/letsmove/mover/unlizhao/code/task1
# 发布

## 让我们重新发布 task1.move 合约。首先构建项目：

Ran terminal command
d:/workdir/code/move/letsmove/mover/unlizhao/code/task2
> sui move build


## 构建成功，现在发布合约：

Ran terminal command
d:/workdir/code/move/letsmove/mover/unlizhao/code/task2
> sui client publish --gas-budget 100000000



我已成功发布了你的Sui Move合约！以下是关键信息：

📦 Package ID: 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7

已创建的对象：

受监管代币 UNLIZHAO_COIN
TreasuryCap: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38
DenyCap: 0x2d9772b6606820b1fbec4d32a28f833fbc92f12227bfef2387dbb830aeb90d9c
CoinMetadata: 0xb9c82e8275b5e9cf1f95ea4a7fd731ee0977dba09137cd55f62b918c2eb18f3d

公共水龙头代币 UNLIZHAO_FAUCET_COIN
TreasuryCap: 0xad3c6bff7733249bc174fac7e72b233c886520a6e295f60048c030b7a6ef9d3b
CoinMetadata: 0x0d5ecd3c93da37a5cc96e18bede86ad47350588b1b09d5160bb7ac7a9988450b
注意：编译时出现了一些警告，主要是关于重复别名和一个已弃用的函数。这些警告不会影响合约的功能，但在未来的版本中可以进行优化。


# mint
## 第一次mint
要 mint UNLIZHAO_COIN，你需要使用之前发布合约时获得的 TreasuryCap。具体步骤如下：

使用 sui client publish 时获得的 TreasuryCap: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38
使用 Sui CLI 命令 mint 代币。基本语法是：
bash
CopyInsert in Terminal

sui client call --function mint --module mycoin --package <PACKAGE-ID> --args <TREASURY-CAP-ID> <COIN-AMOUNT> <RECIPIENT-ADDRESS> --gas-budget <GAS-AMOUNT>

具体操作示例：

sui client call --function mint --module unlizhao_coin --package 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7 --args 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38 1000 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f --gas-budget 10000000

<PACKAGE_ID> 是 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7
<TREASURY_CAP> 是 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38
<RECIPIENT_ADDRESS> 使用你 readme 中的 Sui 钱包地址：0x0de4e7e6c5d35784f146194bcf6ee6f570280c45089f86bdcdaf9e367d57a487
<AMOUNT> 可以根据需要调整，这里示例为 100 个代币
建议你直接在终端中运行这个命令来 mint UNLIZHAO_COIN。

<PACKAGE_ID> 是 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7
<TREASURY_CAP> 是 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38
<RECIPIENT_ADDRESS> 使用你 readme 中的 Sui 钱包地址：0x0de4e7e6c5d35784f146194bcf6ee6f570280c45089f86bdcdaf9e367d57a487
<AMOUNT> 可以根据需要调整，这里示例为 100 个代币（100 000 000 000 000 == 1,000,000.00000 UNLIZHAO）

结果：

[warning] Client/Server api version mismatch, client api version : 1.38.2, server api version : 1.39.0
Transaction Digest: 7bqADCEWYGxpFXhFy6w6EQTBadanG66VJTXJuwpmzhdg
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                   │
│ Gas Owner: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                                    │
│  │ Version: 236303715                                                                                        │
│  │ Digest: 6DdjXW8BE5UbLu9T3ATvZRBWTAnJSVKR8Lk4DyZF1d46                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38              │ │
│ │ 1   Pure Arg: Type: u64, Value: "1000"                                                                   │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    unlizhao_coin                                                      │                         │
│ │  │ Package:   0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    jFHWQ2n6M+LnzFtUYf8qYf7cUDC/z4MCpRxBMl8OcRkJdPtlvCNimz5IxrOJaqCoUzqN0Olt6VZ75Rmt4VclAA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 7bqADCEWYGxpFXhFy6w6EQTBadanG66VJTXJuwpmzhdg                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 580                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xe956fd0c28d55de132db7f82663958e0dc4c531810f56b770d2e7c7baeb4def2                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303716                                                                             │
│  │ Digest: PXz7A9m4F2BRKnnxfkyfrXEhRLyDxTySkUnp69niDQP                                            │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303716                                                                             │
│  │ Digest: 7ibfQ5sy1a7He9FLozsNQE3jVBKDbAB62D9miF1REjdn                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303716                                                                             │
│  │ Digest: HmzTt5zK46oruVjSYxxU3bFuessLksoHbv3FWDaw8cB9                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303716                                                                             │
│  │ Digest: HmzTt5zK46oruVjSYxxU3bFuessLksoHbv3FWDaw8cB9                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4286400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2798928 MIST                                                                   │
│    Non-refundable Storage Fee: 28272 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    wrEu2AQqaio6pduG8DQq58ibKarFozKkLKzSVV653vf                                                    │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                         │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0xe956fd0c28d55de132db7f82663958e0dc4c531810f56b770d2e7c7baeb4def2                                                          │
│  │ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                                            │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )                                         │
│  │ ObjectType: 0x2::coin::Coin<0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN>         │
│  │ Version: 236303716                                                                                                                    │
│  │ Digest: PXz7A9m4F2BRKnnxfkyfrXEhRLyDxTySkUnp69niDQP                                                                                   │
│  └──                                                                                                                                     │
│ Mutated Objects:                                                                                                                         │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38                                                          │
│  │ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                                            │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )                                         │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN>  │
│  │ Version: 236303716                                                                                                                    │
│  │ Digest: 7ibfQ5sy1a7He9FLozsNQE3jVBKDbAB62D9miF1REjdn                                                                                  │
│  └──                                                                                                                                     │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                                                          │
│  │ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                                            │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )                                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                            │
│  │ Version: 236303716                                                                                                                    │
│  │ Digest: HmzTt5zK46oruVjSYxxU3bFuessLksoHbv3FWDaw8cB9                                                                                  │
│  └──                                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                           │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )               │
│  │ CoinType: 0x2::sui::SUI                                                                                     │
│  │ Amount: -2487472                                                                                            │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )               │
│  │ CoinType: 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN  │
│  │ Amount: 1000                                                                                                │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯



## 重新mint


C:\WINDOWS\system32>sui client call --function mint --module unlizhao_coin --package 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7 --args 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38 100000000000000 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f --gas-budget 10000000

[warning] Client/Server api version mismatch, client api version : 1.38.2, server api version : 1.39.0
Transaction Digest: FQWHU99aaNKpSwzA9Nbi1KSN3ihSBi5Y4pyiE3ZKkDm4
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                   │
│ Gas Owner: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                │
│ Gas Budget: 10000000 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                                    │
│  │ Version: 236303716                                                                                        │
│  │ Digest: HmzTt5zK46oruVjSYxxU3bFuessLksoHbv3FWDaw8cB9                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38              │ │
│ │ 1   Pure Arg: Type: u64, Value: "100000000000000"                                                        │ │
│ │ 2   Pure Arg: Type: address, Value: "0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮                         │
│ │ Commands                                                                         │                         │
│ ├──────────────────────────────────────────────────────────────────────────────────┤                         │
│ │ 0  MoveCall:                                                                     │                         │
│ │  ┌                                                                               │                         │
│ │  │ Function:  mint                                                               │                         │
│ │  │ Module:    unlizhao_coin                                                      │                         │
│ │  │ Package:   0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7 │                         │
│ │  │ Arguments:                                                                    │                         │
│ │  │   Input  0                                                                    │                         │
│ │  │   Input  1                                                                    │                         │
│ │  │   Input  2                                                                    │                         │
│ │  └                                                                               │                         │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯                         │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    VEg3tPxP++HOAA7e2A3AiMbqIgg5clr7br6bFyC11Cx6u33UVwLnRln2i3l723X0+BsR+xQNn5OkMe7HKOjhBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FQWHU99aaNKpSwzA9Nbi1KSN3ihSBi5Y4pyiE3ZKkDm4                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 580                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x2b84bac350e6c4f712fbcbf3acf11a1d1a918ab35bd5b1bde198dcb946e8196d                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303717                                                                             │
│  │ Digest: DdfMnLdrq6jn6DeT271vQBbio7iwSJaj5uPVHnMuh2n3                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303717                                                                             │
│  │ Digest: EA7k6Ldic6Z1S1eUpHSnewYqvTXamkigedS5f4Zg2sTC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303717                                                                             │
│  │ Digest: 8D8nfmmwthjs4UJTcHXzz3fi69dEw3SSYRxSkhZ4mkJv                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                         │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )  │
│  │ Version: 236303717                                                                             │
│  │ Digest: 8D8nfmmwthjs4UJTcHXzz3fi69dEw3SSYRxSkhZ4mkJv                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 4286400 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 2798928 MIST                                                                   │
│    Non-refundable Storage Fee: 28272 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    wrEu2AQqaio6pduG8DQq58ibKarFozKkLKzSVV653vf                                                    │
│    7bqADCEWYGxpFXhFy6w6EQTBadanG66VJTXJuwpmzhdg                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                                           │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                                         │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0x2b84bac350e6c4f712fbcbf3acf11a1d1a918ab35bd5b1bde198dcb946e8196d                                                          │
│  │ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                                            │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )                                         │
│  │ ObjectType: 0x2::coin::Coin<0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN>         │
│  │ Version: 236303717                                                                                                                    │
│  │ Digest: DdfMnLdrq6jn6DeT271vQBbio7iwSJaj5uPVHnMuh2n3                                                                                  │
│  └──                                                                                                                                     │
│ Mutated Objects:                                                                                                                         │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38                                                          │
│  │ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                                            │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )                                         │
│  │ ObjectType: 0x2::coin::TreasuryCap<0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN>  │
│  │ Version: 236303717                                                                                                                    │
│  │ Digest: EA7k6Ldic6Z1S1eUpHSnewYqvTXamkigedS5f4Zg2sTC                                                                                  │
│  └──                                                                                                                                     │
│  ┌──                                                                                                                                     │
│  │ ObjectID: 0xd15194b66e264062417e2b049bfc87b93dcfd3979991498729d24c81403018c6                                                          │
│  │ Sender: 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f                                                            │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )                                         │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                                            │
│  │ Version: 236303717                                                                                                                    │
│  │ Digest: 8D8nfmmwthjs4UJTcHXzz3fi69dEw3SSYRxSkhZ4mkJv                                                                                  │
│  └──                                                                                                                                     │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                                │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                           │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )               │
│  │ CoinType: 0x2::sui::SUI                                                                                     │
│  │ Amount: -2487472                                                                                            │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ Owner: Account Address ( 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f )               │
│  │ CoinType: 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN  │
│  │ Amount: 100000000000000                                                                                     │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯


## 转账
``` sui client transfer --amount <AMOUNT> --recipient <RECIPIENT_ADDRESS> --coin-type <COIN_TYPE> ``` 

注意事项：

<AMOUNT> 是要转账的代币数量
<RECIPIENT_ADDRESS> 是接收者的钱包地址
<COIN_TYPE> 是你自定义 Coin 的完整类型标识符

sui client transfer   --amount 100000000  --recipient 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2   --coin-type xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7::unlizhao_coin::UNLIZHAO_COIN

### 转账失败
│  │ ObjectID: 0x174db0036ee47402ae326ffebf283b3737da70dc963d7968e84385200073fd38  
https://testnet.suivision.xyz/object/0x2b84bac350e6c4f712fbcbf3acf11a1d1a918ab35bd5b1bde198dcb946e8196d


sui client pay-sui --recipients 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --input-coins 0x2b84bac350e6c4f712fbcbf3acf11a1d1a918ab35bd5b1bde198dcb946e8196d --amounts 100000 --gas-budget 5000000

RPC call failed: ErrorObject { code: ServerError(-32002), message: "Transaction validator signing failed due to issues with transaction inputs, please review the errors and try again:\n- Object 0x2b84bac350e6c4f712fbcbf3acf11a1d1a918ab35bd5b1bde198dcb946e8196d is not a gas object", data: None }


这个错误表明你尝试使用的 Coin ObjectID 不是 gas object，无法直接用于交易。

对于自定义 Coin 的转账，你需要使用 Move Call 方all 方法：

bash
CopyInsert
sui client call \
  --function transfer \
  --module unlizhao_coin \
  --package 0xe1415339ed4cf982a9fd1b9edce793c7209932f92e8b1b2389b10404725764c7 \
  --args 0x2b84bac350e6c4f712fbcbf3acf11a1d1a918ab35bd5b1bde198dcb946e8196d 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 1000 \
  --gas-budget 10000000
参数解释：

--function transfer：调用转账函数
--module unlizhao_coin：模块名
--package：Package ID
第一个 args：Coin ObjectID
第二个 args：接收地址
第三个 args：转账数量
确保你的 coin.move 合约中定义了 transfer 函数。如果没有，你可能需要在合约中添加这个函数。




  ### 无法转账，重新发布合约
从发布结果可以看出，新的关键信息如下：

新的 Package ID: 0x6723d64d46ff1abfcc2c6ed4558ab99a0d4b13f60d83d015bb203b67d174b6af
新的 TreasuryCap: 0x788c3eeef5a5ca0828bb32983160555acac280b10dca879e0f86756d0fe37bce
现在你可以使用这些新的 ID 来 mint 代币：

bash
CopyInsert
sui client call \
  --function mint \
  --module unlizhao_coin \
  --package 0x6723d64d46ff1abfcc2c6ed4558ab99a0d4b13f60d83d015bb203b67d174b6af \
  --args 0x788c3eeef5a5ca0828bb32983160555acac280b10dca879e0f86756d0fe37bce 1000 0xdc44fe74366a0ea9671bc3e4b1c741e26fd9e7e023c97c8f577b4c05469e6a7f \
  --gas-budget 10000000
转账命令也需要相应更新：

bash
CopyInsert
sui client call \
  --function transfer \
  --module unlizhao_coin \
  --package 0x6723d64d46ff1abfcc2c6ed4558ab99a0d4b13f60d83d015bb203b67d174b6af \
  --args <COIN_OBJECT_ID> 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 \
  --gas-budget 10000000
注意：<COIN_OBJECT_ID> 需要在 mint 后从交易返回值中获取。


### 重新mint


