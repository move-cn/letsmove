import { getFullnodeUrl, SuiClient } from "@mysten/sui/client";
import { createNetworkConfig } from "@mysten/dapp-kit";

type Network = "mainnet" | "testnet" | "devnet";

const network = (process.env.NEXT_PUBLIC_NETWORK as Network) || "testnet";

const { networkConfig, useNetworkVariable, useNetworkVariables } = createNetworkConfig({
    devnet: {
        url: getFullnodeUrl("devnet"),
        variables: {},
    },
    testnet: {
        url: getFullnodeUrl("testnet"),
        variables: {},
    },
    mainnet: {
        url: getFullnodeUrl("mainnet"),
        variables: {},
    },
});

// 创建全局 SuiClient 实例
const suiClient = new SuiClient({ url: networkConfig[network].url });

export { useNetworkVariable, useNetworkVariables, networkConfig, network, suiClient };
