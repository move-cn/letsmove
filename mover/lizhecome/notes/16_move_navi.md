# （十六）Move语言学习笔记：使用脚手架创建Sui dApp项目与Navi SDK集成

本文介绍HOH水分子社区Move共学营的task6学习笔记。

## 1. 使用脚手架快速创建Sui dApp项目

Sui生态为开发者提供了一个名为`@mysten/create-dapp`的脚手架工具，帮助我们快速初始化一个功能完善的dApp项目。以下是使用脚手架的简单步骤：

### 1.1 安装和创建项目

运行以下命令启动脚手架工具：

```bash
npm create @mysten/dapp
```

脚手架会通过交互式提示，引导你完成新项目的创建。

### 1.2 选择模板

项目创建过程中，你可以选择以下两种模板：
- `react-client-dapp`：一个简单的React模板，包含展示钱包内资产列表的示例功能。
- `react-e2e-counter`：一个更复杂的端到端模板，结合了Move代码和简单的计数器UI。

### 1.3 脚手架的功能特性

该脚手架基于Vite TypeScript项目，并预配置了以下功能：
- **React**：构建现代化的用户界面。
- **TypeScript**：为代码提供类型安全。
- **Radix UI**：一组可访问性友好的UI组件。
- **ESLint**：代码风格和质量检查工具。
- **@mysten/dapp-kit**：与Sui网络交互的核心工具包。

### 1.4 启动开发服务器

完成项目创建后，进入项目目录并运行以下命令启动本地开发服务器：

```bash
cd your-dapp-project
npm install
npm run dev
```

随后，通过浏览器访问项目，即可开始你的dApp开发之旅。

## 2. 集成Sui dApp Kit与Navi SDK

创建项目后，你可以通过集成`@mysten/dapp-kit`和`navi-sdk`，实现复杂的链上交互功能。以下是具体步骤：

### 2.1 安装依赖

在项目根目录运行以下命令安装必要的库：

```bash
npm install @mysten/dapp-kit @mysten/sui @tanstack/react-query navi-sdk
```

### 2.2 配置网络和Providers

在应用的入口文件（如`App.js`或`App.tsx`）中配置网络连接和Provider组件：

```move
import { createNetworkConfig, SuiClientProvider, WalletProvider } from '@mysten/dapp-kit';
import { getFullnodeUrl } from '@mysten/sui/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';

const { networkConfig } = createNetworkConfig({
    localnet: { url: getFullnodeUrl('localnet') },
    mainnet: { url: getFullnodeUrl('mainnet') },
});
const queryClient = new QueryClient();

function App() {
    return (
        <QueryClientProvider client={queryClient}>
            <SuiClientProvider networks={networkConfig} defaultNetwork="localnet">
                <WalletProvider>
                    <YourApp />
                </WalletProvider>
            </SuiClientProvider>
        </QueryClientProvider>
    );
}

export default App;
```

此配置确保应用能够连接到Sui网络，并提供了钱包和状态管理的支持。

### 2.3 实现与Navi协议交互的页面

#### 代码详细解读：NaviPage

以下逐步解析代码中的每个关键点，详细说明其作用和实现逻辑，并辅以具体代码段。

1. **导入工具和模块**

```move
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { pool, wUSDC } from 'navi-sdk/dist/address';
```

- `useCurrentAccount`：获取当前连接的钱包账户信息。
- `useSignAndExecuteTransaction`：提供一个签名并执行交易的函数。
- `Transaction`：用于构造复杂的链上交易。
- `depositCoin` 和 `borrowCoin`：Navi SDK 提供的功能，用于存款和借款操作。
- `pool` 和 `wUSDC`：Navi协议中预设的资源池配置和资产信息。

2. **定义核心组件**

```move
const NaviPage = () => {
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
    const currentAccount = useCurrentAccount();
```

- `signAndExecuteTransaction`：通过`useSignAndExecuteTransaction`钩子获取链上交易提交的函数。
- `currentAccount`：使用`useCurrentAccount`获取当前连接的钱包账户。如果未连接钱包，返回`null`。

3. **检查钱包连接状态**

```move
if (!currentAccount) {
    alert("请先连接钱包");
    return;
}
```

确保用户已连接钱包，否则提示用户操作并终止后续逻辑。

4. **初始化交易对象**

```move
const tx = new Transaction();
tx.setSender(currentAccount.address);
```

- `new Transaction()`：创建一个新的交易对象`tx`。
- `setSender`：指定交易发起方为当前钱包地址`currentAccount.address`。

