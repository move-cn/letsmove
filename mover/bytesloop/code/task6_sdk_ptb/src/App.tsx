import { ConnectButton, ErrorCode } from "@suiet/wallet-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";

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
          <ConnectButton 
            onConnectError={(error) => {
              if(error.code === ErrorCode.WALLET__CONNECT_ERROR__USER_REJECTED) {
                console.warn("user rejected the connection to " + error.details?.wallet,);
              } else {
                console.warn("unknown connect error: ", error);
              }
            }}
          />
        </Box>
      </Flex>
      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <WalletStatus />
        </Container>
      </Container>
    </>
  );
}

export default App;
