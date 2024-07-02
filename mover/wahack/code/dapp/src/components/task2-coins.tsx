import {Box, HStack, InputLeftAddon, Button, InputGroup, Input, useToast} from '@chakra-ui/react';
import { Transaction } from '@mysten/sui/transactions';
import {  useCurrentAccount, useSuiClient,useConnectWallet,useWallets, useSignTransaction } from '@mysten/dapp-kit';
import {useState} from "react";
export default  function Task2() {
    const { mutateAsync: signTransaction } = useSignTransaction();
    const client = useSuiClient();
    const wallets = useWallets();
    const currentAccount = useCurrentAccount();
    const { mutate: connect } = useConnectWallet();
    const toast = useToast()
    const [packageId, setPackageId] = useState('0xc4957097f97d71e4250739bbb277e3991a4a15fdc244e10b019f9506a983e2e5')

// 0xa78c995d56ad9e0a7a3f5cee6c1fdd62987e650678243c596acc90932a51dc76
    async  function mintMyToken () {
        const tx = new Transaction();
        tx.moveCall({
            package: packageId,
            module:"my_coin",
            function: "mint",
            arguments: [tx.object('0x242a0c8e9084e40cc2e3ef090ce6faff08573922b3e60473f3c185374386f4ad'), tx.pure.u64(100), tx.pure.address(currentAccount!.address)]
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
                <Input type='text' placeholder='packageid' value={packageId} mb={6}  onChange={e => setPackageId(e.target.value)} />
            </InputGroup>
        </HStack>
        <HStack>
            <InputGroup>
                <InputLeftAddon>MyCoin</InputLeftAddon>
                <Input type='text' placeholder='amount'/>
            </InputGroup>
            <Button colorScheme='teal' onClick={mintMyToken}>call mint</Button>
            <Button colorScheme='teal'>call burn</Button>
        </HStack>
        <br/>
        <HStack>
            <InputGroup>
                <InputLeftAddon>FaucetCoin</InputLeftAddon>
                <Input type='text' placeholder='amount'/>
            </InputGroup>
            <Button colorScheme='teal'>call mint</Button>
            <Button colorScheme='teal'>call burn</Button>
        </HStack>
    </Box>
}