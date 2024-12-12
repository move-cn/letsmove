# （十八）Move语言学习笔记：GraphQL for Sui RPC (Beta)

## 背景简介

GraphQL 是由 Facebook（现 Meta）于 2012 年开发并在 2015 年开源的一种数据查询语言。与传统的 REST API 相比，GraphQL 提供了一种更加灵活高效的方式来请求和操作数据。通过其强类型系统和声明式查询语法，开发者可以在一次请求中精准获取所需的数据，避免了冗余数据的传输和多次 API 调用的麻烦。

GraphQL 的发展经历了几个重要阶段：
1. 诞生阶段（2012-2015）
   - GraphQL 诞生于 Facebook 内部，用于解决其移动应用在数据请求上的性能瓶颈。与 REST API 的固定端点设计不同，GraphQL 提供了一个动态单一端点，通过查询语言定义所需数据的结构。
2. 开源推广（2015-2018）
   - 在 2015 年 GraphQL 开源后，其简单直观的语法和高效的数据交互模型迅速吸引了开发者的关注。随着 Relay 和 Apollo 等 GraphQL 工具的出现，生态逐步丰富，GraphQL 开始被广泛应用于 Web 开发中。
3. 成熟与生态扩展（2018-至今）
   - GraphQL 不再局限于 Web 应用，而是逐渐扩展到微服务架构、移动端和区块链等领域。例如，GitHub 和 Shopify 等知名企业率先使用 GraphQL 替代 REST API。2023 年后，GraphQL 逐渐成为新兴区块链平台（如 Sui）的核心 API 查询语言，为去中心化网络提供灵活的交互方式。

## GraphQL在Sui中的应用

GraphQL 被引入 Sui 区块链，旨在提供一种灵活高效的数据交互机制。通过 GraphQL 查询，开发者能够精确访问区块链上的动态数据（如交易、事件、对象等），实现高度自定义的链上分析和数据聚合需求。Sui GraphQL 还支持分片查询、分页和变量定义，为开发者提供更丰富的操作空间，同时优化了区块链节点的查询性能。

GraphQL 的引入不仅加速了 Sui 生态的开发效率，也为去中心化应用（DApps）的构建提供了强有力的支持，特别是在构建 DeFi、NFT 和社交应用时，开发者可以通过简单的查询语句获取复杂的数据组合。

通过本笔记的学习，我们可以了解如何在 Sui 中应用 GraphQL 进行高效开发，同时深入掌握其语法和操作模式。

## 1. Headers（HTTP头）

GraphQL 服务允许通过 HTTP 头对请求行为进行调整。以下是常见头的用途：
- `x-sui-rpc-version`: 指定 RPC 版本（当前仅支持一个版本）。
- `x-sui-rpc-show-usage`: 返回包含查询复杂度的额外信息。

### 示例请求：

```bash
curl -i -X POST https://sui-mainnet.mystenlabs.com/graphql \
     --header 'x-sui-rpc-show-usage: true'                 \
     --header 'Content-Type: application/json'             \
     --data '{
          "query": "query { epoch { referenceGasPrice } }"
     }'
```

### 示例响应：
返回数据包括 `referenceGasPrice` 和额外的查询复杂度信息，例如输入/输出节点数、查询深度等。

## 2. Variables（变量）

变量允许动态输入，用以提高查询的可重用性。定义变量时需使用 `$` 符号，并指定类型（如 `Int`）。变量在查询体中通过名称引用。

### 示例请求：

```graphql
query ($epochID: Int) {
  epoch(id: $epochID) {
    referenceGasPrice
  }
}
```

### 变量输入：

```json
{
   "epochID": 100
}
```

### 注意事项：
- 未声明或赋值的变量会导致查询失败。
- 在线 IDE 可在 Variables 面板输入 JSON 格式变量。

## 3. Fragments（片段）

片段是可重用的查询片段，用于结构化和优化查询。以下片段示例展示了如何查询 Move 值。

### 示例查询：

```graphql
query DynamicField {
  object(
    address: "0xb57fba584a700a5bcb40991e1b2e6bf68b0f3896d767a0da92e69de73de226ac"
  ) {
    dynamicField(
      name: {
        type: "0x2::kiosk::Listing",
        bcs: "NLArx1UJguOUYmXgNG8Pv8KbKXLjWtCi6i0Yeq1VhfwA",
      }
    ) {
      ...DynamicFieldSelect
    }
  }
}

fragment DynamicFieldSelect on DynamicField {
  name {
    ...MoveValueFields
  }
  value {
    ...DynamicFieldValueSelection
  }
}

fragment MoveValueFields on MoveValue {
  type {
    repr
  }
  data
  bcs
}
```

### 特点：
- 使用片段如 `MoveValueFields`，避免冗长重复的字段定义。

## 4. Pagination（分页）

GraphQL 支持分页查询，用于处理大量结果。常见参数包括：
- `first`: 限制返回的最大数量，从开头截取。
- `after`: 从指定游标（不包括）后开始。
- `last`: 限制返回的最大数量，从结尾截取。
- `before`: 从指定游标（不包括）前开始。

### 分页示例：
查询第 97 个 epoch 的交易块：

```graphql
query {
  epoch(id: 97) {
    transactionBlocks(first: 10) {
      pageInfo {
        hasNextPage
        endCursor
      }
      nodes {
        digest
        sender {
          address
        }
        gasInput {
          gasPrice
          gasBudget
        }
      }
    }
  }
}
```

### 注意事项：
- 游标（Cursor）为分页的唯一有效标识，不应手动生成。
- 分页具有一致性，即分页过程中数据保持网络某一检查点的状态。

## 5. Limits（使用限制）

