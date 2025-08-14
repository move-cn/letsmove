# （十七）学习笔记：Sui 网络中的赞助交易以及gas station使用场景介绍

最近在构思HOH水分子社区MOVE共学的最后一个defi项目，考虑的因为是慈善项目，gas费应该减免，所以查阅了一些资料，Sui 网络的赞助交易（Sponsored Transactions）正好可以满足需求，现将学习笔记总结如下：

## 一、基本原理介绍
Sui 网络的赞助交易（Sponsored Transactions）是一种由某个地址（赞助者）支付其他地址（用户）发起交易的 gas 费用的机制。这种机制可以使用户在进行链上交易时无需支付 gas 费用，从而减少 Web 2.0 用户进入 Web 3.0 时遇到的障碍。通过赞助交易，用户无需购买代币就能执行交易，从而降低了进入 Web3 的门槛。

**赞助交易的应用场景**

- 用户发起的交易赞助：为用户支付其发起的交易的 gas 费用。
- 赞助者发起的交易赞助：赞助者为自己发起的交易支付 gas 费用。
- GasData 对象的使用：通过提供一个通配符的 GasData 对象，用户可以使用该对象来支付交易的 gas 费用，前提是 gas 预算足够。

**使用赞助交易的潜在风险**

赞助交易的最大潜在风险是歧义（Equivocation）。歧义发生在用户或赞助者尝试对原始交易中的拥有对象（例如 ObjectID 和 SequenceNumber）进行操控时，从而导致对象状态在多个非最终化的交易中并行使用。这种情况可能导致对象在 Sui 验证者验证时进入锁定状态，进而引发双重花费的风险。

**创建用户发起的赞助交易**

用户发起的赞助交易需要以下步骤：
- 1.	用户初始化一个 GasLessTransactionData 交易。
- 2.	用户将 GasLessTransactionData 发送给赞助者。
- 3.	赞助者验证该交易，构建带有 gas 费用的 TransactionData，然后签名。
- 4.	赞助者将签名的 TransactionData 和签名返回给用户。
- 5.	用户验证并签署 TransactionData，然后通过一个完整节点或赞助者将双重签名的交易发送到 Sui 网络。

GasLessTransactionData 结构体用于描述不包含 GasData 的交易数据，它是用户和赞助者之间的一个接口。
```rust
pub struct GasLessTransactionData {
    pub kind: TransactionKind,
    sender: SuiAddress,
    // 其他字段
}
```
**创建赞助者发起的赞助交易**

赞助者发起的赞助交易需要以下步骤：
- 1.	赞助者构建一个 TransactionData 对象，包含交易详情和相关的 gas 费用数据，并进行签名。
- 2.	赞助者将未签名的 TransactionData 发送给用户。
- 3.	用户检查交易内容并进行签名。
- 4.	用户提交双重签名的交易给 Sui 网络或赞助者。

这种交易形式适用于广告商或其他用例，赞助者可以为特定用户行为提供激励，而无需用户支付 gas 费用。

**使用 GasData 对象赞助交易**

使用 GasData 对象来赞助交易的步骤如下：
- 1.	赞助者向用户提供一个 GasData 对象。
- 2.	用户构建交易数据并签名。
- 3.	用户将交易数据和签名发送给赞助者。
- 4.	赞助者确认交易数据并签名。
- 5.	赞助者提交双重签名的交易到完整节点以执行交易。

GasData 对象本质上是为用户提供一张“空白支票”，用户无需了解或批准具体的 gas 费用，只要预算足够，便可以支付交易的 gas 费用。

**创建 Sui Gas Station**

在 Sui 网络中，Gas Station 用于描述提供用户交易赞助的流程。你可以定制一个 Gas Station 来支持特定的用户功能，例如：
- 实时监控网络的 gas 价格，并提供合适的 gas 费用。
- 跟踪在网络上为用户提供的 gas 使用情况。
- 管理 gas 池，例如使用特定的 gas 对象来降低成本或减少大量被锁定的流动性不足的对象。

