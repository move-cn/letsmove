import React from "react";
import ReactDOM from "react-dom/client";
import "@mysten/dapp-kit/dist/index.css";
import "@radix-ui/themes/styles.css";
import { useSuiClientContext } from '@mysten/dapp-kit';

import { SuiClientProvider, WalletProvider } from "@mysten/dapp-kit";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Button, Theme, Flex} from "@radix-ui/themes";
import App from "./App.tsx";
import { networkConfig } from "./networkConfig.ts";

// import { Button } from "@radix-ui";

const queryClient = new QueryClient();

function NetworkSelector() {
	const ctx = useSuiClientContext();
 
	return (
		<div>
      <Flex align="center" gap="3">
			{Object.keys(ctx.networks).map((network) => (
				<Button radius='medium' variant="soft" color="cyan" key={network} onClick={() => ctx.selectNetwork(network)}>
					{`select ${network}`}
				</Button>
			))}
      </Flex>
		</div>
	);
}

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <Theme appearance="dark">
      <QueryClientProvider client={queryClient}>
        <SuiClientProvider networks={networkConfig} defaultNetwork="mainnet" >
          {/* <NetworkSelector></NetworkSelector> */}
          <WalletProvider autoConnect>
            <App />
          </WalletProvider>
        </SuiClientProvider>
      </QueryClientProvider>
    </Theme>
  </React.StrictMode>,
);
