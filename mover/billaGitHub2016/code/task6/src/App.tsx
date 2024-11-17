import { ConnectButton, useSuiClientContext } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading, Select } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";
import { NaviDeposit } from "./NaviDeposit";

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
          <NetworkSelector></NetworkSelector>
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

          <NaviDeposit></NaviDeposit>
        </Container>
      </Container>
    </>
  );
}

function NetworkSelector() {
  const ctx = useSuiClientContext();

  return (
    <Select.Root defaultValue={ctx.network} onValueChange={(network) => ctx.selectNetwork(network)}>
      <Select.Trigger color="lime" />
      <Select.Content color="lime">
        {Object.keys(ctx.networks).map((network) => (
          <Select.Item key={network} value={network}>
            {`${network}`}
          </Select.Item>
        ))}
      </Select.Content>
    </Select.Root>
  );
}

export default App;
