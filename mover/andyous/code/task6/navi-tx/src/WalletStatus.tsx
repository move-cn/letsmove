import { Container, Flex, Heading, Text } from "@radix-ui/themes";
import { Navi } from "./Navi";
import { formatSUI, useAccountBalance, useWallet } from "@suiet/wallet-kit";

export function WalletStatus() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();

  return (
    <Container my="2">
      <Heading mb="2">Wallet Status</Heading>

      {wallet.account ? (
        <Flex direction="column">
          <Text>Wallet connected</Text>
          <Text>Address: {wallet.account?.address}</Text>
          <Text>current wallet: {wallet.adapter?.name}</Text>
          <Text>current network: {wallet.chain?.name}</Text>
          <Text>
            wallet balance:{" "}
            {formatSUI(balance ?? 0, {
              withAbbr: false,
            })}{" "}
            SUI
          </Text>
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}
      <Navi />
    </Container>
  );
}
