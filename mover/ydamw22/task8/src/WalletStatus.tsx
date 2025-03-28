import { useCurrentAccount } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text } from "@radix-ui/themes";
import { findValidProof } from "./getProof";

// 0: 226
// 1: 8
// 2: 90
// 3: 142
// 4: 157
// 5: 136
// 6: 2
// 7: 221
const timer = setInterval(async () => {
  let proof = await findValidProof();
  console.log(proof, 'proof');
  if (proof) {
    clearInterval(timer);
  }
}, 1000);

function uint8ToHex(uint8array: Uint8Array) {
  return Array.from(
    uint8array,
    byte => byte.toString(16).padStart(2, '0')
  ).join('');
}

const proofHex = uint8ToHex(new Uint8Array([226, 8, 90, 142, 157, 136, 2, 221]));
console.log(proofHex, 'proofHex');

export function WalletStatus() {
  const account = useCurrentAccount();

  return (
    <Container my="2">
      <Heading mb="2">Wallet Status - {account ? "Connected" : "not connected"}</Heading>

      {account && (
        <Flex justify="between">
          <Text>Address: {account.address}</Text>
          <Text>Chains: {account.chains}</Text>
        </Flex>
      )}
    </Container>
  );
}
