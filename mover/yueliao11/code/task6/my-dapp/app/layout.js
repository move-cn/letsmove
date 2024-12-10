'use client';

import { useEffect } from 'react';
import { WalletProvider } from '@suiet/wallet-kit';
import "@suiet/wallet-kit/style.css";

export default function RootLayout({ children }) {
  useEffect(() => {
    try {
      localStorage.clear();
    } catch (e) {
      console.error('清理存储失败:', e);
    }
  }, []);

  return (
    <html lang="en">
      <body>
        <WalletProvider>
          {children}
        </WalletProvider>
      </body>
    </html>
  );
}
