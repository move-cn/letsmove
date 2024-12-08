---
title: sui-move基础（六）：letsmove-task5
date: 2024-11-24 17:27:00
tags:
---

# sui-move基础（七）：letsmove-task6

### 需求

- 完成 dapp-kit 学习
- 完成 Sui SDK 学习
- 完成 PTB的概念学习
- 完成 Navi Protocol 学习
- 在 dapp-kit里面用chrome钱包签名提交
- 完成 必须在同一个PTB完成 Navi SDK 1.[存入Navi Protocol 1 SUI]  2.[借出当前日期的USDC 0.[月][天][小时] 的 USDC ]
  3.[然后在存入等额的USDC]

### 写在前面

在任务描述中，已经给了我们一些进行学习的相关资料。

因为task6涉及到的内容比较多，所以还是建议都大致浏览一下，其中的NAVI book和dapp-kit部分更是需要着重关注，仔细阅读一下。

其实，如果相关经验的话，例如将训练营task作为起点的程序员，想要完成本节任务是十分困难的。而在task之外，补充相关知识也是非常重要的。毕竟，学习才是主要的目的（在拥有足够赚取报酬的代码和知识水平之前），task只是一个引导我们学习的路径罢了。

在这里，我仍然将任务指南贴出来：

- [sui sdk](https://sdk.mystenlabs.com/typescript)
- [ptb sdk](https://sdk.mystenlabs.com/typescript/transaction-building/basics)
- [ptb concepts](https://docs.sui.io/concepts/transactions/prog-txn-blocks)
- [navi-sdk](https://github.com/naviprotocol/navi-sdk)
- [navi-docs](https://naviprotocol.gitbook.io/navi-protocol-developer-docs/how-to-interact-with-the-contract/navi-sdk/api-interface)

另外，尤其推荐观看uvd老师的相关视频教程，这里我贴出与本节最相关的一个教程：

https://www.bilibili.com/video/BV1DmmyYvEnC/?spm_id_from=333.999.0.0&vd_source=e4ecd9395f6e61a139c766490968f125

### 概述

在最开始，对于如何进行一个dapp的开发，我们肯定是十分迷茫的。

幸运的是，我们相对而言不用这么迷茫，sui已经有了dapp开发的脚手架，我们不用像最开始的冒险家那样面对一片陌生的新大陆。

在上述uvd老师的视频里，介绍了dapp开发的脚手架：dapp-kit ， 我在这里对如何下载进行一个简要的介绍：

#### dapp-kit

1. 准备工作

    - 安装必要的工具
        确保你有以下开发环境：

        Node.js (版本不宜过旧)
        npm 或 yarn

    - 安装 dapp-kit
        在项目目录中运行以下命令：
        npm i --save @mysten/dapp-kit @mysten/sui @tanstack/react-query

2. 创建项目

    在终端运行：

    npm create @mysten/dapp

    控制台会引导你创建一个新的 dApp 项目。

    创建新的 dApp 时，你有以下模板可供选择：

    - react-client-dapp：一个基本的 React dApp，用于获取连接的钱包拥有的对象列表。

    - react-e2e-counter：一个端到端示例，其中包含 Move 代码和简单计数器应用程序的 UI。

    就本task而言，选择react-client-dapp即可。

3. 项目结构

    创建项目后，你将看到：

    ```bash
    my-first-sui-dapp$ tree
    .
    ├── README.md
    ├── index.html
    ├── package.json
    ├── prettier.config.cjs
    ├── src
    │   ├── App.tsx
    │   ├── OwnedObjects.tsx
    │   ├── WalletStatus.tsx
    │   ├── main.tsx
    │   ├── networkConfig.ts
    │   └── vite-env.d.ts
    ├── tsconfig.json
    ├── tsconfig.node.json
    └── vite.config.ts

    1 directory, 13 files
    ```

    这是为我们自动创建的模板，我们可以在它的基础上进行修改。

### PTB与NAVI

那么在正式开始编码之前，我们先了解一下Programmable Transaction Block (PTB)和Sui上的NAVI Protocol。

#### PTB

Programmable Transaction Block (PTB) 是 Sui 网络中的一种强大工具，允许开发者在单个交易中包含多个操作。PTB 通过将多个交易命令链接在一起，提供了一个灵活且高效的方式来生成交易。每个 PTB 可以执行多达 1024 个独特的操作，显著降低了 gas 费用并加快了执行速度。PTB 的设计保证了交易的原子性，如果其中一个命令失败，整个块将失败，且不会应用任何效果。

PTB 的主要特性

- 模块化设计:

    PTB 是由一组操作和指令组成的事务单元，每个操作可以执行独立的功能，如调用 Move 合约、转账资产等。
    通过组合多个操作，开发者可以实现复杂的逻辑，同时保持事务的原子性。

- 原子性:

    PTB 中的所有操作要么全部成功执行，要么全部回滚。这种设计保证了状态的一致性，非常适合构建需要强一致性保证的应用。

- 灵活的组合性:

    PTB 可以包含多个输入（如代币、对象）和多个输出（如新生成的对象或资产）。
    支持跨模块调用，实现合约之间的互操作。
    
- 高性能:

    PTB 的设计充分利用了 Sui 的并行执行引擎。通过对事务依赖的静态分析，PTB 能够最大化并行度，提升执行效率。

#### NAVI Protocol

NAVI Protocol 是构建于 Sui 区块链之上的一站式去中心化流动性协议，为用户提供高效的资产借贷和流动性管理服务。NAVI 的设计目标是通过创新的去中心化金融（DeFi）基础设施，为用户提供无中介的资产操作，同时优化安全性和资本效率。

核心功能

- 借贷市场：

    用户可以通过 NAVI 提供或借入多种数字资产，收益来源于利息。
    提供流动性时，用户会获得“Navi 收据代币”（例如 nSUI），作为其在流动性池中的份额证明，这些代币可以用作抵押品​。

- 自动杠杆金库（Automatic Leverage Vaults）：

    用户可以在 NAVI 中使用低利率资产借贷进行杠杆操作，优化资产收益，比如参与质押奖励或流动性挖矿​。

- 隔离模式（Isolation Market）：

    NAVI 支持在特定的隔离市场中列出新资产，设定债务上限（Debt Ceiling）以限制波动性资产的借贷风险。这种机制增强了平台的安全性​。

- 灵活的治理机制：

    持有原生治理代币 NAVX 的用户可以参与投票，决定如利率设定、新资产支持和抵押率调整等关键事项​。

### 任务指南

那么如何完成要求的任务呢？

我们可以分两个模块来完成：

- 第一个模块用于构建PTB，我们将PTB进行的操作都在这个模块定义。

- 第二个模块用于调用执行PTB，在这个模块中，我们进行钱包连接和前端调用等操作。

而对于第一个模块，可以分为以下几个步骤：

- 定义 PTB

    - Step 1: 存入 1 SUI 到 Navi Protocol

    - Step 2: 借出 USDC

    - Step 3: 再次存入等量的 USDC

    - Step 4: 提交 PTB ，签名并执行交易

任务要求我们进行日期计算，我们可以将计算放在PTB中，但为了模块化考虑，我们在另一个模块中完成它。

对于这个模块，我们作此建构：

- 动态金额计算: 
    
    调用 calculateBorrowAmount 根据当前时间生成借贷金额，格式为 0.MMDDHH。

- 连接钱包:

    使用 useWallets 获取支持的钱包列表。
    用户选择钱包后，通过 connect 方法完成连接。
    在连接成功后显示用户的钱包地址。

- 交易 UI:

    展示用户需要完成的交易流程。
    通过按钮点击触发 mainAction，完成 PTB 事务的签名与提交。

- PTB 提交:

    mainAction 是具体实现事务的核心逻辑，负责：
    组合事务（如存入 SUI、借出 USDC 等）。
    调用 signAndExecuteTransaction 提交事务。

### 代码实现

因为之前我们使用dap-kit进行了初步的预构建，
这时我们只需要在其基础上进行修改即可。

#### PTB实现

我们新增一个文件，NAVI.ts：

```typescript
import { Transaction } from '@mysten/sui/transactions';
import { depositCoin, borrowCoin, } from 'navi-sdk/dist/libs/PTB'
import { Sui, wUSDC } from "navi-sdk/dist/address";
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'


export const mainAction = async (account: any, { signAndExecute, usdcAmount, onSuccess = () => { } }: {
    signAndExecute: any;
    usdcAmount: number;
    onSuccess?: (result: any) => void;
    onError?: (result: any) => void;
}) => {

    if (!account) {
        postMessage("Please connect your wallet first");
        return;
    }


    const tx = new Transaction();

    tx.setSender(account.address);

    // 获取池配置
    const SuiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wUSDCPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

    if (!SuiPool || !wUSDCPool) {
        throw new Error("Invalid pool configuration");
    }

    // 设置gas
    tx.setGasBudget(1e9);

    try {
        // 分离出1sui
        const [sui] = tx.splitCoins(tx.gas, [1e9]);

        console.log("Checking object existence...");
        const suiObject = await tx.object(sui);
        if (!suiObject) {
            throw new Error(`Object ${sui} does not exist`);
        }

        // 将其存入navi
        await depositCoin(tx as any, SuiPool, sui, 1e9);

        // 借出 usdc
        const [usdc_coin] = await borrowCoin(tx as any, wUSDCPool, usdcAmount);

        // 存入 usdc
        await depositCoin(tx as any, wUSDCPool, usdc_coin, usdcAmount);

        // 签名执行交易
        await signAndExecute({
            transaction: tx, chain: "sui:mainnet"
        }, {
            onSuccess,
            onError: (error: any) => { // 为 error 参数指定类型
                console.error("Transaction failed:", error);
                postMessage(error.message || "Transaction failed");
            },
        });
    } catch (error) {
        console.error("Transaction failed:", error);
        postMessage(error instanceof Error ? error.message : "An unknown error occurred");
    }

}

```

简而言之，在这个 `NAVI.ts` 中，我们构建了一个PTB，并在其中
编写了所有我们需要进行的交易，并最终签名并执行。

#### 前端实现

前端调用模块我们可以直接改造App.tsx：

```typescript
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text, Button } from "@radix-ui/themes";
import { ConnectButton, useConnectWallet, useWallets } from '@mysten/dapp-kit';
import { wUSDC } from "navi-sdk/dist/address";
import { mainAction } from "./NAVI.ts";

const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
  const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
  return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

const Execute = () => {

  const wallets = useWallets();
  const { mutate: connect } = useConnectWallet();

  const account = useCurrentAccount();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();

  const date = new Date();
  const usdcAmount = calculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());

  return (


    <Container my="2">
      <Heading mb="2">Wallet Status</Heading>

      <div style={{ padding: 20 }}>
        <ConnectButton />
        <ul>
          {wallets.map((wallet) => (
            <li key={wallet.name}>
              <button
                onClick={() => {
                  connect(
                    { wallet },
                    {
                      onSuccess: () => console.log('connected'),
                    },
                  );
                }}
              >
                Connect to {wallet.name}
              </button>
            </li>
          ))}
        </ul>
      </div>

      {account ? (
        <Flex direction="column">
          <Text>Wallet connected</Text>
          <Text>Address: {account.address}</Text>
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}

      <Heading mb="2">Transaction Action</Heading>
      {account ? (
        <Flex direction="column">
          <Heading mb="2">执行交易</Heading>
          <Flex direction="column">
            <Text>1. [存入Navi Protocol 1 SUI] </Text>
            <Text>{`2.[借出当前日期的USDC ${usdcAmount} 的 USDC ]`}</Text>
            <Text>3.[然后在存入等额的USDC]</Text>
          </Flex>
          <Button
            size="3"
            onClick={() => {
              mainAction(account, {
                signAndExecute, usdcAmount, onSuccess(result) {
                  console.log(result, 'Transaction success!')
                }, onError(error) {
                  console.log(error, 'Something went wrong!')
                },
              });
            }}
            style={{ cursor: 'pointer' }}
          >
            <Text>点击执行此交易</Text>
          </Button>
        </Flex>
      ) : null}
    </Container>
  );
}

export default Execute;

```

我们定义一个 `calculateBorrowAmount` 用于计算需要存入的金额，注意需要乘以wUSDC的精度 `10 ** wUSDC.decimal`。

由于需要使用chrome钱包进行交易，我们编写一个连接钱包的逻辑：

```typescript
<div style={{ padding: 20 }}>
        <ConnectButton />
        <ul>
          {wallets.map((wallet) => (
            <li key={wallet.name}>
              <button
                onClick={() => {
                  connect(
                    { wallet },
                    {
                      onSuccess: () => console.log('connected'),
                    },
                  );
                }}
              >
                Connect to {wallet.name}
              </button>
            </li>
          ))}
        </ul>
      </div>
```

这一部分的代码可以直接在官方文档中找到:https://sdk.mystenlabs.com/dapp-kit/wallet-hooks/useConnectWallet。

下面的Wallet Status代码可以直接从已经存在的WalletStatus.tsx中迁移过来。

最后就是打印一些log，并执行调用`mainAction`的逻辑。

至此，task6的编写便告完成。

### 调用

在相应路径下运行 `npm run`，然后来到前端页面进行调用即可。

如果你发现调用失败的话，或许你需要注意main.tsx中的 defaultNetwork 定义。