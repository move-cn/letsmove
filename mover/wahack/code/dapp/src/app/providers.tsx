'use client'

import { ChakraProvider } from '@chakra-ui/react'
import { SuiClientProvider,WalletProvider  } from '@mysten/dapp-kit';
import { getFullnodeUrl } from '@mysten/sui/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import '@mysten/dapp-kit/dist/index.css';

const queryClient = new QueryClient();
const networks = {
    testnet: { url: getFullnodeUrl('testnet') },
    mainnet: { url: getFullnodeUrl('mainnet') },
    };

export function Providers({ children }: { children: React.ReactNode }) {
    return <ChakraProvider>
        <QueryClientProvider client={queryClient}>
            <SuiClientProvider networks={networks} defaultNetwork="testnet">
                <WalletProvider autoConnect={true}>
                    {children}
                </WalletProvider>
            </SuiClientProvider>
        </QueryClientProvider>
    </ChakraProvider>
}