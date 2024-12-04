import {Box, HStack, InputLeftAddon, Button, InputGroup, Input, useToast} from '@chakra-ui/react';
import { Transaction } from '@mysten/sui/transactions';
import {  useCurrentAccount, useSuiClient,useConnectWallet,useWallets, useSignTransaction } from '@mysten/dapp-kit';
import {useCallback, useState} from "react";


export default  function Task2() {
    const { mutateAsync: signTransaction } = useSignTransaction();
    const client = useSuiClient();
    const wallets = useWallets();
    const currentAccount = useCurrentAccount();
    const { mutate: connect } = useConnectWallet();
    const toast = useToast()
    const [packageId, setPackageId] = useState('0xf373db4f4c46273e778a9eab2fa3f779f8ece3762aa2d053d6ed648254a8d37a')
    async function sayHello () {
        if (!currentAccount) {
         return connect({
             wallet: wallets[0]
         })
        }
        const tx = new Transaction();
        tx.moveCall({
            package: packageId,
            module:"hello_move",
            function: "say_hello"
        })
        toast({
            status: "loading",
            title: "waiting for execute transaction",
            position: "top"
        })
        const { bytes, signature, reportTransactionEffects } = await signTransaction({
            transaction: tx,
            chain: 'sui:testnet',
        });
        const {objectChanges, digest} = await client.executeTransactionBlock({
            transactionBlock: bytes,
            signature,
            requestType: "WaitForLocalExecution",
            options: {
                showObjectChanges: true,
                showRawEffects: true
            },
        });
        if (!objectChanges) return;
        const object = objectChanges.find(i => i.type === "created")
        object && toast({
            status: "success",
            title: "object created!",
            description: `digest: ${digest}, objectId: ${object.objectId}`,
            isClosable: true
        })
    }
    return <Box>
        <HStack>
            <InputGroup>
                <InputLeftAddon>PackageId</InputLeftAddon>
                <Input type='text'  placeholder='packageid' value={packageId} onChange={e => setPackageId(e.target.value)} />
            </InputGroup>
            <Button onClick={sayHello} colorScheme='teal'>call say_hello</Button>
        </HStack>
    </Box>
}