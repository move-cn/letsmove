# move sui 安装

## 1:安装rust
```shell
# 参考文档 https://rust-guide.niqin.com/en-us/3-env/3.2-linux-wsl-macos/3.2.2-homebrew-rust.html
# 参考文档 https://docs-zh.sui-book.com/guides/developer/getting-started/sui-install/
# 安装 Rust 版本管理工具 rustup 
brew install rustup-init
# 然后，在 bash 窗口执行 rustup 初始化命令，即可安装好 rust 环境及相关工具链。
rustup-init
```


## 2:安装move sui
### 2.1 从在线源代码安装 Sui 二进制文件
```shell
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

### 2.2 本地编译安装
- 克隆: testnet

```shell
git clone https://github.com/MystenLabs/sui.git
# 切换到 framework/testnet 分支
cd sui && git checkout framework/testnet
```

- 执行本地编译
- 如果需要升级版本重新执行语句即可，自动会安装最新版本，如果使用本地代码编译需要更新一下本地代码库,testnet分支可能更新不及时，最好使用在线安装

```shell
# 官方URL编译安装方式 cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
# "file:///Users/huiwang/GitLab/Open/Sui/sui" 为项目路径
cargo install --locked --git "file:///Users/huiwang/GitLab/Open/Sui/sui" --branch framework/testnet sui
```

## 3:提升编译速度 
- 注:前提是本地已经存在了官方源码，或者使用国内镜像
```toml
# 原有依赖
[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
```

```toml
# 修改 git 指向本地即可,如: git = "/Users/huiwang/GitLab/Open/Sui/sui" 或者 使用国内镜像 git = "https://gitee.com/mystenLabs/sui.git"
[dependencies]
Sui = { git = "/Users/huiwang/GitLab/Open/Sui/sui", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
```

# 4:搭建本地sui网络

- 相对比较复杂，待完善。。。