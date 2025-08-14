import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";
import { NaviPTB } from "./NaviPTB";

function App() {
  return (
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
          style={{ background: "var(--gray-a5)", minHeight: 120 }}
        >
          <WalletStatus />
        </Container>
        <Container 
          mt="5" 
          pt="2" 
          px="4"
          style={{ background: "var(--gray-a5)", minHeight: 300 }}
        >
          <NaviPTB />
        </Container>
      </Container>
    </>
  );
}

export default App;
