import {ConnectButton, useCurrentAccount, useSignAndExecuteTransaction, useSignTransaction } from "@mysten/dapp-kit";
import {Box, Button, Container, Flex, Heading, Text, TextField} from "@radix-ui/themes";
import { NAVISDKClient } from "navi-sdk";
import { Sui } from 'navi-sdk/dist/address';
import { mnemonic  } from './config'
console.log('windynanzi---------------------------------------')
const client = new NAVISDKClient({ mnemonic, networkType: "mainnet", numberOfAccounts: 1,  }) 
console.log('转账前Balance----------------------------------------')
console.log(await client.getAllBalances())
function App() {
  const account = client.account


  const deposit = async () => {
    if(!account) {
        alert('请先登录')
        return
    }
    const res = await account.depositToNavi(Sui, 1e9);
    console.log('转账后Balance------------------------------------')
    console.log(await client.getAllBalances())

    console.log(res);
  }
    
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
          <Heading>Navi Task</Heading>
        </Box>

        <Box>
          {/* <ConnectButton /> */}
        </Box>
      </Flex>
        <Container>
        <Flex>
            <Button onClick={ deposit }> To Navi 1 SUI</Button>
        </Flex>
        </Container>
    </>
  );
}

export default App;
