import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import '@/styles/globals.css'
import '@mysten/dapp-kit/dist/index.css'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { SuiClientProvider, WalletProvider, createNetworkConfig } from '@mysten/dapp-kit'
import { getFullnodeUrl } from '@mysten/sui.js/client'
// 查询库的实例
const queryClient = new QueryClient()

// 我日,这里地方一定要注意,注入的networkConfig,一定要是mainnet放在第一个,因为navi-sdk会直接使用第一个
// 或者在注入的地方,写defaultNetwork
const { networkConfig } = createNetworkConfig({
  mainnet: { url: getFullnodeUrl('mainnet') },
  testnet: { url: getFullnodeUrl('testnet') },
})

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    {/*  依次注入 QueryClientProvider SuiClientProvider WalletProvider 上下文 */}
    <QueryClientProvider client={queryClient}>
      <SuiClientProvider networks={networkConfig} defaultNetwork="mainnet">
        <WalletProvider autoConnect={true}>
          <App />
        </WalletProvider>
      </SuiClientProvider>
    </QueryClientProvider>
  </React.StrictMode>,
)
