import { useCurrentAccount } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text } from "@radix-ui/themes";
import { OwnedObjects1 } from "./OwnedObjects1.tsx";

export function WalletStatus() {
  const account = useCurrentAccount();

  return (
    <Container my="2">
      <Heading mb="2">Wallet Status</Heading>

      {account ? (
        <Flex direction="column">
          <Text>Wallet connected</Text>
          <Text>Address: {account.address}</Text>
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}
      <OwnedObjects1 />
    </Container>
  );
}
