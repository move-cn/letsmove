'use client';

import {
  ConnectButton,
  useAccountBalance,
  useWallet,
  ErrorCode,
  formatSUI,
} from "@suiet/wallet-kit";
import { TransactionBlock } from '@mysten/sui.js/transactions';
import { useState } from 'react';
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { pool } from 'navi-sdk/dist/address';
import { Sui, USDC } from 'navi-sdk/dist/address';

export default function NaviDeposit() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [txHash, setTxHash] = useState('');

  const handleTransaction = async () => {
    if (!wallet.account) return;
    const account = wallet.account;
    const sender = account.address;
    setLoading(true);
    setError('');
    setTxHash('');

    try {
      let txb = new TransactionBlock();
      txb.setSender(sender);
      txb.setGasBudget(500000000);

      let getCoinInfo = balance;
      if (!getCoinInfo) {
        throw new Error("余额不足");
      }

      let deposit_amount = 1e9;
      let sui_symbol = Sui.symbol;
      const pool_sui = pool[sui_symbol];
      const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
      await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

      let borrow_amount = 0.091020 * 1e6;
      let usdc_symbol = USDC.symbol;
      const pool_usdc = pool[usdc_symbol];
      const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);

      await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);

      const resData = await wallet.signAndExecuteTransactionBlock({
        transactionBlock: txb,
      });
      console.log("交易成功:", JSON.stringify(resData));
      setTxHash(resData.digest);
    } catch (e) {
      console.error("操作失败:", e);
      setError(e.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="flex flex-col items-center gap-4">
      {!wallet.connected ? (
        <p>请先连接钱包!</p>
      ) : (
        <div className="flex flex-col items-center gap-2">
          <div className="text-sm">
            <p>当前钱包: {wallet.adapter?.name}</p>
            <p>
              钱包状态:{" "}
              {wallet.connecting
                ? "连接中"
                : wallet.connected
                ? "已连接"
                : "未连接"}
            </p>
            <p>当前网络: {wallet.chain?.name}</p>
            <p>
              钱包余额:{" "}
              {formatSUI(balance ?? 0, {
                withAbbr: false,
              })}{" "}
              SUI
            </p>
          </div>
          
          <button
            onClick={handleTransaction}
            disabled={!wallet.connected || loading}
            className="rounded-full bg-foreground text-background px-4 py-2 disabled:opacity-50"
          >
            {loading ? '处理中...' : '执行 Navi 操作'}
          </button>
        </div>
      )}

      {error && <p className="text-red-500 text-sm">{error}</p>}
      {txHash && (
        <p className="text-sm">
          交易哈希: <a 
            href={`https://suiexplorer.com/txblock/${txHash}`}
            target="_blank"
            rel="noopener noreferrer"
            className="text-blue-500 hover:underline"
          >
            {txHash}
          </a>
        </p>
      )}
    </div>
  );
} 