5. **分割Gas Coin并存款**

```move
const suiPoolConfig = pool['Sui'];
const splitCoin = tx.splitCoins(tx.gas, [1_000_000_000]);

await depositCoin(tx, suiPoolConfig, splitCoin, 1_000_000_000);
```

- 获取池配置：`pool['Sui']`从Navi协议的资源池中获取针对Sui资产的配置。
- 分割Gas Coin：`splitCoins`将Gas Coin拆分出1 SUI（1,000,000,000 MIST）。
- 存款到池：`depositCoin`将分割出的1 SUI存入指定资源池。

6. **动态计算借款金额并借出USDC**

```move
const currentDate = new Date();
const borrowAmount = parseFloat(`0.${currentDate.getMonth() + 1}${currentDate.getDate()}${currentDate.getHours()}`);
const loanPoolConfig = pool[wUSDC.symbol as keyof typeof pool];
const [borrowedUSDC] = await borrowCoin(tx, loanPoolConfig, borrowAmount * Math.pow(10, wUSDC.decimal));
```

- 动态计算借款金额：基于当前日期，借款金额为0.MMDDHH。
- 获取USDC池配置：通过`pool[wUSDC.symbol]`获取USDC资产配置。
- 借款操作：调用`borrowCoin`从USDC资源池中借款。

7. **存回借出的USDC**

```move
await depositCoin(tx, loanPoolConfig, borrowedUSDC, borrowAmount * Math.pow(10, wUSDC.decimal));
```

将步骤6中借出的USDC按相同金额存回资源池。

8. **提交交易**

```move
await signAndExecuteTransaction({ transaction: tx });
alert("交易完成！");
```

签名并提交交易，完成整个流程。

9. **组件的UI部分**

```move
return <button onClick={handleTransaction}>执行交易</button>;
```

定义一个按钮，当用户点击时，执行`handleTransaction`函数。

#### 完整代码

```move
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { pool, wUSDC } from 'navi-sdk/dist/address';

const NaviPage = () => {
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
    const currentAccount = useCurrentAccount();

    const handleTransaction = async () => {
        if (!currentAccount) {
            alert("请先连接钱包");
            return;
        }

        const tx = new Transaction();
        tx.setSender(currentAccount.address);

        try {
            // 1. 拆分Gas Coin并存款
            const suiPoolConfig = pool['Sui'];
            const splitCoin = tx.splitCoins(tx.gas, [1_000_000_000]);
            await depositCoin(tx, suiPoolConfig, splitCoin, 1_000_000_000);

            // 2. 动态计算借款金额并借出USDC
            const currentDate = new Date();
            const borrowAmount = parseFloat(`0.${currentDate.getMonth() + 1}${currentDate.getDate()}${currentDate.getHours()}`);
            const loanPoolConfig = pool[wUSDC.symbol];
            const [borrowedUSDC] = await borrowCoin(tx, loanPoolConfig, borrowAmount * Math.pow(10, wUSDC.decimal));

            // 3. 存回借款
            await depositCoin(tx, loanPoolConfig, borrowedUSDC, borrowAmount * Math.pow(10, wUSDC.decimal));

            // 4. 提交交易
            await signAndExecuteTransaction({ transaction: tx });
            alert("交易完成！");
        } catch (error) {
            console.error("交易失败:", error);
            alert("交易失败，请检查控制台日志。");
        }
    };

    return <button onClick={handleTransaction}>执行交易</button>;
};

export default NaviPage;
```

通过这段代码，你可以实现以下链上操作：
    1.	分割Gas Coin：分出一部分资金用于操作。
    2.	存款到资源池：模拟将资产存入某个池子。
    3.	借款操作：从资源池借出一定金额的 USDC。
    4.	再存款操作：将借出的 USDC 再存回池子。
    5.	提交交易：完成整个链上交互流程。

## 3. 总结

利用 @mysten/create-dapp 快速创建项目，并结合 @mysten/dapp-kit 和 navi-sdk，你可以轻松打造功能强大的去中心化defi应用。

为什么推荐这套工具？
	•	简单高效：脚手架让你省去繁琐的配置环节。
	•	功能丰富：支持钱包连接、网络切换、链上操作等多种功能。
	•	高度灵活：适合初学者学习，也适合资深开发者进行复杂场景开发。

> **请用微信关注《HOH水分子》公众号，我们将持续分享和制作变成语言教程，让大家对编程产生化学反应。**
![水分子社区](../images/HOH_QR.jpg)