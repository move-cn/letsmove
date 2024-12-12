# Sui Move 开发环境准备

Move 是一种基于 Rust 改编的编程语言，它创建于 2019 年，最初是为 Meta 的 Diem 区块链项目而开发的，在 Diem 项目解散之后，其创始团队出走分别创立的 Aptos 与 Sui，也将 Move 作为核心编程语言。

## Install  Rust

Sui 是 Rust 编写的, 因此本地需要 Rust 开发环境, 一般开发合约无需开发 Rust 代码

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

安装位置: `~/.cargo/bin`, 里面常用的工具

* rustup
  * up 是 setup 或 update 的意思
  * 工具链管理器 ToolChain Management

* rustc
  * 编译器

* cargo
  * 包管理工具, 类似 maven

### 常用命令

```
# 查看编译器版本
rustc -V

# 查看包管理工具版本
cargo --version

# rustup 管理多版本编译器
## 安装稳定版
rustup toolchain install stable
## 安装日更版本
rustup toolchain install nightly

# 查看默认编译器
rustup default

# 修改默认编译器
rustup default nightly

用指定版本的编译器执行命令
rustup run nightly rustc --version
```



## Install Sui

Sui 客户端, 负责和 Sui 区块链做交互

Mac 系统下执行

````
brew search sui
brew install sui
````

验证安装

安装到了 `/opt/homebrew/Cellar/sui/1.36.2/bin`

```
# 查看版本
# sui -V
sui 1.36.2-homebrew
```

后续升级, 因为 sui 客户端更新的比较频繁

```
brew upgrade sui

==> Downloading https://formulae.brew.sh/api/formula_tap_migrations.jws.json
##################################################################################################################################################### 100.0%
Warning: sui 1.36.2 already installed
```

### 开发常用命令

```
# 创建项目
sui move new

# 构建项目
sui move build

# 测试项目
sui move test
```



## Install Vscode Move Plugin

搜索 "move", 选择 Mysten Labs 发行的官方插件

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-11-04-140804.png)

## Hello World

创建项目`move new helloworld`

用 vscode 打开项目 `code helloworld`

编译项目下载依赖方便看 Sui 官方源码 `sui move build`

目录结构

```
➜  helloworld tree -L 3
├── Move.lock
├── Move.toml                  # 项目依赖管理
├── build
│   ├── helloworld
│   │   ├── BuildInfo.yaml
│   │   ├── bytecode_modules
│   │   │   └── dependencies
│   │   │       ├── MoveStdlib
│   │   │       └── Sui
│   │   ├── source_maps
│   │   └── sources
│   │       └── dependencies    # sui move build 下载的依赖
│   │           ├── MoveStdlib  # move 语言标准库
│   │           └── Sui         # sui 标准库
│   └── locks
├── sources                     # 源码
│   └── helloworld.move         # helloworld 模块
└── tests                       # 单元测试
    └── helloworld_tests.move   # 单元测试模块
```

编写 sources/`helloworld.move`

```
module helloworld::helloworld {
    use std::debug;

    public fun hello() {
        debug::print(&666);
    }
}
```

编写单元测试模块 `tests/helloworld_tests.move`

```
#[test_only]
module helloworld::helloworld_tests;

use helloworld::helloworld;

const ENotImplemented: u64 = 0;

#[test]
fun test_helloworld() {
    helloworld::hello();
}

#[test, expected_failure(abort_code = ::helloworld::helloworld_tests::ENotImplemented)]
fun test_helloworld_fail() {
    abort ENotImplemented
}

```

执行单元测试 `sui move test` 成功输出 666

```
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING helloworld
Running Move unit tests
[debug] 666
[ PASS    ] helloworld::helloworld_tests::test_helloworld
[ PASS    ] helloworld::helloworld_tests::test_helloworld_fail
Test result: OK. Total tests: 2; passed: 2; failed: 0
```

## Install Sui Wallet

安装 chrome 插件 Sui Wallet

![](https://james-01-1256894360.cos.ap-beijing.myqcloud.com/2024-11-05-045100.png)

