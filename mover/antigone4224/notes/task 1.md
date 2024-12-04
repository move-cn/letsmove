## Task 1
### 	Sui钱包安装

google搜索浏览器插件，安装即可

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
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING hello_world
Successfully verified dependencies on-chain against source.
Transaction Digest: 9vAnQBQAeXWhPfVs56UxokhZjvyhRNAn1aUKCrjoYbso
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                                   │
│ Gas Owner: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                                │
│ Gas Budget: 500000000 MIST                                                                                   │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x69375bbf8e891ebb6d83a5f820f0abcf9b2a63a231bf8021d931a6deb249cd72                                    │
│  │ Version: 1131769                                                                                          │
│  │ Digest: 9YwbvrfgWSQrs6pLSbBt6bqgmPCPwxQK7Lje7cKDxqWZ                                                      │
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
│    f4uM25DgX+fe2DI8TiYG2EM9OTjZ/S2RsTJwc6XdOs9rwbsduF3Ue8/9IbbPTdrjLiIc67EbVyoAgDe761txAw==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 9vAnQBQAeXWhPfVs56UxokhZjvyhRNAn1aUKCrjoYbso                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 339                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1325031838a38a3b53abaeee165f3f536d2ba2fdbad655270cda1fe19143f9f2                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 1131770                                                                               │
│  │ Digest: HPFRGqFHdFESZZcNgot4mMxMADdV7AUXF8CTkFKAo6J                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x56908b5666f5552245866364bed2359b0427a88177ac74f408676f55aa637ea9                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: PVBCGNYEh3MdxMh2oDjMhUitjuoQjmK7sH1UwN1UFzE                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x8f4a746d0f3d02dc14fe730c9ba82eb5e4f7646f85ae008ae0e19395a5d3ad7c                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 1131770                                                                               │
│  │ Digest: 7Q8ErcRqJyfdDeiuVvgTFEZrbBAxKe2SgmMGp48mcDhd                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x69375bbf8e891ebb6d83a5f820f0abcf9b2a63a231bf8021d931a6deb249cd72                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 1131770                                                                               │
│  │ Digest: 6RXYJxENVW9oLYx2AkZpcwoJ8L7sYaABGDJHYz2DCDnR                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x69375bbf8e891ebb6d83a5f820f0abcf9b2a63a231bf8021d931a6deb249cd72                         │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )  │
│  │ Version: 1131770                                                                               │
│  │ Digest: 6RXYJxENVW9oLYx2AkZpcwoJ8L7sYaABGDJHYz2DCDnR                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10488000 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4KeKEWG2iq83RKjcmKWVSTyELWAbYr81XyGjJ4GFtAVp                                                   │
│    6PxS2PLSDGJscAqU14vs86Wew9q2dHPBugF3163mXZFV                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯

╭─────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x1325031838a38a3b53abaeee165f3f536d2ba2fdbad655270cda1fe19143f9f2                         │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                           │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )        │
│  │ ObjectType: 0x56908b5666f5552245866364bed2359b0427a88177ac74f408676f55aa637ea9::hello_module::Forge  │
│  │ Version: 1131770                                                                                     │
│  │ Digest: HPFRGqFHdFESZZcNgot4mMxMADdV7AUXF8CTkFKAo6J                                                  │
│  └──                                                                                                    │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x8f4a746d0f3d02dc14fe730c9ba82eb5e4f7646f85ae008ae0e19395a5d3ad7c                         │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                           │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )        │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                 │
│  │ Version: 1131770                                                                                     │
│  │ Digest: 7Q8ErcRqJyfdDeiuVvgTFEZrbBAxKe2SgmMGp48mcDhd                                                 │
│  └──                                                                                                    │
│ Mutated Objects:                                                                                        │
│  ┌──                                                                                                    │
│  │ ObjectID: 0x69375bbf8e891ebb6d83a5f820f0abcf9b2a63a231bf8021d931a6deb249cd72                         │
│  │ Sender: 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8                           │
│  │ Owner: Account Address ( 0xb45ad19b972b14cbb0edd4b85a9ffa5190005b7938b30dd2fa925b04d2a096c8 )        │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                           │
│  │ Version: 1131770                                                                                     │
│  │ Digest: 6RXYJxENVW9oLYx2AkZpcwoJ8L7sYaABGDJHYz2DCDnR                                                 │
│  └──                                                                                                    │
│ Published Objects:                                                                                      │
│  ┌──                                                                                                    │
│  │ PackageID: 0x56908b5666f5552245866364bed2359b0427a88177ac74f408676f55aa637ea9                        │
│  │ Version: 1                                                                                           │
│  │ Digest: PVBCGNYEh3MdxMh2oDjMhUitjuoQjmK7sH1UwN1UFzE                                                  │
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

packageID:0x56908b5666f5552245866364bed2359b0427a88177ac74f408676f55aa637ea9



