import { ConnectButton, SuiClientProvider, WalletProvider } from "@mysten/dapp-kit";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { getFullnodeUrl } from "@mysten/sui.js/client";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";
import { NaviPTB } from "./components/A1LinLin1_Navi_PTB";
import "@radix-ui/themes/styles.css";

// 创建 QueryClient 实例
const queryClient = new QueryClient();

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <SuiClientProvider networks={{ mainnet: { url: getFullnodeUrl("mainnet") } }} defaultNetwork="mainnet">
        <WalletProvider>
          <>
            <Flex
              position="sticky"
              px="4"
              py="2"
              justify="between"
              style={{
                borderBottom: "1px solid var(--gray-a2)",
              }}
            >
              <Box>
                <Heading>dApp Starter Template</Heading>
              </Box>
              <Box>
                <ConnectButton />
              </Box>
            </Flex>
            <Container>
              <Container
                mt="5"
                pt="2"
                px="4"
                style={{ background: "var(--gray-a2)", minHeight: 500 }}
              >
                <Flex direction="column" gap="4">
                  <WalletStatus />
                  <NaviPTB />
                </Flex>
              </Container>
            </Container>
          </>
        </WalletProvider>
      </SuiClientProvider>
    </QueryClientProvider>
  );
}

export default App;