**授权和速率限制**

根据 Gas Station 的具体需求，可以应用不同的授权策略来避免恶意攻击。可能的策略包括：
- 限制每个账户或 IP 地址的 gas 请求频率。
- 只接受带有有效授权头的请求，并为其设定不同的速率限制。
- 检测滥用行为，尤其是当用户尝试歧义化交易并锁定对象时，如果检测到此类行为，可以屏蔽该用户或请求者。

**代码示例：创建一个 Sui Gas Station**

以下是 Rust SDK 代码示例，展示如何实现支持赞助交易的 Sui Gas Station。

用户发起的赞助交易：

```rust
pub fn request_gas_and_signature(gasless_tx: GaslessTransaction) -> Result<SenderSignedData, Error>;
```
使用 GasData 对象赞助交易：
```rust
pub fn request_gas(/*要求数据*/) -> Result<GasData, Error>;
```
用户和赞助者发起的双重签名交易：
```rust
pub fn submit_dual_signed_transaction(dual_signed_data: SenderSignedData) -> Result<(Transaction, CertifiedTransactionEffects), Error>;
```
赞助交易的数据结构

以下是用于描述赞助交易的 TransactionData 和 GasData 结构体。

TransactionData 结构体：
```rust
#[derive(Debug, PartialEq, Eq, Hash, Clone, Serialize, Deserialize)]
pub struct TransactionDataV1 {
    pub kind: TransactionKind,
    pub sender: SuiAddress,
    pub gas_data: GasData,
    pub expiration: TransactionExpiration,
}
```
GasData 结构体：
```rust
#[derive(Debug, PartialEq, Eq, Hash, Clone, Serialize, Deserialize)]
pub struct GasData {
    pub payment: Vec<ObjectRef>,
    pub owner: SuiAddress,
    pub price: u64,
    pub budget: u64,
}
```

