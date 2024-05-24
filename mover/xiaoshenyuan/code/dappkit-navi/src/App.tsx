import {ConnectButton, useCurrentAccount, useSignAndExecuteTransactionBlock} from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {Pool,PoolConfig} from "navi-sdk/dist/types";
import {pool,Sui, USDC} from 'navi-sdk/dist/address';
import { WalletStatus } from "./WalletStatus";
import {borrowCoin, depositCoin} from "navi-sdk/dist/libs/PTB";
import dayjs from 'dayjs';


function App() {
  const account = useCurrentAccount();
  const { mutate: signAndExecuteTransactionBlock } = useSignAndExecuteTransactionBlock();
  async function deposit_borrow_resupply() {
    if (!account) return;
    const sender = account.address;
    let txb: TransactionBlock = new TransactionBlock();
    txb.setSender(sender);

    let deposit_amount = 1e9;
    let sui_symbol = Sui.symbol;
    const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];
    const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
    // @ts-ignore
    await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

    let s = dayjs().format('MMDDHH');
    let borrow_float = parseFloat("0.".concat(s));
    let borrow_amount = borrow_float * 1e6;

    let usdc_symbol = USDC.symbol;
    const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
    const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);

    await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);
    signAndExecuteTransactionBlock({
      transactionBlock: txb,
      chain: 'sui::mainnet'
    },{
        onSuccess: (result) => {
          console.log('executed transaction block', result);
          // setDigest(result.digest);
        }
      }
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
          <ConnectButton/>
        </Box>
      </Flex>
      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{background: "var(--gray-a2)", minHeight: 500}}
        >
          <WalletStatus/>
        </Container>
      </Container>
      <button onClick={deposit_borrow_resupply}>Send me Sui!</button>
    </>
  );
}

export default App;
