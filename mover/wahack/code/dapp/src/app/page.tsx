'use client';

import {Button, Container, Tabs, TabList, Tab, TabPanels,Box, TabPanel, HStack} from "@chakra-ui/react";
import Task2 from '@/components/task2-coins';
import Task1 from '@/components/task1-hello';
import { ConnectButton, useCurrentWallet } from '@mysten/dapp-kit';

export default function Home() {
    const { currentWallet, connectionStatus } = useCurrentWallet();

    return (

     <Container>
         <Box my={10}>
        {connectionStatus === 'connected' ? (
            <div>
                <h2>Current wallet: {currentWallet.name}</h2>
                <HStack>
                    <Box>Accounts:</Box>
                    <ul>
                        {currentWallet.accounts.map((account) => (
                            <li key={account.address}>{account.address}</li>
                        ))}
                    </ul>
                </HStack>
            </div>
        ) : (
            <div>Connection status: {connectionStatus}</div>
        )}
         </Box>
        <Tabs variant='enclosed'>
            <TabList>
                <Tab>✅Task1</Tab>
                <Tab>✅Task2</Tab>
                <Tab>Task3</Tab>
                <Tab>Task4</Tab>
            </TabList>

            <TabPanels>
                <TabPanel>
                    <Task1></Task1>
                </TabPanel>
                <TabPanel>
                    <Task2></Task2>
                </TabPanel>
                <TabPanel>
                    <p>wait</p>
                </TabPanel>
                <TabPanel>
                    <p>wait</p>
                </TabPanel>
            </TabPanels>
        </Tabs>
    </Container>

    );
}
