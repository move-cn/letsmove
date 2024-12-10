## 如何使用dapp-kit构建应用

🧑‍💻作者：gracecampo

`dApp Kit` 是一组 React 组件、hooks 和工具，旨在帮助您在 Sui 区块链上构建去中心化应用程序（dApps）。它简化了连接钱包、签署交易和从 RPC 节点获取数据等任务。

### 主要功能：
- **查询 Hooks**：获取 dApp 所需的数据。
- **自动钱包状态管理**：无缝管理钱包连接。
- **支持所有 Sui 钱包**：兼容多种 Sui 钱包。
- **预构建的 React 组件**：使用现成组件加速开发。
- **可定制的 Hooks**：使用低级别的 hooks 创建自定义组件。

### 前置环境：
1. nodejs
2. npm

### 安装：
要开始使用 dApp Kit，您需要安装必要的包：

- 可以使用两种方式安装：

**使用npm安装**
```bash
npm i --save @mysten/dapp-kit @mysten/sui @tanstack/react-query
```
****使用yarn安装****
```bash
yarn add @mysten/dapp-kit @mysten/sui @tanstack/react-query
```
当然官方还提供了pnpm,bun 方式安装，此步只需要按照自己的需要来使用那种工具即可。


### 如何初始化一个前端模板
![img.png](https://img.learnblockchain.cn/attachments/2024/12/tMJaq8Q96752f1c0cbe65.png)
![image.png](https://img.learnblockchain.cn/attachments/2024/12/CS7uSPp06752f1d484ac4.png)
#### 安装依赖
进入到初始化项目中：
```shell
yarn install
```



#### 启动项目
启动项目命令

![img_2.png](https://img.learnblockchain.cn/attachments/2024/12/0gcuiR4A6752f1edda6a0.png)


启动后页面

![img_3.png](https://img.learnblockchain.cn/attachments/2024/12/MtC0sayg6752f1fd32cdf.png)

#### 网络设置文件
```typescript
import { getFullnodeUrl } from "@mysten/sui/client";
import { createNetworkConfig } from "@mysten/dapp-kit";

const { networkConfig, useNetworkVariable, useNetworkVariables } =
  createNetworkConfig({
    devnet: {
      url: getFullnodeUrl("devnet"),
    },
    testnet: {
      url: getFullnodeUrl("testnet"),
    },
    mainnet: {
      url: getFullnodeUrl("mainnet"),
    },
  });

export { useNetworkVariable, useNetworkVariables, networkConfig };

```
使用 `@mysten/dapp-kit` 和 `@mysten/sui/client` 来配置网络连接。

- **getFullnodeUrl**：从 `@mysten/sui/client` 导入的函数，用于获取指定网络（如 `devnet`、`testnet`、`mainnet`）的完整节点 URL。

- **createNetworkConfig**：从 `@mysten/dapp-kit` 导入的函数，用于创建网络配置。它接受一个对象，其中包含不同网络的配置。

- **networkConfig**：包含了不同网络的配置，使用 `createNetworkConfig` 创建。

- **useNetworkVariable 和 useNetworkVariables**：从 `createNetworkConfig` 返回的钩子，用于在应用中访问和使用网络配置变量。

这个配置允许在应用中轻松切换和使用不同的 Sui 网络

钱包状态组件
```typescript jsx
import { useCurrentAccount } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text } from "@radix-ui/themes";
import { OwnedObjects } from "./OwnedObjects";

export function WalletStatus() {
  const account = useCurrentAccount();

  return (
    <Container my="2">
      <Heading mb="2">Wallet Status</Heading>

      {account ? (
        <Flex direction="column">
          <Text>Wallet connected</Text>
          <Text>Address: {account.address}</Text>
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}
      <OwnedObjects />
    </Container>
  );
}

```
React 组件 `WalletStatus`，用于显示钱包的连接状态以及当前连接钱包所拥有的对象。

- **useCurrentAccount**：从 `@mysten/dapp-kit` 导入的钩子，用于获取当前连接的钱包账户信息。

- **条件渲染**：
  - 如果 `account` 存在，显示“Wallet connected”和钱包地址。
  - 如果 `account` 不存在，显示“Wallet not connected”。

- **OwnedObjects**：调用 `OwnedObjects` 组件以显示当前连接钱包所拥有的对象。

- **UI 布局**：使用 `Container`、`Flex` 和 `Text` 组件来组织和显示数据。

地址查询组件
```typescript jsx
import { useCurrentAccount, useSuiClientQuery } from "@mysten/dapp-kit";
import { Flex, Heading, Text } from "@radix-ui/themes";

export function OwnedObjects() {
  const account = useCurrentAccount();
  const { data, isPending, error } = useSuiClientQuery(
    "getOwnedObjects",
    {
      owner: account?.address as string,
    },
    {
      enabled: !!account,
    },
  );

  if (!account) {
    return;
  }

  if (error) {
    return <Flex>Error: {error.message}</Flex>;
  }

  if (isPending || !data) {
    return <Flex>Loading...</Flex>;
  }

  return (
    <Flex direction="column" my="2">
      {data.data.length === 0 ? (
        <Text>No objects owned by the connected wallet</Text>
      ) : (
        <Heading size="4">Objects owned by the connected wallet</Heading>
      )}
      {data.data.map((object) => (
        <Flex key={object.data?.objectId}>
          <Text>Object ID: {object.data?.objectId}</Text>
        </Flex>
      ))}
    </Flex>
  );
}

```
React 组件 `OwnedObjects`，用于显示当前连接钱包所拥有的对象。

- **useCurrentAccount**：从 `@mysten/dapp-kit` 导入的钩子，用于获取当前连接的钱包账户信息。

- **useSuiClientQuery**：用于查询 Sui 区块链上的数据。在这里，它被用来获取当前账户拥有的对象。查询只有在 `account` 存在时才会启用。

- **条件渲染**：
  - 如果没有连接账户，组件将不返回任何内容。
  - 如果查询出错，显示错误信息。
  - 如果查询正在进行或数据尚未加载，显示“Loading...”。
  - 如果数据加载完成，显示拥有的对象列表。如果没有对象，显示一条消息。

- **UI 布局**：使用 `Flex` 和 `Text` 组件来组织和显示数据。
  app组件：
```typescript jsx
import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";

function App() {
  return (
    <>
      <Flex
        position="sticky"
        px="4"
        py="2"
        justify="between"
        style={{
          borderBottom: "1px solid var(--gray-a2)",
        }}
      >
        <Box>
          <Heading>dApp Starter Template</Heading>
        </Box>

        <Box>
          <ConnectButton />
        </Box>
      </Flex>
      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <WalletStatus />
        </Container>
      </Container>
    </>
  );
}

export default App;

```
定义了一个 React 组件 App，使用了 @mysten/dapp-kit 和 @radix-ui/themes 库。以下是代码的关键部分：

ConnectButton：从 @mysten/dapp-kit 导入的组件，用于连接用户的钱包。它会在用户点击后处理连接逻辑，并显示钱包地址。

WalletStatus：这个组件应该用于显示钱包的连接状态或详细信息。

UI 布局：

使用 Flex、Box 和 Container 组件来组织布局。
Flex 用于创建一个粘性头部，包含应用标题和连接按钮。
Container 用于包裹 WalletStatus，并设置一些样式，比如背景颜色和最小高度。

入口页
```typescript jsx
import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";

function App() {
  return (
    <>
      <Flex
        position="sticky"
        px="4"
        py="2"
        justify="between"
        style={{
          borderBottom: "1px solid var(--gray-a2)",
        }}
      >
        <Box>
          <Heading>dApp Starter Template</Heading>
        </Box>

        <Box>
          <ConnectButton />
        </Box>
      </Flex>
      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <WalletStatus />
        </Container>
      </Container>
    </>
  );
}

export default App;

```
代码使用了 @mysten/dapp-kit 和 @radix-ui/themes 库来设置一个基本的 React 组件。它包含一个用于钱包连接的 ConnectButton 和一个显示钱包相关信息的 WalletStatus 组件。

ConnectButton：从 @mysten/dapp-kit 导入的组件，提供一个按钮供用户连接他们的钱包。它处理连接逻辑，并在连接后显示用户的钱包地址。

WalletStatus：预计用于显示已连接钱包的状态或详细信息的组件
### 总结
此章是作为使用dapp-kit的构建应用的入门教程，介绍了根据模板创建一个项目，启动并运行项目。
也通过定义几个组件简单的实践，并介绍下如何使用dapp-kit框架中的几个组件。

[dApp Kit 文档](https://sdk.mystenlabs.com/dapp-kit)。

💧  [HOH水分子公众号](https://mp.weixin.qq.com/s/d0brr-ao6cZ5t8Z5OO1Mog)

🌊  [HOH水分子X账号](https://x.com/0xHOH)

📹  [课程B站账号](https://space.bilibili.com/3493269495352098)

💻  Github仓库 https://github.com/move-cn/letsmove