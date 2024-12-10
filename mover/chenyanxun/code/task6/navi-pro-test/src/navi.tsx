import { useCurrentAccount, useSignAndExecuteTransaction, useSuiClient } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { borrowCoin, depositCoin, pool, Sui, wUSDC} from "navi-sdk";
import { Pool, PoolConfig } from "navi-sdk/dist/types";

function Navi() {
  const currentAccount = useCurrentAccount();
  const {mutate: signAndExecute} = useSignAndExecuteTransaction();
  const suiClient = useSuiClient();

  const ExcutNavi = async () => {
    console.log("====ExcutNavi")
    // 判断有没有链接钱包
    if(!(currentAccount && currentAccount.address)) {
      alert("请链接钱包！！")
      return
    }
    const tx = new Transaction();
    tx.setSender(currentAccount.address);
    // 获取池配置
    const SuiPoolConfig: PoolConfig = pool[Sui.symbol as keyof Pool];
    const wUSDCPoolConfig: PoolConfig = pool['wUSDC'];

    try{
      // 先质押1SUI
      // 从账户中拆分1SUI
      const splitSUICoin = tx.splitCoins(tx.gas, [1e9]);
      // 存入
      await depositCoin(tx, SuiPoolConfig, splitSUICoin, 1_000_000_000);

      // 借出当前日期的USDC
      const date = new Date();
      const month = date.getMonth() + 1;
      const day = date.getDay() + 8;
      const hour = date.getHours();
      const borrowAmountStr = `0.${month}${day}${hour}`;
      // 计算wUSDC的精度
      const borrowAmount = parseFloat(borrowAmountStr) * Math.pow(10, wUSDC.decimal);
      // 借款
      const [toBorrowCoin] = await borrowCoin(tx, wUSDCPoolConfig, borrowAmount);
      // 存款
      await depositCoin(tx, wUSDCPoolConfig, toBorrowCoin, borrowAmount)

      // 执行PTB交易
      signAndExecute(
        {
          transaction: tx
        },
        {
          onSuccess: (tx) => {
            console.log(tx)
            suiClient.waitForTransaction({ digest: tx.digest }).then(async () => {
              console.log("===执行完成")
            });
          },
          onError: (tx) => {
            console.log("====执行失败")
          }
        }
      )
    }catch{
      console.log("====PTB交易失败")
    }
    


  }

  return (
    <button className="navi" onClick={ExcutNavi}>Navi Task</button>
  )
}

export default Navi;