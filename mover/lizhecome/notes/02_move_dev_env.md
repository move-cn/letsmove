# （二）Move开发环境搭建与工具介绍 - 写作提纲
---
## 0. 在开始之前
本系列文章将深入浅出的全面讲解Move语言。 
   
> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH.png)

## 1. 一切准备的开始

### 目标与定位
- **搭建完整的开发环境**：
  - 本篇文章的目标是帮助开发者快速入门，搭建支持Move语言的Sui开发环境。从安装基础依赖、配置Sui CLI到编写和部署Move智能合约，全方位覆盖，让开发者能够顺利开展Move语言的开发工作。
- **适用人群**：
  - 本文适合对区块链技术感兴趣的开发者，尤其是想探索新兴公链Sui，并希望使用Move语言进行智能合约开发的用户。

### Sui与Move的关系
- **Move语言的诞生背景**：
  - Move是专为区块链设计的一种新型编程语言，最初由Meta（Facebook）为其Diem（Libra）项目开发，旨在提供一种更安全、灵活且高效的智能合约编写方式。尽管Diem项目未能成功落地，但Move语言作为其核心技术遗产，已经在新兴的区块链平台如Aptos和Sui上得到了延续和发展。
- **Move语言的核心优势**：
  - **安全性**：Move语言内建资源管理模型，通过静态类型检查和所有权机制，避免了常见的智能合约漏洞，如重入攻击和整数溢出。这让开发者可以在编写合约时，更加专注于业务逻辑，而无需担心常见的安全问题。
  - **资源不可复制性**：Move引入了独特的“资源”类型，使资源在智能合约中具备不可复制、不可丢失的特性。这与区块链上的资产概念天然契合，确保了代币、NFT等数字资产的安全性和唯一性。
  - **模块化与可复用性**：Move采用模块化设计，开发者可以将智能合约拆分为多个独立模块，提升代码的可维护性与复用性。通过引入模块系统，开发者能够轻松构建复杂的智能合约，并提高项目的可扩展性。
  - **高效执行**：Move在设计上避免了不必要的计算开销，采用了高效的字节码执行方式。相比传统的智能合约语言，Move的执行速度更快，资源消耗更低，适用于高吞吐量和低延迟需求的去中心化应用（dApp）。
- **Sui平台的选择**：
  - Sui作为支持Move语言的新兴区块链平台，专注于高性能和可扩展性，通过优化区块链共识机制和执行引擎，为开发者提供了一个性能卓越、低延迟的环境。Sui的设计充分利用了Move语言的特性，使得其在DeFi、NFT、链游等场景中展现出独特优势。

### 开发环境的必要性
- **高效开发的基础**：
  - 对于智能合约开发者来说，配置完善的开发环境至关重要。它不仅能够显著提升开发效率，还能减少开发过程中遇到的环境兼容性问题。特别是在Move语言的开发中，搭建好支持Move的Sui环境，能够让开发者专注于合约的逻辑实现与优化，而无需担心工具链配置带来的干扰。
- **支持调试与测试**：
  - 智能合约一旦部署到区块链上，其代码将无法更改。因此，在开发过程中，完善的本地测试和调试环境至关重要。通过搭建本地的Sui节点和使用CLI工具，开发者可以在本地环境中反复测试智能合约，确保其安全性和正确性。
- **增强学习与开发体验**：
  - 完整的开发环境不仅可以帮助新手开发者快速上手，还能为有经验的开发者提供更高效的开发体验。通过使用合适的开发工具（如VS Code、Move Playground），开发者可以获得代码高亮、语法检查、自动补全等功能，大大提升编码效率。


## 2. 基础依赖安装
### 2.1 系统要求
- **支持的操作系统**：
  - macOS、Windows、Linux均可支持Sui开发环境。
- **必备依赖**：
  - Git、Rust编译工具链（根据安装方式）、Homebrew（macOS和linux用户推荐）、 Chocolatey（windows环境）。

