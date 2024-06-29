## 创建 Hello World package

- 执行: `sui move new hello_world_package`
    - 目录结构如下, 包含一个 Move.toml 文件以及 sources 目录
        
        ```bash
        hello_world_package
        ├── Move.toml
        └── sources
        ```
        
    - 默认的 `Move.toml` 文件(随着 sui 的更新, 默认文件可能也会随之更新)
    - **注意: 要手动在 `Move.toml` 的 [package] 下添加 `version = "0.0.1”` , 否则 vscode move 插件无法提供代码提示和跳转**
        
        ```bash
        [package]
        name = "hello_world_package"
        version = "0.0.1"
        # edition = "2024.alpha" # To use the Move 2024 edition, currently in alpha
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
        sui_hello_world = "0x0"
        
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
        

## 定义 hello_world module

- 在 sources 目录下新建一个 move 文件: `touch sui/sources/hello_world.move`
    - `sui_hello_world` 对应于 `Move.toml` 中 address 下的地址别名, 代指 `0x0`
    - 内容如下( 现在不需要关心太多 Move 语法, 后面的章节会实践语法)
        
        ```bash
        module sui_hello_world::hello_world {
            use std::string;
            use sui::object::{Self, UID};
            use sui::transfer;
            use sui::tx_context::{Self, TxContext};
        
            // An object that contains an arbitrary string
            struct HelloWorldObject has key, store {
                id: UID,
                /// A string contained in the object
                text: string::String
            }
        
            public entry fun mint(ctx: &mut TxContext) {
                let object = HelloWorldObject {
                    id: object::new(ctx),
                    text: string::utf8(b"Hello World!")
                };
                transfer::public_transfer(object, tx_context::sender(ctx));
            }
        }
        ```
        

## Build package

- 执行: 在 `hello_world_package` 目录的根目录下, 执行: `sui move build` (这个过程如果失败, 需要科学上网)
    - 成功 build 之后, 会在 console 打印出下方的内容:
        
        ```bash
        UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
        INCLUDING DEPENDENCY Sui
        INCLUDING DEPENDENCY MoveStdlib
        BUILDING hello_world_package
        ```
        

## 发布(publish) Hello World package

- 需要先去 faucet(水龙头领水), 领取测试代币
- 在 hello_world_package 目录下执行下方的命令发布package 到 Sui 链上
    - `sui client publish 0`
- 发布成功之后会返回一些信息, 可以复制任意一个 ID, 将他复制到 [Sui 区块链浏览器](https://suiexplorer.com/) 中, 即可查看我们部署的 Hello World package!
    - **需要记录返回结果中的 Object Changes 下的 Published Objects 中的 Package ID**, 后面需要通过这个 ID 来调用我们部署到区块链上的 Hello World 合约 (通过 ID 定位到 Package)
    
    !https://i.imgur.com/uFZhAPs.png
    
    - 将 Sui 区块链浏览器的网络改为 Testnet 或者 Devnet (具体是哪个网络取决于 `Move.toml` 中的 dependence 下中 Sui 最后是 testnet 还是 devnet)
        
        !https://i.imgur.com/grThokR.png
        
    - 将复制的 ID 按照下面图片的形式粘贴并搜索, 就能看到 Publish 产生的一些 Object

## 调用在链上的 Hello World 合约

到了上面记录的 Package ID 派上用场的时候啦! 我们使用下面的命令调用部署到 Sui 区块链上的 Hello world 合约:

- package 后面的 ID 改成你们记录的 Package ID:  `sui client call --package 0x635ea5aaa109c31ef4d24a7f3608e55738b63864a230f1cb33f70fe2bd95277d  --module hello_world --function mint --gas-budget 10000000`
- 返回的信息中的Object changes 中的第一个 Object ID, 就是我们 Mint 出来的 Hello World Object
    
    !https://i.imgur.com/xFMeVh0.png
    
- 复制上面的 Object ID 到 Sui 区块链浏览器中, 就能看到 Hello World Object 下的 `Text` 字段中的 Hello World 啦!
    
    !https://i.imgur.com/K18Gptz.png