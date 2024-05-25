import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";

function App() {
  function showConfirm(): void {
      let userConfirmed = confirm("你确定要进行这个操作吗？");
      if (userConfirmed) {
          console.log("用户点击了确定。");
          // 这里编写用户点击确定后的逻辑
      } else {
          console.log("用户点击了取消。");
          // 这里编写用户点击取消后的逻辑
      }
  }
 
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
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <WalletStatus />
        </Container>
      </Container>
      <button onClick={showConfirm}>Test</button>
    </>
  );
}

export default App;
