import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { ConnectButton, useConnectWallet, useWallets } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Button, Text } from "@radix-ui/themes";
import { wUSDC } from "navi-sdk/dist/address";
import { mainAction } from "./NAVI";

// 根据当前日期和时间计算借款金额
const caculateBorrowAmount = (month: number, day: number, hour: number) => {
  // 构造借款金额字符串，例如 "0.032915" 表示 3 月 29 日 15 时
  const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;

  // 字符串转换为浮点数并乘以 USDC 的精度
  return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

// 主组件：执行交易
const Execute = () => {
  // 获取所有可用的钱包，以及连接钱包的钩子；
  const wallets = useWallets();
  const { mutate: connect } = useConnectWallet();

  // 获取当前钱包里连接的账户和用于签名并执行交易的钩子；
  const account = useCurrentAccount();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();

  // 获取当前日期和时间并计算当前日期对应的借款金额
  const date = new Date();
  const usdcAmount = caculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());

  return (
    <Container my="2">
      {/* 显示钱包状态 */}
      <Heading mb="2">Wallet Status</Heading>
      <div style={{ padding: 20 }}>
        {/* 通用的连接按钮 */}
        <ConnectButton />
        <ul>
          {/* 列出所有可用钱包 */}
          {wallets.map((wallet) => (
            <li key={wallet.name}>
              <Button
                onClick={() => {
                  // 连接指定钱包
                  connect(
                    { wallet },
                    {
                      onSuccess: () => console.log("Connected to wallet:", wallet.name),
                      onError: (error) => console.error("Failed to connect:", error),
                    }
                  );
                }}
              >
                Connect to {wallet.name}
              </Button>
            </li>
          ))}
        </ul>
      </div>

      {/* 如果账户已连接，显示账户信息 */}
      {account ? (
        <Flex direction="column">
          <Text>Wallet Connected</Text>
          <Text>Address: {account.address}</Text>
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}

      {/* 显示交易操作 */}
      <Heading mb="2">Transaction Action</Heading>
      {account ? (
        <Flex direction="column">
          <Heading mb="2">Execute Transaction</Heading>
          <Flex direction="column">
            {/* 显示交易步骤 */}
            <Text>1. [存入Navi Protocol 1 Sui]</Text>
            <Text>{`2. [借出当前日期的USDC，一共 ${usdcAmount/(10 ** wUSDC.decimal)} USDC]`}</Text>
            <Text>3. [然后存入等额的USDC]</Text>
          </Flex>
          {/* 执行交易按钮 */}
          <Button
            size="3"
            onClick={() => {
              // 调用 mainAction 执行交易，向mainAction传递上面准备好的相关参数
              // 这里的参数包括账户、签名和执行函数、借款金额、成功和失败的回调函数
              mainAction(account, {
                signAndExecute,
                usdcAmount,
                onSuccess(result) {
                  console.log("Transaction successful:", result);
                },
                onError(error) {
                  console.error("Transaction failed:", error.message);
                },
              });
            }}
            style={{ cursor: "pointer" }}
          >
            <Text>Click to Execute This Transaction</Text>
          </Button>
        </Flex>
      ) : null}
    </Container>
  );
};

export default Execute;
