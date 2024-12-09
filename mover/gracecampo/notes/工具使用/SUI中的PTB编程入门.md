# SUI中的PTB编程入门

🧑‍💻作者：gracecampo
## 什么是PTB

### PTB定义
PTB(Building Programmable Transaction Blocks) 的中文直译是可编程的事物块，这种描述对于sui新人来说很具备迷惑性。

[官方释义]

可编程交易块（PTB）是 Sui 区块链中的一种交易形式，允许在单个交易中执行多个命令。PTB 可以在不发布新的 Move 包的情况下调用多个 Move 函数、管理对象和管理代币。
它们设计为轻量级且灵活，适用于自动化和交易构建器。

PTB 的特点包括：

- 由多个按顺序链接的命令组成，但是*命令的执行时串行的*。
- 交易是原子的，如果一个命令失败，整个块都会失败。
- 可以在一次执行中执行多达 1024 个独特的操作，这比传统区块链上的单独交易更具成本效益。

有关 PTB 的更多详细信息，请参阅 [Programmable Transaction Blocks](https://docs.sui.io/concepts/transactions/prog-txn-blocks)。

### PTB如何提高交易的效率和降低费用？

可编程交易块（PTB）通过以下方式提高交易效率和降低费用：

1. **批量操作**：PTB 可以在单个交易中执行多达 1024 个操作，这意味着可以将多个交易合并为一个交易块。这种批量处理减少了单独执行每个交易所需的时间和资源。

2. **原子性**：所有命令在一个交易中执行，如果一个命令失败，整个交易块都会失败。这确保了交易的一致性和可靠性，避免了部分执行的情况。

3. **降低 gas 费用**：由于多个操作被合并为一个交易执行，PTB 的 gas 费用通常低于在传统区块链上单独执行每个交易的费用。这是因为合并交易减少了重复的操作和资源消耗。

4. **并行化**：PTB 支持并行执行多个独立的交易，这提高了网络的吞吐量和效率，进一步降低了交易费用。

[个人理解]
相比单命令执行，PTB可以为我们节省gas,但是也相对对于开发人员的水平提高了要求，要求开发人员需要有足够的知识储备，以及对代码逻辑的理解。

我们可以简单的理解为PTB是一种在SUI上的构建交易工具，它允许我们在一个事务内，执行多条命令，将之前我们操作区块链时，复杂的交易流程，组合为多条命令的
命令集合，然后统一在一个交易区块内进行执行。

PTB内部命令是按照顺序执行的，就是说PTB的执行是串行的。 后一步的命令依赖于前一步命令的结果，故而说是保持了交易的一致性和可靠性。

但PTB是并行化的，这个好像又是和上面的冲突，实际PTB并行的意思是在sui网络中，可以并行执行多个PTB块，就是说PTB内部命令是串行的，但是网路支持并行的
执行多个PTB块。

## 如何使用

我们使用PTB可以有两种方式：

使用命令行构建一个PTB块

使用TypeScript SDK构建PTB块

### 命令行使用PTB

我们可以先来查看命令行关于PTB的帮助信息

```text

sui client ptb -h

Build, preview, and execute programmable transaction blocks. Depending on your shell, you might have to use quotes around arrays or other passed values. Use --help to see examples for how to use the core functionality of this
command.

Usage: sui client ptb [OPTIONS]

Options:
      --assign <NAME> <VALUE>                                              定义一个变量,可以在之后的命令中引用
      --dry-run                                                            PTB模拟运行
      --dev-inspect                                                        对PTB执行dev检查
      --gas-coin <ID>                                                      要使用的汽油币的对象ID。如果没有指定，它将尝试使用它发现的第一个至少具有所需天然气预算余额的天然气币。
      --gas-budget <MIST>                                                  此PTB的可选气体预算（在MIST中）。如果没有提供天然气预算，该工具将首先进行模拟运行以估算天然气成本，然后执行交易。
                                                                           请注意，由于额外的模拟运行调用，这会带来较小的性能成本。                                                                     
      --make-move-vec <TYPE> <[VALUES]>                                    给定相同类型的n个值，它构造一个向量。对于非对象或空向量，必须指定类型标记。
      --merge-coins <INTO_COIN> <[COIN OBJECTS]>                           将N个硬币合并到提供的硬币中。
      --move-call <PACKAGE::MODULE::FUNCTION> <TYPE_ARGS> <FUNCTION_ARGS>  对函数进行移动调用。
      --split-coins <COIN> <[AMOUNT]>                                      根据给定的金额数组将硬币分成N个硬币。
      --transfer-objects <[OBJECTS]> <TO>                                  将对象传输到指定地址。
      --publish <MOVE_PACKAGE_PATH>                                        发布Move包：源码所在的文件夹路径作为输入。
      --upgrade <MOVE_PACKAGE_PATH>                                        升级Move软件包：源码所在的文件夹路径作为输入。
      --preview                                                            预览PTB事务列表，而不是执行它们。
      --serialize-unsigned-transaction                                     不执行事务，而是使用base64编码对未签名事务数据的bcs字节进行序列化。
      --serialize-signed-transaction                                       不执行事务，而是使用base64编码对已签名事务数据的bcs字节进行序列化。
      --summary                                                            仅显示简短摘要（摘要、执行状态、气体成本）。当您需要所有事务数据和执行效果时，不要使用此标志。
      --warn-shadows                                                       当多次声明同一变量名时，启用阴影警告。默认情况下为关闭。
      --json                                                               以json格式返回命令输出。
  -h, --help                                                               打印帮助（详见“--help”）
```

命令结果截图：


![ptb-help.png](https://img.learnblockchain.cn/attachments/2024/12/RnQjCZZC67542e98896fa.png)

####  PTB示例： 将分割一个 gas coin 并将其转移到指定地址：

```bash
sui client ptb \
--assign to_address @0x49e8d1c3e6596eb7926b2d1b22cd03eb12962d4ea5b5df8572da3e6fcfe60af5 \
--split-coins gas [1000,2000,3000] \
--assign coins \
--transfer-objects  [coins.0,coins.1,coins.2] to_address \
--gas-budget 5000000 \
--summary
```
### 解释：
- `--assign to_address @0x...`：指定接收地址。
- `--split-coins gas [1000,2000,3000]`：将 gas coin 分割成三个不同的值。
- `--assign coins`：将分割后的 coin 结果赋值给变量 `coins`。
- `--transfer-objects to_address [coins.0, coins.1, coins.2]`：将分割后的 coins 转移到指定地址。
- `--gas-budget 5000000`：设置 gas 预算。
- `--summary`：仅显示执行摘要。

执行结果：
```text
[warn] Client/Server api version mismatch, client api version : 1.37.2, server api version : 1.38.3
╭──────────────────────────────────────────────────────╮
│ PTB Execution Summary                                │
├──────────────────────────────────────────────────────┤
│ Digest: 45AzyKXq3F8bfHmiD33iA5YdoPqVQuz2zftX6h6N7BRs │
│ Status: success                                      │
│ Gas Cost Summary:                                    │
│    Storage Cost: 3952000                             │
│    Computation Cost: 1000000                         │
│    Storage Rebate: 978120                            │
│    Non-refundable Storage Fee: 9880                  │
╰──────────────────────────────────────────────────────╯
```

这个示例展示了如何使用 Sui CLI 构建和执行一个简单的 PTB,此PTB执行了两个命令，--split-coins，--transfer-objects。

并使用--assign 声明了一个地址变量：`to_address` 和 `coins`变量，在使用--transfer-objects命令时，将coins和to_address变量作为入参。

#### PTB示例: 发布合约,并调用合约,然后铸造一个NFT,并将其转移到指定地址

>>发布合约

```shell
sui client ptb \
--move-call sui::tx_context::sender \
--assign sender \
--publish "包路径" \
--assign upgrade_cap \
--transfer-objects [upgrade_cap] sender \
--gas-budget \
--summary
```

此PTB块，执行了发布合约的命令，并将upgrade_cap对象转移至调用者地址
```text
╭──────────────────────────────────────────────────────╮
│ PTB Execution Summary                                │
├──────────────────────────────────────────────────────┤
│ Digest: FPMBYZNReDpFLSSosTcoEZnWbsNZzDq6UeLnod6iFqMq │
│ Status: success                                      │
│ Gas Cost Summary:                                    │
│    Storage Cost: 12084000                            │
│    Computation Cost: 1000000                         │
│    Storage Rebate: 978120                            │
│    Non-refundable Storage Fee: 9880                  │
╰──────────────────────────────────────────────────────╯
```
>> 调用合约

```shell
sui client ptb \
--move-call <PACKAGE-ID>::<MODULE>::<FUNCTION> <ARGS>  \
--assign result \
--transfer-objects [result] sender \
--gas-budget 5000000 \
--summary
```
命令例子:
```shell
sui client ptb \
--move-call 0xc90615c1cbbc245cb6696c4164878aa89441f7531ec9654e9a0e5b3b839477fd::gracecampo_nft::mint_to_sender "'ptbnft'" "'ptb-desc'" "'https://pics0.baidu.com/feed/c8ea15ce36d3d539ff5971f5df97085e352ab0bb.jpeg'" \
--gas-budget 5000000 \
--summary
```
此命令调用了gracecampo_nft模块的mint_to_sender函数，并传入NFT名称，NFT描述，NFT的URL链接

其他的命令都可以使用这种方式调用，感兴趣的可以自行尝试。

###  TypeScript SDK 使用PTB
#### 初始化一个node项目

创建并进入项目目录，初始化项目
```shell
 mkdir ptb-project && cd ptb-project && npm init -y
```

![ptb-typeScript.png](https://img.learnblockchain.cn/attachments/2024/12/pBizZlWH67542ec146a97.png)

#### 引入依赖
```shell
npm install @mysten/sui
```
安装后查看package.json,此时已经引入了sui的sdk依赖。

![ptb-package.png](https://img.learnblockchain.cn/attachments/2024/12/pdub75x367542eaf73465.png)

#### 编写PTB函数
创建一个app.js代码
```typescript
import { Transaction } from '@mysten/sui/transactions';
import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';
import { getFaucetHost, requestSuiFromFaucetV0 } from '@mysten/sui/faucet';
// 创建一个账号
const keypair = new Ed25519Keypair();
const secretKey = keypair.getSecretKey();
console.log('Secret Key:', secretKey);
const address = keypair.getPublicKey().toSuiAddress();

//获取水龙头代币
await requestSuiFromFaucetV0({
    host: getFaucetHost('testnet'),
    recipient: address,
});

//创建一个客户端
const client = new SuiClient({ url: getFullnodeUrl('testnet') });

//获取地址余额
let balance = await client.getCoins({
    owner: address,
});
console.log(balance);
//创建交易
const tx = new Transaction();
//分割coin
const [coin] = tx.splitCoins(tx.gas, [100]);
// 执行函数
tx.transferObjects([coin], address);
//调用铸造NFT
tx.moveCall({
    target: '0xc90615c1cbbc245cb6696c4164878aa89441f7531ec9654e9a0e5b3b839477fd::gracecampo_nft::mint_to_public',
    arguments: [
        tx.pure.string('ptbnft1'),
        tx.pure.string('ptb-desc'),
        tx.pure.string('https://pics0.baidu.com/feed/c8ea15ce36d3d539ff5971f5df97085e352ab0bb.jpeg'),
        tx.pure.address('0x5a684e30c7760309906a4ed7b25e2d0c4bbeff74a3995a8ccbfe49be084d16d0')
    ]
});
//设置gas费
tx.setGasPrice(1000);
tx.setGasBudget(10000000);
//签名并发送事务到链上
const result =await client.signAndExecuteTransaction({ signer: keypair, transaction: tx });

console.log(result);
```

该代码使用使用`new Ed25519Keypair()` 创建一个地址，并通过`requestSuiFromFaucetV0`获取水龙头代币，并调用`splitCoins`分割代币，在通过
tx.moveCall调用合约铸造NFT。

此代码通过PTB编程，将三个命令进行组合，在一个事务块中执行。


![ptb-tran.png](https://img.learnblockchain.cn/attachments/2024/12/3EjFpiJk67542ecf32cbb.png)

## 总结
Programmable Transaction Blocks (PTBs) 在 Sui 中提供了许多优点：

1. **高效的批处理**：PTBs 允许在单个交易中调用多达 1024 个不同的 Move 函数。这种批处理能力显著提高了交易的效率和降低了 gas 费用。[了解更多](https://docs.sui.io/concepts/transactions/prog-txn-blocks)

2. **原子性**：PTBs 确保所有命令的效果在交易结束时原子性地应用。如果其中一个命令失败，整个块将失败，不会应用任何效果。[了解更多](https://github.com/sui-foundation/sui-move-intro-course/blob/ea12e0a1141763a1c4666b19ffe56fcfd07662cb/unit-five/lessons/1_programmable_transaction_block.md)

3. **灵活性和可组合性**：PTBs 允许开发者在不发布新的 Move 包的情况下管理对象和调用多个 Move 函数，为开发者提供了更大的灵活性。[了解更多](https://blog.sui.io/programmable-transaction-blocks-explained/)

4. **降低费用**：通过将多个交易合并为一个 PTB，开发者可以显著降低交易费用，特别是在 DeFi 应用中，这种优势尤为明显。[了解更多](https://blog.sui.io/defi-programmable-transaction-blocks/)

5. **简化代码**：PTBs 将组合从智能合约级别移到交易级别，简化了代码结构，提高了可读性。[了解更多](https://sui.io/move)

这些特性使得 PTBs 成为在 Sui 上开发高效、复杂应用的强大工具。

通过学习PTB编程将在我们之后的编程活动中，提供便利性。

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove