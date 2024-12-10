import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Container, Flex, Box, Heading, Text, TextField, Button } from "@radix-ui/themes";

import { Transaction, coinWithBalance } from '@mysten/sui/transactions';
import { depositCoin, borrowCoin } from 'navi-sdk/dist/libs/PTB';
import { Sui, nUSDC, pool } from 'navi-sdk/dist/address';
import { Pool } from "navi-sdk/dist/types";
import { useState } from "react";


async function task6(account: any, signAndExecuteTransaction: any, setDigest:any, sui_amount = 1, usdc_amount = 0.120516) {
    const sui_mist = sui_amount  * (10 ** Sui.decimal);
    const usdc_mist = usdc_amount * (10 ** nUSDC.decimal);
  
    const sui_coin = coinWithBalance({type: Sui.address, balance: sui_mist});

    const sui_pool = pool[Sui.symbol as keyof Pool];
    const usdc_pool = pool[nUSDC.symbol as keyof Pool];
    const tx = new Transaction();
    tx.setSender(account.address);
    tx.setGasBudgetIfNotSet(10 ** Sui.decimal);
    await depositCoin(tx, sui_pool, sui_coin, sui_mist);
    const [usdc_coin] = await borrowCoin(tx, usdc_pool, usdc_mist);
    await depositCoin(tx, usdc_pool, usdc_coin, usdc_mist);
    signAndExecuteTransaction(
      {
        transaction: tx,
        chain: "sui:mainnet",
        options: {
            showEvents: true,
        },
      },
      {
        onSuccess: (result: any) => {
          console.log(result);
          setDigest(result.digest);
        },
        onError: (error: any) => {
          console.error(error);
        },
      }
    )
}


export function NaviDemo() {
    const account = useCurrentAccount();
    const [suiAmount, setSuiAmount] = useState("1");
    const [usdcAmount, setUsdcAmount] = useState("0.120516");
    const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransaction();
    const [digest, setDigest] = useState('');
    
    if (!account) {
        return;
    }

    return (
      <Container my="2">
        <Heading mb="2">Task 6</Heading>
        <Text>Deposit Sui, borrow and deposit usdc in one ptb: </Text>
        <Flex my="2" direction="row" gap="3">
          <Box maxWidth="250px">
            <TextField.Root 
              size="3" 
              placeholder="Sui Amount" 
              value={suiAmount} 
              onChange={(e) => setSuiAmount(e.target.value)} 
            />
          </Box>
          <Box maxWidth="250px">
            <TextField.Root 
              size="3" 
              placeholder="USDC Amount" 
              value={usdcAmount} 
              onChange={(e) => setUsdcAmount(e.target.value)}
            />
          </Box>
          <Box>
            <Button 
              size="3" 
              onClick={() => task6(account, signAndExecuteTransaction, setDigest, Number(suiAmount), Number(usdcAmount))}
            >
              Sign
            </Button>
          </Box>
        </Flex>
        { 
          digest != "" ? <Text>TxDigest {digest}</Text> : <Text>input amount click button</Text>
        }
      </Container>
    );
}