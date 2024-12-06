'use client';

import { useWallet } from '@mysten/dapp-kit';

export default function WalletConnect() {
  const wallet = useWallet();

  const connectWallet = async () => {
    try {
      await wallet.connect();
    } catch (e) {
      console.error('连接钱包失败:', e);
    }
  };

  return (
    <div className="flex flex-col items-center gap-4">
      <button
        onClick={connectWallet}
        className="rounded-full bg-foreground text-background px-4 py-2"
      >
        {wallet.connected ? '已连接' : '连接钱包'}
      </button>
      {wallet.account && (
        <p className="text-sm">
          钱包地址: {wallet.account.address}
        </p>
      )}
    </div>
  );
}
