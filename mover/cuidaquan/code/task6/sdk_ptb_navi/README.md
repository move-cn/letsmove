# Navi Protocol PTB Demo

这是一个演示如何在单个可编程交易块（PTB）中与 Navi Protocol 进行多步交互的示例应用。该应用展示了如何在同一个交易中完成存款、借款和还款操作。

## 功能特点

- 在单个 PTB 中执行多个操作
- 使用 Chrome 钱包进行交易签名
- 实时交易状态反馈
- 基于当前时间动态计算借款金额
- 美观的用户界面

## 主要操作流程

应用执行以下三个步骤：

1. 存入 1 SUI 作为抵押品
2. 借出 USDC（金额基于当前时间，格式：MMDDHH）
3. 使用借出的 USDC 进行还款

## 技术栈

- React
- TypeScript
- Vite
- @mysten/dapp-kit
- @mysten/sui
- navi-sdk
- @tanstack/react-query

## 安装

1. 克隆仓库：
```bash
git clone <repository-url>
cd sdk-ptb-navi
```

2. 安装依赖：
```bash
npm install
```

## 开发

启动开发服务器：
```bash
npm run dev
```

## 构建

构建生产版本：
```bash
npm run build
```

## 使用说明

1. 确保你的浏览器安装了 Chrome 钱包扩展
2. 打开应用并连接钱包
3. 点击 "Execute Transaction" 按钮执行交易
4. 在钱包中确认交易
5. 等待交易完成并查看结果

## 注意事项

- 确保钱包中有足够的 SUI 代币
- 交易金额是基于当前时间自动计算的
- 所有操作都在同一个交易中完成，确保原子性
- 如果任何步骤失败，整个交易都会回滚

## 错误处理

应用包含完整的错误处理机制：
- 交易准备阶段的错误
- 交易执行失败的错误
- 交易确认等待时的错误

## 贡献

欢迎提交 Issue 和 Pull Request。

## 许可证

[Apache-2.0](LICENSE) 