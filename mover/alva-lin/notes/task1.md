> [letsmove](https://github.com/move-cn/letsmove)
>
> Let's Move 一项学Move获得SUI的激励计划，鼓励更多的人学习Move语言
>
> 学习日志 ([alva-lin](https://github.com/alva-lin/letsmove))

# Task 1 - hello move

## Sui Cli 基本操作

参照文档 [Sui CLI: Client](https://docs.sui.io/references/cli/client)

### 网络

1. 查看当前添加的网络列表

```bash
sui client envs
```

输出如下，其中 alias 为网络别名，url 为网络地址，active 为当前激活的网络

```
╭─────────┬─────────────────────────────────────┬────────╮
│ alias   │ url                                 │ active │
├─────────┼─────────────────────────────────────┼────────┤
│ devnet  │ https://fullnode.devnet.sui.io:443  │        │
│ mainnet │ https://fullnode.mainnet.sui.io:443 │        │
│ testnet │ https://fullnode.testnet.sui.io:443 │ *      │
╰─────────┴─────────────────────────────────────┴────────╯
```

2. 添加网络

如果前面的网络中，没有测试网 (testnet)，则可以自行添加。

```bash
sui client new-env --alias=testnet --rpc https://fullnode.testnet.sui.io:443
```

输出如下

```
Added new Sui env [testnet] to config.
```

可以再执行一次 `sui client envs`，来查看是否添加到列表中。

3. 切换当前环境的网络

```bash
sui client switch --env testnet
```

输出如下

```
Active environment switched to [testnet]
```

输出提示切换成功，也可以再执行一次 `sui client envs`，来查看当前活跃网络是否是 testnet。

### 地址

1. 查看地址列表

```bash
sui client addresses
```

命令和环境类似，执行后的输出如下

```
╭──────────────────┬───────────────────────┬────────────────╮
│ alias            │ address               │ active address │
├──────────────────┼───────────────────────┼────────────────┤
│ adoring-turquois │ 0xb31fc********c57f48 │ *              │
╰──────────────────┴───────────────────────┴────────────────╯
```

2. 切换当前活跃的地址

```bash
sui client active-address
```

输出如下，直接将当前活跃的地址全部输出了

```
0xb31fc********c57f48
```

### 编译 & 发布 & 调用



1. 新建包

```bash
sui move new 03_hello_move
```

该命令不会有输出，会在当前路径创建一个 sui package 文件夹，其内容如下

```
❯ tree 03_hello_move
03_hello_move
├── Move.toml
└── sources

1 directory, 1 file
```

我们将代码文件放在 sources 文件夹下即可。

> **package 命名问题：**
>
> 如果你也和我一样，为了方便记录学习，每个项目前都以一个数字开头，那么在后续的代码编译时会报错
>
> ```bash
> ❯ sui move build
> UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
> INCLUDING DEPENDENCY Sui
> INCLUDING DEPENDENCY MoveStdlib
> BUILDING 03_hello_move
> error[E01002]: unexpected token
>   ┌─ sources/hello_move.move:1:11
>   │
> 1 │ module 03_hello_move::hello {
>   │           ^^^
>   │           │
>   │           Unexpected 'hello_move'
>   │           Expected '::'
>
> Failed to build Move modules: Compilation error.
> ```
>
> 解决办法有两种
>
>   1. (**推荐**)创建项目时，使用不带序号的项目名：`sui move new hello_move`，后续再修改文件夹名称: `mv hello_move 03_hello_move`
>
>   2. 正常创建项目，然后找到 `Move.toml` 文件中的 `[addresses]` 块，修改 `03_hello_move` 为 `hello_move`。并且需要注意，在编写代码时， package 名是 `hello_move`
>
> 另外还有个地方有差异，`Move.toml` 文件中的 `[package]` 块，其中 `name` 字段的名称，是根据 `sui move new <package_name>` 中的包名来直接命名的

2. 编译

先进入到 package 对应的路径，然后执行以下命令

```bash
sui move build
```

如果代码没有基本错误，输出如下

```
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING 03_hello_move
```

同时注意到，当前路径下，多了个 build 文件夹和 `Move.lock` 文件

```bash
❯ tree -L 2
.
├── Move.lock
├── Move.toml
├── build
│   ├── 03_hello_move
│   └── locks
└── sources
    └── hello_move.move
```

3. 发布

发布前，需要注意当前激活的网络和地址。在 package 对应的路径下，执行以下命令，将包发布到对应的网络

```bash
sui client publish 
```

这里的 `gas-budget` 指运行模块初始化程序是的 gas 费用预算。

如果发布成功，则会输出以下内容，**注意：每次执行时输出内容中某些值会有所不同，但是内容结构大致相同**。

输出被分为了多个块

- Transaction Data

- Transaction Effects

- Transaction Events

- Object Changes

- Balance Changes

找到 `Transaction Effects` 块中的 `Created Objects` 输出信息，其中 `Owner` 为 `Immutable` 的对象，就是发布的包。可以看到对应的 package ID 为 `0x96ad76ea3a055760f257b839668c8c8d113502bcc04b688a35350b83a76abd15`

```
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING 03_hello_move
Successfully verified dependencies on-chain against source.
Transaction Digest: FAGtpXnChnj2ZPxoZvt3kAuWY7esvPHGmpHbwAAUcdPX
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb31fc********c57f48                                                                                │
│ Gas Owner: 0xb31fc********c57f48                                                                             │
│ Gas Budget: 100000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x91cbd3fe3422844d015fa2a7da45721d42226cd2cd6c54f2a5097a8679fc678b                                    │
│  │ Version: 920427                                                                                           │
│  │ Digest: Gucz8kmhru994mu1SMfsrasg3YjsPkzscj5KKkEmxu4X                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb31fc********c57f48                                             " │ │
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
│    Hl+Chc7V72WhwKAwJ3T8PrhCibN9T27nZMNmVFpN7FqiTBPSVbxYfL+B5uyp3oRQ463WjGA8/oJ0cxmRfz92BA==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: FAGtpXnChnj2ZPxoZvt3kAuWY7esvPHGmpHbwAAUcdPX                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 318                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x96ad76ea3a055760f257b839668c8c8d113502bcc04b688a35350b83a76abd15                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 2iv1DT3ARdBDwowswWA87ucPubfbEXfYkrcM1R6QyxWd                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xea782e392b95749ab43c20d9902f19b2976226391bdbd70e81f380f079932460                         │
│  │ Owner: Account Address ( 0xb31fc********c57f48                                              )  │
│  │ Version: 920428                                                                                │
│  │ Digest: 6kC43pZb8YDZ9BDisXc3fmktSWt9PxP13N4QNa1sLank                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x91cbd3fe3422844d015fa2a7da45721d42226cd2cd6c54f2a5097a8679fc678b                         │
│  │ Owner: Account Address ( 0xb31fc********c57f48                                              )  │
│  │ Version: 920428                                                                                │
│  │ Digest: CDN8E9EuPNgtwiLF77ZxAdx8BXMw27uQzcG1ADxuG9fZ                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x91cbd3fe3422844d015fa2a7da45721d42226cd2cd6c54f2a5097a8679fc678b                         │
│  │ Owner: Account Address ( 0xb31fc********c57f48                                              )  │
│  │ Version: 920428                                                                                │
│  │ Digest: CDN8E9EuPNgtwiLF77ZxAdx8BXMw27uQzcG1ADxuG9fZ                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 7539200 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    27si9MdVQzBrEzHWrbZJThtB7nVSHC1x14EuE5r3o2V2                                                   │
│    GZcMfNx5jvGHsfSKEHJD7jZss7yCHqEGfhVk8Jx8a2N1                                                   │
│    HuSWWnS6ZXZyyBpyoaWf7b8N961SPMUW7q9apQ5VkJTr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                   │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0xea782e392b95749ab43c20d9902f19b2976226391bdbd70e81f380f079932460                  │
│  │ Sender: 0xb31fc********c57f48                                                                 │
│  │ Owner: Account Address ( 0xb31fc********c57f48                                              ) │
│  │ ObjectType: 0x2::package::UpgradeCap                                                          │
│  │ Version: 920428                                                                               │
│  │ Digest: 6kC43pZb8YDZ9BDisXc3fmktSWt9PxP13N4QNa1sLank                                          │
│  └──                                                                                             │
│ Mutated Objects:                                                                                 │
│  ┌──                                                                                             │
│  │ ObjectID: 0x91cbd3fe3422844d015fa2a7da45721d42226cd2cd6c54f2a5097a8679fc678b                  │
│  │ Sender: 0xb31fc********c57f48                                                                 │
│  │ Owner: Account Address ( 0xb31fc********c57f48                                              ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                    │
│  │ Version: 920428                                                                               │
│  │ Digest: CDN8E9EuPNgtwiLF77ZxAdx8BXMw27uQzcG1ADxuG9fZ                                          │
│  └──                                                                                             │
│ Published Objects:                                                                               │
│  ┌──                                                                                             │
│  │ PackageID: 0x96ad76ea3a055760f257b839668c8c8d113502bcc04b688a35350b83a76abd15                 │
│  │ Version: 1                                                                                    │
│  │ Digest: 2iv1DT3ARdBDwowswWA87ucPubfbEXfYkrcM1R6QyxWd                                          │
│  │ Modules: hello                                                                                │
│  └──                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb31fc********c57f48                                              )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -7561080                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

4. 调用函数

我们可以调用刚才发布的合约中的 `say_hello` 函数，来获得一个 object。

首先将刚才的 package ID 保存为变量

```bash
export PACKAGE_ID=<package object ID>
```

然后使用相关命令

```bash
sui client call --package $PACKAGE_ID --module hello --function say_hello --gas-budget 300000000
```

如果执行无误，则会输出以下内容

同样的，我们找到 `Transaction Effects` 块中的 `Created Objects`，这次只有一个 object 被创建，拿到对应的 ID `0xc3eb50f39ec09e4e2eed994fdf60f855f4841b3591c94ca85e54047ed105280d`

```
Transaction Digest: 3Ys1pYtBSgUiXUYMsK37KPWftcXX5icbbPLgT1f1frPp
╭──────────────────────────────────────────────────────────╮
│ Transaction Data                                         │
├──────────────────────────────────────────────────────────┤
│ Sender: 0xb31fc********c57f48                            │
│ Gas Owner: 0xb31fc********c57f48                         │
│ Gas Budget: 300000000 MIST                               │
│ Gas Price: 1000 MIST                                     │
│ Gas Payment:                                             │
│  ┌──                                                     │
│  │ ID: 0x91cbd3fe34228********cd26c54f2a5097a8679fc678b  │
│  │ Version: 920429                                       │
│  │ Digest: BgNZWUPLdG1WNxupJjP8R1RbQdqHYmLYP8GXYHEX2bg   │
│  └──                                                     │
│                                                          │
│ Transaction Kind: Programmable                           │
│   No input objects for this transaction                  │
│ ╭────────────────────────────────────────────────────╮   │
│ │ Commands                                           │   │
│ ├────────────────────────────────────────────────────┤   │
│ │ 0  MoveCall:                                       │   │
│ │  ┌                                                 │   │
│ │  │ Function:  say_hello                            │   │
│ │  │ Module:    hello                                │   │
│ │  │ Package:   0x96ad76ea3a055****a35350b83a76abd15 │   │
│ │  └                                                 │   │
│ ╰────────────────────────────────────────────────────╯   │
│                                                          │
│ Signatures:                                              │
│    FlBbaPmrMt9DNKt9EMug********R8KcJes7dzem52d2CDkFcBA== │
│                                                          │
╰──────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────╮
│ Transaction Effects                                      │
├──────────────────────────────────────────────────────────┤
│ Digest: 3Ys1pYtBSgUiXUYMsK37KPWftcXX5icbbPLgT1f1frPp     │
│ Status: Success                                          │
│ Executed Epoch: 318                                      │
│                                                          │
│ Created Objects:                                         │
│  ┌──                                                     │
│  │ ID: 0xc3eb50f39ec09e4e2e****91c94ca85e54047ed105280d  │
│  │ Owner: Account Address ( 0xb31fc********c57f48      ) │
│  │ Version: 920430                                       │
│  │ Digest: ZmguJw2kjwwrFYUYuZ8xG4EZcHc6n2CjMibhc9CjYNr   │
│  └──                                                     │
│ Mutated Objects:                                         │
│  ┌──                                                     │
│  │ ID: 0x91cbd3fe3422844d********c54f2a5097a8679fc678b   │
│  │ Owner: Account Address ( 0xb31fc********c57f48      ) │
│  │ Version: 920430                                       │
│  │ Digest: 74GDCP91puviUXMmMFv7EEYSkuP7uMTt4MaPxGJi3JRj  │
│  └──                                                     │
│ Gas Object:                                              │
│  ┌──                                                     │
│  │ ID: 0x91cbd3fe3422844d******2cd6c54f2a5097a8679fc678b │
│  │ Owner: Account Address ( 0xb31fc********c57f48      ) │
│  │ Version: 920430                                       │
│  │ Digest: 74GDCP91puviUXMmMFv7EEYSkuP7uMTt4MaPxGJi3JRj  │
│  └──                                                     │
│ Gas Cost Summary:                                        │
│    Storage Cost: 2340800 MIST                            │
│    Computation Cost: 1000000 MIST                        │
│    Storage Rebate: 978120 MIST                           │
│    Non-refundable Storage Fee: 9880 MIST                 │
│                                                          │
│ Transaction Dependencies:                                │
│    65HTDLBC9h1cTbdPcuDPRpL3ZJUGvgWZHaQSpVcnos2R          │
│    FAGtpXnChnj2ZPxoZvt3kAuWY7esvPHGmpHbwAAUcdPX          │
╰──────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭──────────────────────────────────────────────────────────╮
│ Object Changes                                           │
├──────────────────────────────────────────────────────────┤
│ Created Objects:                                         │
│  ┌──                                                     │
│  │ ObjectID: 0xc3eb50****47ed105280d                     │
│  │ Sender: 0xb31fc********c57f48                         │
│  │ Owner: Account Address ( 0xb31fc********c57f48      ) │
│  │ ObjectType: 0x96ad76****0b83a76abd15::hello::Hello    │
│  │ Version: 920430                                       │
│  │ Digest: ZmguJw2kjwwrFYUYuZ8xG4EZcHc6n2CjMibhc9CjYNr   │
│  └──                                                     │
│ Mutated Objects:                                         │
│  ┌──                                                     │
│  │ ObjectID: 0x91cbd3fe342284****a5097a8679fc678b        │
│  │ Sender: 0xb31fc********c57f48                         │
│  │ Owner: Account Address ( 0xb31fc********c57f48      ) │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>            │
│  │ Version: 920430                                       │
│  │ Digest: 74GDCP91puviUXMmMFv7EEYSkuP7uMTt4MaPxGJi3JRj  │
│  └──                                                     │
╰──────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────╮
│ Balance Changes                                          │
├──────────────────────────────────────────────────────────┤
│  ┌──                                                     │
│  │ Owner: Account Address ( 0xb31fc********c57f48     )  │
│  │ CoinType: 0x2::sui::SUI                               │
│  │ Amount: -2362680                                      │
│  └──                                                     │
╰──────────────────────────────────────────────────────────╯
```

### Sui 浏览器钱包

这两个钱包都暂时只有浏览器扩展

- [Sui Wallet](https://chromewebstore.google.com/detail/sui-wallet/opcgpfmipidbgpenhmajoajpbobppdil)

- [Suiet](https://suiet.app/)

### Sui Explorer & SuiScan

Sui 区块浏览器，可以查看链上的任何记录，只要提供地址 or ID。

- [suiscan](https://suiscan.xyz/)

- [SuiVision](https://suivision.xyz/)

以 suiscan 为例，我们前面使用 `sui client call ...` 来调用刚刚发布的合约中的函数，得到了一个 obejct ID。我们可以直接按一定格式 `https://suiscan.xyz/<env>/object/<object ID>`，可以看到这个新创建的 object 信息。或者是将 package ID 传入，也是可以看到相关信息。

这是 package 链接：
https://suiscan.xyz/testnet/object/0x96ad76ea3a055760f257b839668c8c8d113502bcc04b688a35350b83a76abd15

这是 hello object 链接：
https://suiscan.xyz/testnet/object/0xc3eb50f39ec09e4e2eed994fdf60f855f4841b3591c94ca85e54047ed105280d
