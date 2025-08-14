import {ConnectButton} from "@mysten/dapp-kit";
import {Box, Container, Flex, Heading} from "@radix-ui/themes";
import {WalletStatus} from "./WalletStatus";

function App() {
    return (
        <>
            <Flex position="sticky" px="3" py="2" justify="between"
                  style={{
                      borderBottom: "1px solid var(--gray-a2)",
                  }}
            >
                <Box></Box>

                <Box>
                    <Heading>Task 6: Navi Protocol</Heading>
                </Box>

                <Box>
                    <ConnectButton connectText={"关联钱包"}/>
                </Box>
            </Flex>
            <Container>
                <Container mt="5" pt="2" px="8" style={{background: "var(--gray-a2)", minHeight: 500}}>
                    <WalletStatus/>
                </Container>
            </Container>
        </>
    );
}

export default App;
