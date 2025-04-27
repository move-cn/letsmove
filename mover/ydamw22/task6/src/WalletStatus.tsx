import { Container, Flex, Heading, Text, Button } from "@radix-ui/themes";
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from '@mysten/sui/transactions';
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 导入 Navi SDK 中的池和池配置类型
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"; // 导入 Navi SDK 中的池地址和代币信息
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB"; // 导入 Navi SDK 中的借币和存币函数

export function WalletStatus() {
  const account = useCurrentAccount();
  const timeStr = getTimeStr();

  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();

  return (
    <Container my="2">
      <Heading mb="2">Wallet Status ---- {account ? account.chains : "未连接"}</Heading>

      {account && (
        <>
          <Flex direction="column">
            <Text>Address: {account.address}</Text>
            <div>目标：</div>
            <ul style={{ listStyleType: "none" }}>
              <li>1. [存入Navi Protocol 1 SUI]</li>
              <li>2. [借出当前日期的USDC 0.[月][天][小时] 的 USDC ]</li>
              <li>3. [然后在存入等额的USDC]</li>
              <li>猜测：质押1 SUI；借出{`${timeStr}USDC`}；再质押USDC？</li>
            </ul>
          </Flex>
          <div style={{ height: "1px", backgroundColor: 'gray', margin: "30px 0" }}></div>
          <Flex direction="column" align="center">
            <Button
              style={{ width: "30%", height: "50px" }}
              onClick={
                () => start(
                  account,
                  signAndExecuteTransaction,
                  timeStr,
                )}
            >
              开 始 交 易
            </Button>
          </Flex>
        </>
      )}
    </Container>
  );
}

// 交易
const start = async (account: any, signAndExecuteTransaction: any, timeStr: any) => {
  if (!account) {
    console.log("未连接钱包");
    return;
  }

  try {
    // 创建交易
    const tx = new Transaction();
    tx.setSender(account.address);

    // 获取池配置
    const SUiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wUSDCPool: PoolConfig = pool[wUSDC.symbol as keyof Pool];

    if (!SUiPool || !wUSDCPool) {
      throw new Error("获取池配置失败");
    }

    // 存入1 SUI
    const [suiCoin] = tx.splitCoins(tx.gas, [10 ** Sui.decimal]);
    if (!suiCoin) throw new Error("获取SUI失败");
    await depositCoin(tx, SUiPool, suiCoin, 10 ** Sui.decimal);

    // 借出USDC
    // 字符串转数字，并还原精度
    const borrowAmount = Math.trunc(parseFloat(timeStr) * 10 ** wUSDC.decimal);
    const [toBorrowCoin] = await borrowCoin(tx, wUSDCPool, borrowAmount);
    if (!toBorrowCoin) throw new Error("借出wUSDC失败");

    // 存入USDC
    await depositCoin(tx, wUSDCPool, toBorrowCoin, borrowAmount);

    // 执行交易
    signAndExecuteTransaction(
      { transaction: tx, chain: account.chains },
      {
        // 为 error 参数指定类型
        onError: (error: any) => {
          console.error("交易失败:", error);
        },
      }
    );
  } catch (error) {
    console.error("交易报错:", error);
  }
}

// 获取借出的USDC数量字符串
const getTimeStr = () => {
  const dateObj = new Date();

  let month = dateObj.getMonth() + 1; // Add 1 since getMonth() returns 0-11
  let monthStr = month < 10 ? `0${month}` : month.toString();
  let day = dateObj.getDate();
  let dayStr = day < 10 ? `0${day}` : day.toString();
  let hour = dateObj.getHours();
  let hourStr = hour < 10 ? `0${hour}` : hour.toString();

  return `0.${monthStr}${dayStr}${hourStr}`;
}