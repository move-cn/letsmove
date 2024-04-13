## Task 1
### 	Sui钱包安装

google搜索浏览器插件，安装即可

![image-20240413212329138](C:\Users\Antigone4224\AppData\Roaming\Typora\typora-user-images\image-20240413212329138.png)

### 完成Sui CLI安装

wsl kali环境中编译始终报错，直接在github官网下载的release版本，解压后的二进制放在/opt文件夹，软链接到/bin/usr/sui*等文件

### 完成获取测试网络SUI学习

```zsh
#: sui client //
Config file ["<PATH-TO-FILE>/client.yaml"] doesn't exist, do you want to connect to a Sui Full node server [y/N]? y
Sui Full node server URL (Defaults to Sui Devnet if not specified) :https://fullnode.testnet.sui.io:443
//press enter to connect sui devnet
Select key scheme to generate keypair (0 for ed25519, 1 for secp256k1, 2 for secp256r1):1
-----address and rec phrase(redacted)-----

#：sui client faucet // 获取测试网sui

#：sui client gas

```



### 完成Sui浏览器学习

查看了一下[SuiVision - Sui Explorer](https://suivision.xyz/)



### 提交`Hello Move`合约发布`package id`

```zsh
#: sui move new hello_world
#: cd hello_world
#: cat Move.toml
```

```toml
[package]
name = "hello_world"
edition = "2024.beta" # edition = "legacy" to use legacy (pre-2024) Move
# license = ""           # e.g., "MIT", "GPL", "Apache 2.0"
# authors = ["..."]      # e.g., ["Joe Smith (joesmith@noemail.com)", "John Snow (johnsnow@noemail.com)"]

[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }

# For remote import, use the `{ git = "...", subdir = "...", rev = "..." }`.
# Revision can be a branch, a tag, and a commit hash.
# MyRemotePackage = { git = "https://some.remote/host.git", subdir = "remote/path", rev = "main" }

# For local dependencies use `local = path`. Path is relative to the package root
# Local = { local = "../path/to" }

# To resolve a version conflict and force a specific version for dependency
# override use `override = true`
# Override = { local = "../conflicting/version", override = true }

[addresses]
hello_world = "0x0"

# Named addresses will be accessible in Move as `@name`. They're also exported:
# for example, `std = "0x1"` is exported by the Standard Library.
# alice = "0xA11CE"

[dev-dependencies]
# The dev-dependencies section allows overriding dependencies for `--test` and
# `--dev` modes. You can introduce test-only dependencies here.
# Local = { local = "../path/to/dev-build" }

[dev-addresses]
# The dev-addresses section allows overwriting named addresses for the `--test`
# and `--dev` modes.
# alice = "0xB0B"
```

```zsh
#: touch ./sources/hello_module.move
#: vim ./sources/hello_module.move
```

```move
module hello_world::hello_module {
        public struct Sword has key,store {
                id: UID,
                magic: u64,
                strength: u64,
        }

        public struct Forge has key {
                id: UID,
                swords_created: u64,

        }

        fun init(ctx: &mut TxContext) {
                let admin = Forge {
                        id: object::new(ctx),
                        swords_created: 0,
                };
                transfer::transfer(admin,ctx.sender());
        }

        public fun magic(self: &Sword): u64 {
                self.magic

        }

        public fun strength(self: &Sword): u64 {
                self.strength

        }

        public fun swords_created(self: &Forge): u64 {
                self.swords_created

        }
//把文档里的教学代码抄了一遍
```



```zsh
#: sui move build
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
```

暂时跳过一下写测试函数的部分

```
#: sui client publish --gas-budget 5000000
```

```zsh
Transaction Digest: 3JD6Xj12HoWmixHGoJzh3XvAURsrUP4mLm3pdECeCq26
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                                   │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x0a28b933b5c664b9dbb35d38bc3cc56232b95c6d160e0953cc4dd67191db4849                                    │
│  │ Version: 30                                                                                               │
│  │ Digest: G87DY1Dgrxjq78wTChkhLPYXBYnr6QSfXy7AMkN12pcx                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8" │ │
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
│    WqGC7zm4acPtBWxu6DzHbFcAX4OyiZOoJIPrmhOQPp0XYpwW1FPnBMkALN5mXFPWNSGr2TIlMTCWNclXVeyVBg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3JD6Xj12HoWmixHGoJzh3XvAURsrUP4mLm3pdECeCq26                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 1174                                                                              │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x81fab1250a92f6309529cb2429fce06c0b99ea7f1631f3443a5819648e8eb96a                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 31                                                                                    │
│  │ Digest: BPf2rS1Tm98aeEBMj8nqF4gMXF3tss9M4GNRWXgxkdUo                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd46d29285ad511cd74c6d84c2725626c37bbc91e14c37f7fca7341afc0aa3737                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: CJMsb8eXpHbU8KMfca9byVh5NyZHxnnZnpY8mjgZTGnW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xdab656a93053b9db17734948ba8e285139bd921a4e1c0614d902241dbb67b897                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 6nXv1vLHLgmb4X6SDJks7UGoJcN6YRRZsLnApC29xksM                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x0a28b933b5c664b9dbb35d38bc3cc56232b95c6d160e0953cc4dd67191db4849                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 2Kf3NLWtqH5M51TUmGf7VS1c3GGAbaAbCf3evCiaCBeX                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x0a28b933b5c664b9dbb35d38bc3cc56232b95c6d160e0953cc4dd67191db4849                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 31                                                                                    │
│  │ Digest: 2Kf3NLWtqH5M51TUmGf7VS1c3GGAbaAbCf3evCiaCBeX                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10488000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7rdLTzTCTqWv2i7DLhfqgibn2E8kBti96J6ig5sWZ7rR                                                   │
│    E74PBHPCEnBjXTA2h8ascZAKPGo1JuZxcbo9Bho8t4Fr                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x81fab1250a92f6309529cb2429fce06c0b99ea7f1631f3443a5819648e8eb96a                         │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                           │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )        │
│  │ ObjectType: 0xd46d29285ad511cd74c6d84c2725626c37bbc91e14c37f7fca7341afc0aa3737::hello_module::Forge  │
│  │ Version: 31                                                                                          │
│  │ Digest: BPf2rS1Tm98aeEBMj8nqF4gMXF3tss9M4GNRWXgxkdUo                                                 │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0xdab656a93053b9db17734948ba8e285139bd921a4e1c0614d902241dbb67b897                         │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                           │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                 │
│  │ Version: 31                                                                                          │
│  │ Digest: 6nXv1vLHLgmb4X6SDJks7UGoJcN6YRRZsLnApC29xksM                                                 │
│  └──                                                                                                    │
│ Mutated Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x0a28b933b5c664b9dbb35d38bc3cc56232b95c6d160e0953cc4dd67191db4849                         │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                           │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                           │
│  │ Version: 31                                                                                          │
│  │ Digest: 2Kf3NLWtqH5M51TUmGf7VS1c3GGAbaAbCf3evCiaCBeX                                                 │
│  └──                                                                                                    │
│ Published Objects:                                                                                      │
│  ┌──                                                                                                    │
│  │ PackageID: 0xd46d29285ad511cd74c6d84c2725626c37bbc91e14c37f7fca7341afc0aa3737                        │
│  │ Version: 1                                                                                           │
│  │ Digest: CJMsb8eXpHbU8KMfca9byVh5NyZHxnnZnpY8mjgZTGnW                                                 │
│  │ Modules: hello_module                                                                                │
│  └──                                                                                                    │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -10509880                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

packageID:0xd46d29285ad511cd74c6d84c2725626c37bbc91e14c37f7fca7341afc0aa3737