### 2.2 安装Rust工具链（非必需）
- **Rust安装步骤**：
  - 通过下面命令安装Rust编译器，适用于macOS、Windows、Linux。
    ```bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```
    > windows 安装请下载和运行[rustup-init.exe](https://static.rust-lang.org/rustup/dist/i686-pc-windows-gnu/rustup-init.exe)，具体参照[官方文档](https://forge.rust-lang.org/infra/other-installation-methods.html#rustup)。
  - 验证安装：
    ```bash
    rustc --version
    ```

## 3. Sui CLI安装与配置
### 3.1 安装Sui CLI
- **macOS、Linux或者Windows Subsystem for Linux安装**：
  - 使用Homebrew安装：
    ```bash
    brew install sui
    ```
- **Windows安装**：
  - 使用Chocolatey安装：
    ```bash
    choco install sui
    ```
- **下载二进制可执行文件安装**（希望自己管理sui，可以考虑以下方式）
    - 导航到 https://github.com/MystenLabs/sui
    - 在右侧窗格中，找到“Releases”部分
    - 单击标记为最新的版本以打开该版本的页面。
    - 在release的**Assets**部分中，选择与您的操作系统相对应的 .tgz压缩文件。
    - 将 .tgz 文件中的所有文件解压到某个位置。
    - 将上述位置配置到系统环境变量PATH中。
- **用Cargo安装**：
    - 运行以下命令从 testnet 分支安装 Sui 二进制文件：
    ```bash
    cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
    ```
- **通过源码安装**：
    可以直接下载源码，在本机进行编译安装，参考[官方文档](https://docs.sui.io/guides/developer/getting-started/sui-install)。

- **验证Sui CLI安装**：
    ```bash
    sui --version
    ```

## 4. Sui客户端基本操作
### 4.1 创建新钱包
- **生成钱包**：
    ```bash
    sui client new-address
    ```
- **查看钱包余额**：
    ```bash
    sui client gas
    ```

### 4.2 连接测试网
- **要检查当前可用的环境别名，请运行以下命令**：
    ```bash
    sui client envs
    ```
- **该命令输出可用的环境别名，其中 (active) 表示当前活动的网络。**
    ```bash
    localnet => http://0.0.0.0:9000 (active)
    devnet => https://fullnode.devnet.sui.io:443
    ```
- **要切换活动网络（如开发网络），请运行以下命令，ALIAS替换为上面的网络名称**：
    ```bash
    sui client switch --env <ALIAS>
    ```
- **请求测试代币**：
    ```bash
    sui client faucet
    ```

## 5. 编写与部署Move智能合约

### 5.1 创建Move项目
- **初始化Move项目**：
    ```bash
    sui move new hellomove
    ```
- **项目结构介绍**：
  - **`sources`**：存放Move源代码的目录，包含智能合约的模块文件。
  - **`tests`**：用于编写Move智能合约的测试用例。
  - **`Move.toml`**：项目的配置文件，定义依赖和构建选项。

### 5.2 编写hellomove智能合约
- **创建hellomove模块**：
  - 在`hellomove/sources`目录下，创建一个新文件`hellomove.move`，并编写以下代码：

    ```move
    module hellomove::hello ;

    use std::ascii::{String, string};
    use sui::object::{Self, UID};
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext};

    public struct Hello has key {
        id: UID,
        say: String
    }

    fun init(ctx: &mut TxContext) {
        let hello_move = Hello {
            id: object::new(ctx),
            say: string(b"helloworld"),
        };
        transfer(hello_move, ctx.sender());
    }
    ```

### 5.3 编译hellomove合约
- **编译合约**：
    - 使用以下命令编译合约：
        ```bash
        sui move build
        ```
    - **编译结果**：
        - 如果成功，控制台会显示编译成功的信息，并生成字节码文件。
        - 检查生成的`bytecode_modules`目录，确保编译后的文件存在。

### 5.4 部署hellomove合约
- **在本地节点部署**：
    - 运行以下命令，将合约发布到本地Sui节点上：
        ```bash
        sui client publish
        ```

- **验证部署成功**：
    - 记录和复制交易hash，Transaction Digest
    - 访问https://suivision.xyz/，查询上述的hash，验证是否发布成功。


## 6. Sui Explorer与开发工具
### 6.1 Sui Explorer https://suivision.xyz/
- **介绍**：Sui Explorer用于查看链上交易、账户和智能合约的状态。
- **使用指南**：通过Sui Explorer验证智能合约部署和交易状态。

### 6.2 集成开发环境（IDE）
- **Visual Studio Code**：安装Move扩展，支持语法高亮与调试。
- **RustRover**：配置Move项目，集成Rust工具链，适合开发Move与Rust联合项目。

## 7. 常见问题与解决方案
### 7.1 环境安装问题
- **网络问题**：网络环境不好，请调整网络。

- **推荐资源**：
  - [Sui官方文档](https://docs.sui.io/)

