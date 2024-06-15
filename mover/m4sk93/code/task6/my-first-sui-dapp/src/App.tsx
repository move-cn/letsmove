import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";


import { ConnectButton, useCurrentAccount, useSignAndExecuteTransactionBlock} from "@mysten/dapp-kit";

import { NAVISDKClient } from 'navi-sdk'
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin,withdrawCoin, borrowCoin, flashloan,repayFlashLoan, SignAndSubmitTXB, mergeCoins} from 'navi-sdk/dist/libs/PTB'
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import { USDC } from 'navi-sdk/dist/address'

import { Sui } from 'navi-sdk/dist/address'



function App() {
  const account = useCurrentAccount();
  const { mutate: signAndExecuteTransactionBlock } = useSignAndExecuteTransactionBlock();

  function showConfirm(): void {
      let userConfirmed = confirm("Are you sure？");
      if (userConfirmed) {
          console.log("Sure.");
      } else {
          console.log("Not sure.");
      }
  }

  ///fail???
  ///withdraw fail
  async function test_deposit_and_withdraw() {
    if (!account) {
      console.log('Invalid account');
      return;
    };
    const sender = account.address;
    console.log(sender);
    let txb: TransactionBlock = new TransactionBlock();
    txb.setSender(sender);

    let deposit_amount = 1e9;
    let withdraw_amount = 1e9;

    let sui_symbol = Sui.symbol;
    const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];

    const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
    await depositCoin(txb, pool_sui, to_deposit, deposit_amount);
    await withdrawCoin(txb, pool_sui, withdraw_amount);

    signAndExecuteTransactionBlock(
	  	{
        transactionBlock: txb,
        chain: 'sui::mainnet',
	  	},
	  	{
	  		onSuccess: (result) => {
	  			console.log('executed transaction block', result);
	  			///setDigest(result.digest);
	  		},
	  	},
	  );

  }

  async function test_deposit_borrow_deposit() {
    if (!account) {
      console.log('Invalid account');
      return;
    };
    const sender = account.address;
    console.log(sender);
    let txb: TransactionBlock = new TransactionBlock();
    txb.setSender(sender);

    let deposit_amount = 1e9;
    let borrow_amount = 0.052522 * 1e6;

    let sui_symbol = Sui.symbol;
    let usdc_symbol = USDC.symbol;

    const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];
    const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];

    const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
    await depositCoin(txb, pool_sui, to_deposit, deposit_amount);
    const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);
    await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);

    signAndExecuteTransactionBlock(
	  	{
        transactionBlock: txb,
        chain: 'sui::mainnet',
	  	},
	  	{
	  		onSuccess: (result) => {
	  			console.log('executed transaction block', result);
	  			///setDigest(result.digest);
	  		},
	  	},
	  );
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
          <Heading>dApp Starter Template</Heading>
        </Box>

        <Box>
          <ConnectButton />
        </Box>
      </Flex>
      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <WalletStatus />
        </Container>
      </Container>
      <button onClick={showConfirm}>Test</button>
      <button onClick={test_deposit_and_withdraw}>test_deposit_and_withdraw</button>
      <button onClick={test_deposit_borrow_deposit}>test_deposit_borrow_deposit</button>
    </>
  );
}

export default App;
