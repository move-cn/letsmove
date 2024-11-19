import { ConnectButton } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { PtbBlock } from "./PtbBlock";
import { useEffect, useState } from "react";
import { addZero, getCurrentTime } from "./utils";
function App() {
  const [time, setTime] = useState('')
  const currentTime = () => {
    const {
      year,
      month,
      date,
      hour,
      min,
      second
    } = getCurrentTime()
    
    setTime(`${year}-${addZero(month)}-${addZero(date)} ${addZero(hour)}:${addZero(min)}:${addZero(second)}`)
  }
  useEffect(() => {
    setInterval(() => {
      currentTime()
    }, 1000)
  }, [])
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
          <Heading>SDK PTB NAVI ({time})</Heading>
        </Box>

        <Box>
          <ConnectButton />
        </Box>
      </Flex>
      <Container>
        <Container
          mt="5"
          pt="2"
          px="2"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <PtbBlock />
        </Container>
      </Container>
    </>
  );
}

export default App;