下面是实战内容，首先我们来看一下sui 官方的ts sdk如何发起一笔赞助交易
[链接](https://sdk.mystenlabs.com/typescript/transaction-building/sponsored-transactions)

```ts
const tx = new Transaction();
 
// ... add some transactions...
 
const kindBytes = await tx.build({ provider, onlyTransactionKind: true });
 
// construct a sponsored transaction from the kind bytes
const sponsoredtx = Transaction.fromKind(kindBytes);
 
// you can now set the sponsored transaction data that is required
sponsoredtx.setSender(sender);
sponsoredtx.setGasOwner(sponsor);
sponsoredtx.setGasPayment(sponsorCoins);
```

## 二、开源gas station部署
其实官网文档写的内容并不多，进一步搜索发现了这个项目,如果你想部署一个开源的gas station，可以考虑这个方案
[sui-gas-pool](https://github.com/MystenLabs/sui-gas-pool)



下面简单说下使用Gas Pool服务（Sui Gas Pool）搭建一个 Gas Station 的详细过程，旨在支持大规模的赞助交易操作。Gas Station 通过管理一组由赞助者地址拥有的 Gas 代币，提供 API 接口来预留 Gas 代币，并支付交易费用。

1. 什么是 Sui Gas Pool？

Sui Gas Pool 是支持大规模赞助交易的服务，其核心是一个数据库，用于管理由赞助者地址持有的 Gas 代币对象。通过优化 Gas 代币管理，Gas Pool 能够同时支持大量交易，并实现高吞吐量。

2. 用户流程

Gas Pool 服务的典型用户交互流程如下：
- 1. 应用准备交易：应用程序或客户端准备一个不含 Gas 支付的交易并发送到内部服务器。
- 2. 内部服务器预留 Gas：内部服务器与 Gas Pool 服务交互，根据指定预算预留 Gas 代币。
- 3. 返回 Gas 数据：Gas Pool 返回预留的 Gas 代币给内部服务器。
- 4. 用户签署交易：应用程序要求用户签署完整交易，并将签署后的交易返回给内部服务器。
- 5. 执行交易：内部服务器将用户签署的交易提交到 Gas Pool，Gas Pool 执行交易并释放使用过的 Gas。

3. Gas Pool 的架构

Gas Pool 服务实例由以下组件组成：
- 1. Redis 存储：存储 Gas 代币对象和预留信息，使用 Lua 脚本管理逻辑。
- 2. Gas Pool 服务器：提供 RPC 接口以处理 Gas 请求和交易执行请求。
- 3. KMS 辅助服务（可选）：通过云端密钥管理服务（如 AWS KMS）安全地管理和签署交易。
- 4. Gas Pool 初始化程序：管理 Gas Pool 的初始化和资金添加。

4. Gas Pool 核心组件详解

4.1 Redis 存储

- 用于存储 Gas 代币对象、预留信息等持久化数据。
- 使用 Lua 脚本控制逻辑，包括：
- 预留 Gas。
- 释放过期或使用完的 Gas。

4.2 Gas Pool 服务器

- RPC 接口：通过 JSON-RPC 接收请求，包括 Gas 预留、交易执行等。
- 自动管理 Gas：执行交易后自动释放 Gas。
- 健康检查：提供 GET 接口检测服务状态。

主要接口：
1.	预留 Gas 请求 (POST /v1/reserve_gas)：
- 请求参数：
- gas_budget：预算（Gas 数量）。
- reserve_duration_secs：预留持续时间。
- 返回：
- 预留的 Gas 信息或错误信息。
2.	执行交易请求 (POST /v1/execute_tx)：
- 请求参数：
- reservation_id：预留 ID。
- tx_bytes：交易数据。
- user_sig：用户签名。
- 返回：
- 交易结果或错误信息。

4.3 Gas Pool 初始化程序

- 初始化 Gas Pool：将赞助者地址持有的代币分割为小额 Gas 代币并添加到 Pool 中。
- 动态添加资金：检测新资金并将其分割为 Gas 代币。
- 并行分割代币：加速初始化过程。
- 锁机制：确保同时只有一个初始化任务在运行。

5. 部署步骤

以下是搭建 Gas Station 的完整部署流程：
1.	生成或获取赞助者地址的密钥对：
- 如果使用内存签名器，可手动生成密钥对。
- 如果使用 KMS，可从云服务商获取实例。
2.	为地址添加初始资金：
- 发送充足的 SUI 代币到赞助者地址。
3.	部署 Redis 实例：
- 用于存储 Gas 代币和预留信息。
4.	创建 YAML 配置文件：
- 使用工具生成示例配置文件：
```bash
tool generate-sample-config --config-path sample.yaml --with-sidecar-signer
```

5.	设置 RPC 服务的安全令牌：
- 为 RPC 服务选择一个安全的密钥，并将其设置为 GAS_STATION_AUTH 环境变量。
6.	部署 Gas Pool 服务器：
- 启动 Gas Station 服务实例，连接 Redis 和全节点。

示例配置文件：
```yaml
signer-config:
  sidecar:
    sidecar_url: "http://localhost:3000"
rpc-host-ip: 0.0.0.0
rpc-port: 9527
metrics-port: 9184
gas-pool-config:
  redis:
    redis_url: "redis://127.0.0.1"
fullnode-url: "http://localhost:9000"
coin-init-config:
  target-init-balance: 100000000
  refresh-interval-sec: 86400
daily-gas-usage-cap: 1500000000000
```
6. 注意事项

- 安全性：
- RPC 服务应启用权限控制，防止未经授权的访问。
- 密钥管理使用 KMS 比内存更安全。
- 资金管理：
- 定期检查和补充 Gas Pool 资金。
- 设置每日 Gas 使用上限，防止超额消耗。
- 服务扩展：
- Redis 和 Gas Pool 服务器支持多实例部署，提升并发能力。
- 自动释放过期的 Gas 预留以优化资源使用。

通过以上步骤，可成功部署和运行一个高效的 Sui Gas Station，用于支持大规模的赞助交易，为用户降低操作门槛，同时为开发者提供可靠的基础设施支持。

再进一步研究，发现了这个项目，连部署都省了
[Shinami Gas Station](https://docs.shinami.com/docs/sui-gas-station-faq)

这是一个托管式的gas station，注册app之后就能使用，使用方式如下：

学习笔记：Shinami Gas Station 使用指南

1. 创建资金账户（Fund）

- 在 Sui Gas Station 页面点击 Funds 标签。
- 每个网络（Testnet 或 Mainnet）可以创建最多 10 个资金账户。
- Testnet 提供免费 SUI，供测试使用，但 Mainnet 不提供。

**生成资金存款地址**

- 创建资金账户后，点击 View 或 + Add Gas Credits 以查看资金详细信息。
- 第一次访问时会生成存款地址，后续存款必须使用该地址。
- 存款地址为每个资金账户唯一，仅供赞助交易使用，无法提取。

**存款建议**

- 小额多次存款，例如，足够支持 1-2 周的使用量，便于监控余额和调整预算。

2. 查看资金存款历史

- 在 Funds 标签页中，点击资金账户右侧的 View。
- 弹出的窗口中切换到 Deposit History 标签页即可查看存款记录。

3. 使用资金赞助交易

- 配置具有 Gas Station 权限的 API 访问密钥 并绑定到特定资金账户。
- 每次调用 API 请求时，自动使用密钥绑定的资金账户进行交易赞助。

查看密钥绑定的资金账户

- 在 Access Keys 页面，点击密钥左侧的 + 展开编辑面板。
- 查看该密钥的 Gas Station rights 所绑定的资金账户。

4. 监控资金余额与支出

**资金余额**

1.	在 Shinami Dashboard 的 Funds 标签页查看：
- Gas Credits Available: 可用余额。
- Gas Credits in Flight: 正在使用的赞助金额。
2.	通过 API 调用 gas_getFund 请求查询余额。

**近期支出**

- 在 Sponsorship Insights 标签页，选择网络和时间范围查看：
- Total sponsorship cost: 总支出。
- Average sponsorship cost: 平均每笔赞助成本。
- 支出随时间的趋势图 Total sponsorship spend。

5. 查看单笔交易

- In-flight Transactions：显示活跃但未使用的赞助。
- 例如，用户未签名或未执行的交易。
- Completed Transactions：查看已完成或过期的赞助交易。
- 支持按发送方、交易摘要或资金账户名搜索。
- 数据保留最近 14 天或 10,000 条交易记录。

6. 监控 API 请求、错误与延迟

在 API Insights 标签页，提供以下信息：

**过滤和指标**

- 过滤条件：网络、密钥、方法或时间范围。
- 查看错误率、延迟和请求量的趋势。

**主要图表**

- Request count by method：按方法统计请求数量。
- Error count by JSON RPC error code：按错误代码统计 JSON-RPC 错误。
- Error ratio by method：按方法统计错误比例。
- Requests latency by method：50% 和 95% 分位的请求延迟。
- Successful requests latency：仅成功请求的延迟。
- Requests with non-rate-limit errors latency：排除速率限制错误后的延迟。

7. 使用 Shinami Gas Station 的注意事项

- 资金账户存款仅供赞助交易使用，无法撤回。
- 数据监控工具提供全面支持，包括交易、资金与 API 使用情况。
- 为确保安全性，应选择高强度密钥和私密存储策略。

通过 Shinami Gas Station，可高效管理 Sui 网络上的交易赞助，为去中心化应用提供可靠的服务支持。

------
以上就是使用Sui 网络中的赞助交易的学习笔记，后续介绍了官方的支持策略、开源gas station和托管式gas station三种方式，以便能更好的再实战中进行应用。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)