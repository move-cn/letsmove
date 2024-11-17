import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'

import {
  WalletProvider,
} from '@suiet/wallet-kit';

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <WalletProvider>
      {/* if you want to custiomize you wallet list, please check this doc
          https://kit.suiet.app/docs/components/WalletProvider#customize-your-wallet-list-on-modal
       */}
      <App/>
    </WalletProvider>
  </React.StrictMode>
)
