'use client';
import { ConnectButton, useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Transaction } from "@mysten/sui/transactions";
import { borrowCoin, depositCoin, nUSDC, Pool, pool, Sui } from "navi-sdk";
import { useState } from "react";

export default function NaviHome() {

  const currentAddress = useCurrentAccount();

  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
  const [digest, setDigest] = useState('');
  const [noticeInfo, setNoticeInfo] = useState('');

  const handleClick = async () => {
    if (!currentAddress) {
      alert("请先连接钱包");
      return;
    }
    // 存入 1 SUI，借出当前日期对应的 USDC，并将 USDC 存入协议中
    // 数量
    const suiAmount = 1 * 10 ** Sui.decimal;
    console.log("suiAmount = ", suiAmount);

    const date = new Date();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const hours = date.getHours();

    const usdcAmount = parseInt((parseFloat(`0.${month.toString().padStart(2, '0')}${day.toString().padStart(2, '0')}${hours.toString().padStart(2, '0')}`) * 10 ** nUSDC.decimal).toString());
    console.log("usdcAmount = ", usdcAmount);

    // 创建交易对象
    const tx = new Transaction();

    // 分割 sui
    const [suiCoin] = tx.splitCoins(tx.gas, [suiAmount]);
    console.log(suiCoin);

    if (!suiCoin) {
      setNoticeInfo("分割 SUI 失败");
      return;
    }

    // 操作池
    const suiPool = pool[Sui.symbol as keyof Pool];
    const usdcPool = pool[nUSDC.symbol as keyof Pool];
    if (!suiPool || !usdcPool) {
      setNoticeInfo("pool 配置失败");
      return;
    }

    // 存 sui
    await depositCoin(tx, suiPool, suiCoin, suiAmount);

    // 借 usdc
    const [borrowedCoin] = await borrowCoin(tx, usdcPool, usdcAmount);

    // 存 usdc
    await depositCoin(tx, usdcPool, borrowedCoin, usdcAmount);

    signAndExecuteTransaction(
      {
        transaction: tx,
      },
      {
        onSuccess: (result) => {
          setDigest(result.digest);
          setNoticeInfo("交易已发送");
        },
        onError: (error) => {
          setNoticeInfo(error.message);
        }
      });
  }

  return (
    <div className="container flex flex-col justify-center items-center p-4 mx-auto">
      <div className="w-full flex justify-end">
        <ConnectButton />
      </div>

      <button
        onClick={handleClick}
        className="mt-4 border border-blue-500 rounded-md p-2 font-bold text-blue-500"
      >
        点击存入&借出
      </button>

      {noticeInfo && <p>{noticeInfo}</p>}
      {digest && <p>交易 hash {digest}</p>}
    </div>
  );
}