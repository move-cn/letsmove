import { Button} from "@radix-ui/themes"; // 导入 Radix UI 组件
import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit"; // 导入 Mysten DApp Kit 钩子
import { Transaction } from "@mysten/sui/transactions"; // 导入 Sui 交易类
import { Pool, PoolConfig } from "navi-sdk/dist/types"; // 导入 Navi SDK 中的池和池配置类型
import { pool, Sui, wUSDC } from "navi-sdk/dist/address"; // 导入 Navi SDK 中的池地址和代币信息
import { borrowCoin, depositCoin } from "navi-sdk/dist/libs/PTB"; // 导入 Navi SDK 中的借币和存币函数
import { useState } from "react";

export default function Navi() {
  const currentAccount = useCurrentAccount(); // 获取当前账户信息
  const {mutate: signAndExecuteTransaction} = useSignAndExecuteTransaction(); // 获取签名和执行交易函数
  const [digest, setDigest] = useState<string>("");
  const [message, setMessage] = useState<string>("");

function bowrrow_amount (){
  const date = new Date(); // 获取当前日期
const month = (date.getMonth() + 1).toString().padStart(2, '0'); // 确保月份两位数
const day = date.getDate().toString().padStart(2, '0'); // 确保日期两位数
const hour = date.getHours().toString().padStart(2, '0'); // 确保小时两位数

// 拼接字符串并转换为数字
const borrow_amount_str = `0.${month}${day}${hour}`; // 字符串形式
const borrow_amount = parseFloat(borrow_amount_str) * 10 ** wUSDC.decimal; // 转换为数字

console.log(borrow_amount); // 输出数字
return borrow_amount;
}

async function doNavi() {
      if(!currentAccount){
        setMessage("请连接钱包");
     return;
    }
    
try{
  const tx =new Transaction();
  tx.setSender(currentAccount.address);

  const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool]; // 获取 Sui 池配置
  const wUSDCPool: PoolConfig = pool[wUSDC.symbol as keyof Pool]; // 获取 wUSDC 池配置
    if(!suiPool || !wUSDCPool) {
      setMessage("获取池配置失败");
      return;
    }
    const [suiCoin] = tx.splitCoins(tx.gas, [1_000_000_000]); // 分割 SUI 代币
    console.log(suiCoin);
    if (!suiCoin) throw new Error("分割失败");
    await depositCoin(tx, suiPool, suiCoin, 1_000_000_000);
    const [borrowUSDC] = await borrowCoin(tx, wUSDCPool, bowrrow_amount());
    if(!borrowUSDC) throw new Error("借款失败")
    await depositCoin(tx,wUSDCPool,borrowUSDC,bowrrow_amount());
    signAndExecuteTransaction(
      { transaction: tx, chain: "sui:testnet" },
      {
        onSuccess: (result) => {
          // 成功时打印结果
          console.log("Transaction successful:", result);
          // 设置交易摘要
          setDigest(result.digest);
        },
        onError: (error) => {
          console.error("Transaction failed:", error);
          setMessage(error.message || "Transaction failed");
        },
      },
  );
  }catch (error) {
    console.error("Error:", error);
} 
}
return (
 
        <Button onClick={doNavi} variant="solid">开始交易</Button>
      
);
}
