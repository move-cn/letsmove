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
            <App/>
        </WalletProvider>
    </React.StrictMode>
)