GraphQL 服务对查询进行了以下限制：
- 速率限制：每分钟的最大请求次数。
- 复杂度限制：包括最大查询深度、节点数量和查询负载大小等。

### 示例查询限制：

```graphql
{
  serviceConfig {
    maxQueryDepth
    maxQueryNodes
    maxOutputNodes
    maxPageSize
    requestTimeoutMs
  }
}
```

### 优化建议：
- 简化查询结构以降低复杂度。
- 使用分页避免单次请求返回过多数据。

## 快速入门：探索GraphQL Schema

通过 Sui 提供的在线 IDE，你可以轻松查看支持的 GraphQL schema。

- [主网](https://sui-mainnet.mystenlabs.com/graphql)
- [测试网](https://sui-testnet.mystenlabs.com/graphql)

在 IDE 中：
- 按 `Ctrl+K` 打开 Schema 搜索。
- 点击左上角书本图标查看文档。

### 示例：

1. **获取最新纪元的参考Gas价格**

```graphql
query {
  epoch {
    referenceGasPrice
  }
}
```

2. **查询历史纪元信息**

获取特定纪元（例如第100纪元）的详细信息，包括质押奖励、参考Gas价格、检查点数量和总Gas费用等。

```graphql
query {
  epoch(id: 100) {
    epochId
    totalStakeRewards
    referenceGasPrice
    totalCheckpoints
    totalGasFees
    storageFund {
      totalObjectStorageRebates
      nonRefundableBalance
    }
  }
}
```

3. **基于交易摘要查找交易区块**

通过交易摘要 (digest) 查找交易详细信息，例如 Gas 提供方地址、预算和执行效果。

```graphql
query {
  transactionBlock(digest: "FdKFgsQ9iRrxW6b1dh9WPGuNuaJWMXHJn1wqBQSqVqK2") {
    gasInput {
      gasSponsor {
        address
      }
      gasPrice
      gasBudget
    }
    effects {
      status
      timestamp
      epoch {
        epochId
        referenceGasPrice
      }
    }
  }
}
```

4. **过滤和分页查询交易记录**

查询最近10条非系统交易：

```graphql
query {
  transactionBlocks(last: 10, filter: {kind: PROGRAMMABLE_TX}) {
    nodes {
      digest
      kind {
        __typename
      }
    }
  }
}
```

查询涉及特定对象的交易：

```graphql
query ($objectID: SuiAddress!) {
  transactionBlocks(filter: {changedObject: $objectID}) {
    nodes {
      sender {
        address
      }
      digest
    }
  }
}
```

**变量**：

```json
{
  "objectID": "0x11c6ae8432156527fc2e12e05ac7db79f2e972510a823a4ef2e670f27ad7b52f"
}
```
5. **动态字段与对象操作** 

GraphQL可以通过别名和片段来优化查询结构。例如：

获取动态字段：

```graphql
query DynamicField {
  object(address: "0xb57fba584a700a5bcb40991e1b2e6bf68b0f3896d767a0da92e69de73de226ac") {
    dynamicField(
      name: {
        type: "0x2::kiosk::Listing",
        bcs: "NLArx1UJguOUYmXgNG8Pv8KbKXLjWtCi6i0Yeq1VhfwA"
      }
    ) {
      name {
        ...MoveValueFields
      }
      value {
        __typename
        ... on MoveObject {
          hasPublicTransfer
          contents {
            ...MoveValueFields
          }
        }
      }
    }
  }
}

fragment MoveValueFields on MoveValue {
  type {
    repr
  }
  data
  bcs
}
```
6. **执行交易**

执行交易需要两个参数：序列化的交易数据 (txBytes) 和签名 (signatures)。

```graphql
mutation ($tx: String!, $sigs: [String!]!) {
  executeTransactionBlock(txBytes: $tx, signatures: $sigs) {
    errors
    effects {
      status
      epoch {
        startTimestamp
      }
      gasEffects {
        gasSummary {
          computationCost
        }
      }
    }
  }
}
```
变量：
```
{
  "tx": "AAACACAZXApmrHgzTs3FGDyXWka+wmMCy2IwOdKLmTWHb5PnFQEASlCnLAw4qfzLF3unH9or5/L7YpOlReaSEWfoEwhTqpavSxAAAAAAACCUFUCOn8ljIxcG9O+CA1bzqjunqr4DLDSzSoNCkUvu2AEBAQEBAAEAALNQHmLi4jgC5MuwwmiMvZEeV5kuyh+waCS60voE7fpzAa3v/tOFuqDvQ+bjBpKTfjyL+6yIg+5eC3dKReVwghH/rksQAAAAAAAgxtZtKhXTr1zeFAo1JzEqVKn9J1H74ddbCJNVZGo2I1izUB5i4uI4AuTLsMJojL2RHleZLsofsGgkutL6BO36c+gDAAAAAAAAQEIPAAAAAAAA",
  "sigs": [
    "AB4ZihXxUMSs9Ju5Cstuuf/hvbTvvycuRk2TMuagLYNJgQuAeXmKyJF9DAXUtL8spIsHrDQgemn4NmojcNl8HQ3JFqhnaTC8gMX4fy/rGgqgL6CDcbikawUUjC4zlkflwg=="
  ]
}
```
通过上述案例，开发者可以掌握如何使用GraphQL高效查询和操作Sui区块链资源。GraphQL的灵活性和强大的数据操作能力，为开发Move语言的链上应用提供了重要支持。

总结

通过 GraphQL for Sui RPC，可以灵活地获取区块链数据，适配多种应用场景。掌握 Headers、变量、片段和分页等技巧，能够显著提升查询效率。同时需注意使用限制，以确保服务的高效和稳定。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)