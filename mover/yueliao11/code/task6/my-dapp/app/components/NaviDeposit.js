'use client';

import { useState } from 'react';
import {
  ConnectButton,
  useAccountBalance,
  useWallet,
  ErrorCode,
  formatSUI,
} from "@suiet/wallet-kit";
import { TransactionBlock } from '@mysten/sui.js/transactions';
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool, Sui, wUSDC } from 'navi-sdk/dist/address';

export default function NaviDeposit() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();
  const [txHash, setTxHash] = useState('');

  const calculateBorrowAmount = () => {
    const date = new Date();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const hour = date.getHours().toString().padStart(2, '0');
    
    const amountString = `0.${month}${day}${hour}`;
    const amount = parseFloat(amountString) * (10 ** wUSDC.decimal);
    
    console.log("Borrow amount calculation:", {
      date: date.toLocaleString(),
      month,
      day,
      hour,
      amountString,
      rawAmount: parseFloat(amountString),
      finalAmount: amount,
      decimal: wUSDC.decimal
    });
    
    return { amountString, amount };
  };

  const checkConfigurations = () => {
    console.log("Checking configurations...");
    console.log("wUSDC:", wUSDC);
    console.log("wUSDC Symbol:", wUSDC?.symbol);
    console.log("Pool:", pool);
    
    if (!wUSDC?.symbol) {
      throw new Error("wUSDC configuration is missing or invalid");
    }

    const wusdcPool = pool[wUSDC.symbol];
    if (!wusdcPool) {
      throw new Error("No pool configuration found for wUSDC");
    }

    return wusdcPool;
  };

  const handleTransaction = async () => {
    if (!wallet.account) {
      alert("Please connect wallet first");
      return;
    }

    try {
      const { amountString, amount: borrow_amount } = calculateBorrowAmount();
      
      // 显示确认框
      const confirmMessage = `Please confirm the following transaction:\n\n` +
        `1. Deposit 1 SUI to Navi Protocol\n` +
        `2. Borrow ${amountString} wUSDC (based on current time)\n` +
        `3. Deposit the borrowed wUSDC back\n\n` +
        `Do you want to proceed?`;

      if (!confirm(confirmMessage)) {
        console.log("Transaction cancelled by user");
        return;
      }

      setTxHash('');
      
      const txb = new TransactionBlock();
      txb.setSender(wallet.account.address);

      // 检查余额
      if (!balance || balance < 1_000_000_000) {
        throw new Error("Insufficient balance - need at least 1 SUI");
      }

      // 检查 SUI 配置
      if (!Sui?.symbol) {
        throw new Error("SUI configuration is undefined");
      }
      const pool_sui = pool[Sui.symbol];
      if (!pool_sui) {
        throw new Error("SUI pool configuration is undefined");
      }

      // 检查 wUSDC 配置
      const pool_wusdc = checkConfigurations();

      console.log("Transaction details:", {
        depositAmount: "1 SUI",
        borrowAmount: amountString,
        walletAddress: wallet.account.address
      });

      // 1. 存入 1 SUI
      const deposit_amount = 1_000_000_000; // 1 SUI
      const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
      await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

      // 2. 借入 wUSDC
      const [borrow_coin] = await borrowCoin(txb, pool_wusdc, borrow_amount);
      
      // 3. 存入借到的 wUSDC
      await depositCoin(txb, pool_wusdc, borrow_coin, borrow_amount);

      // 执行交易
      const resData = await wallet.signAndExecuteTransactionBlock({
        transactionBlock: txb,
      });

      console.log("Transaction result:", {
        digest: resData.digest,
        status: resData.effects?.status,
        gasUsed: resData.effects?.gasUsed
      });

      setTxHash(resData.digest);
      alert("Transaction completed successfully!");

    } catch (error) {
      console.error("Transaction failed:", error);
      setTxHash('');
      alert("Transaction failed: " + error.message);
    }
  };

  return (
    <div className="flex flex-col items-center gap-4">
      {wallet.connected && (
        <button
          onClick={handleTransaction}
          className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
        >
          Execute Transaction
        </button>
      )}
      
      {txHash && (
        <p className="text-sm">
          Transaction Hash:{" "}
          <a
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