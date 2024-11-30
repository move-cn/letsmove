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

使用npm安装
```bash
npm install --save @mysten/dapp-kit @mysten/sui.js @tanstack/react-query
```
使用yarn安装
```bash
yarn add @mysten/dapp-kit @mysten/sui @tanstack/react-query
```



### 设置 Providers：
使用所需的 providers 包装您的应用，以使用 hooks 和组件：

```javascript
import '@mysten/dapp-kit/dist/index.css';
import { SuiClientProvider, WalletProvider } from '@mysten/dapp-kit';
import { getFullnodeUrl } from '@mysten/sui.js/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

const queryClient = new QueryClient();
const networks = {
  localnet: { url: getFullnodeUrl('localnet') },
  devnet: { url: getFullnodeUrl('devnet') },
  testnet: { url: getFullnodeUrl('testnet') },
  mainnet: { url: getFullnodeUrl('mainnet') },
};

ReactDOM.createRoot(document.getElementById('root')!).render(
  <QueryClientProvider client={queryClient}>
    <SuiClientProvider networks={networks} defaultNetwork="devnet">
      <WalletProvider>
        <App />
      </WalletProvider>
    </SuiClientProvider>
  </QueryClientProvider>,
);
```

### 连接钱包：
添加 `ConnectButton` 以使用户能够连接他们的 Sui 钱包：

```javascript
import { ConnectButton } from '@mysten/dapp-kit';

function App() {
  return (
    <div>
      <nav>
        <ConnectButton />
      </nav>
      <section>Hello, world</section>
    </div>
  );
}
```

有关更详细的信息和高级功能，您可以查看 [dApp Kit 文档](https://sdk.mystenlabs.com/dapp-kit)。