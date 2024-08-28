import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import '@mysten/dapp-kit/dist/index.css'
import { createNetworkConfig, SuiClientProvider, WalletProvider } from '@mysten/dapp-kit'
import { getFullnodeUrl } from '@mysten/sui/client'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

const { networkConfig } = createNetworkConfig({
	localnet: { url: getFullnodeUrl('localnet') },
	testnet: { url: getFullnodeUrl('testnet') },
	mainnet: { url: getFullnodeUrl('mainnet') },
})
const queryClient = new QueryClient()

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <QueryClientProvider client={queryClient}>
			<SuiClientProvider networks={networkConfig} defaultNetwork="mainnet">
				<WalletProvider>
            <App />
				</WalletProvider>
			</SuiClientProvider>
		</QueryClientProvider>
  </StrictMode>,
)
