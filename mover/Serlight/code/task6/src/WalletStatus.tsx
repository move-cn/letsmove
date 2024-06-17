import { useCurrentAccount } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text, Button } from "@radix-ui/themes";
import { NaviTx } from "./NaviTx";

export function WalletStatus() {
  const account = useCurrentAccount();

  return (
    <Container my="2">
      <Heading mb="2">Task6 Navi Transaction</Heading>

      {account ? (
        <Flex direction="column">
          <NaviTx />
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}
    </Container>
  );
}
