import { useCurrentAccount } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text } from "@radix-ui/themes";
import {MyTask} from "./MyTask.tsx";

export function WalletStatus() {
  const account = useCurrentAccount();

  return (
    <Container my="2">
      <Heading mb="2">Wallet Status</Heading>

      {account ? (
        <Flex direction="column">
          <MyTask></MyTask>
        </Flex>
      ) : (
        <Text>没有连接钱包</Text>
      )}
    </Container>
  );
}
