import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Flex, Heading } from "@radix-ui/themes";

export function Header() {
  return (
    <Flex
      position="sticky"
      px="4"
      py="2"
      justify="between"
      style={{ borderBottom: "1px solid var(--gray-a2)" }}
    >
      <Box>
        <Heading>Letsmove-Task6</Heading>
      </Box>
      <Box>
        <ConnectButton />
      </Box>
    </Flex>
  );
}
