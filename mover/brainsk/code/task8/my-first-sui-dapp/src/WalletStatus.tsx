import { useCurrentAccount } from "@mysten/dapp-kit";
import {  Button,Heading,  Container,  Flex, Text } from "@radix-ui/themes";
import { OwnedObjects } from "./OwnedObjects";

export function WalletStatus() {
  const account = useCurrentAccount();

    const  stringToBytes = (str: string) =>Uint8Array {
        return TextEncoder.encode(str);
    }
  const startProof = () => {

      let i = 0
      for ( i= 0 ;i <=100000000000;i++) {
          console.log("sss",i)
      }

  }
  return (
    <Container my="2">
      <Heading mb="2">Status</Heading>
        <Button onClick={startProof}>startProof</Button>
      {account ? (
        <Flex direction="column">
          <Text>connected</Text>
          <Text>: {account.address}</Text>
        </Flex>
      ) : (
        <Text> not connected</Text>
      )}
      <OwnedObjects />
    </Container>
  );
}
