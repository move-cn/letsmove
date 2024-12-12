'use client';

import { ConnectButton, useWallet } from '@suiet/wallet-kit';
import { useState } from 'react';
import NaviDeposit from './components/NaviDeposit';

export default function Home() {
  const [open, setOpen] = useState(false);
  const wallet = useWallet();

  return (
    <div className="min-h-screen flex flex-col items-center justify-center gap-8">
      <h1 className="text-2xl font-bold">Navi Protocol</h1>
      <ConnectButton />
      <NaviDeposit />
    </div>
  );
}
