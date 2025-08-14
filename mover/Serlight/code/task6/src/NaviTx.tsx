import { Container, Text, Button } from "@radix-ui/themes";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { useSignAndExecuteTransactionBlock, useCurrentAccount } from "@mysten/dapp-kit";
import { pool, Sui, USDC } from 'navi-sdk/dist/address'
import { depositCoin, borrowCoin} from 'navi-sdk/dist/libs/PTB';
import { PoolConfig, Pool } from "navi-sdk/dist/types";

export function NaviTx() {
  
  const { mutate: signAndExecuteTransaction } = useSignAndExecuteTransactionBlock()

  function prefixInteger(num: number, length: number): string {
    return (num / Math.pow(10, length)).toFixed(length).substring(2)
  }

  const depostSuiAmount = 1 * (10 ** Sui.decimal);

  function currentTransactionAmount(): number {
    const time = new Date()
    const transactionAmount = "0." + prefixInteger(time.getMonth(), 2) + prefixInteger(time.getDay(), 2) + prefixInteger(time.getHours(), 2);
    return Number(transactionAmount)
  }

  const account = useCurrentAccount()!;

  async function executeTX() {
    try {
      
      const transactionBlock = new TransactionBlock();
      transactionBlock.setSender(account!.address);

      const suiPool: PoolConfig = pool[Sui.symbol as keyof Pool];
      // 构造存入的 object ， gas and depost amount
      const [depost_sui_obj] = transactionBlock.splitCoins(
        transactionBlock.gas,
        [transactionBlock.pure(depostSuiAmount)]
      );

      await depositCoin(transactionBlock, suiPool, depost_sui_obj, depostSuiAmount);

      const borrow_usdc_amount = currentTransactionAmount() * (10 ** USDC.decimal);
      const usdcPool: PoolConfig = pool[USDC.symbol as keyof Pool];
      const [borrow_usdc_obj] = await borrowCoin(transactionBlock, usdcPool, borrow_usdc_amount);

      await depositCoin(transactionBlock, usdcPool, borrow_usdc_obj, borrow_usdc_amount);
      debugger
      signAndExecuteTransaction({
        transactionBlock: transactionBlock, 
        account: account,
        chain: 'sui::mainnet'
      }, {
        onSuccess: (response) => {
          console.log("success:",response)
        },
        onError: (error) => {
          console.log("error:", error)
        },
        onSettled: (result) => {
          console.log("settled:", result)
        }
      })
    } catch (error) {
      console.log("error: ", error)
    }
  }
  

  return (
    <Container>

      <Button variant="solid" onClick={executeTX}> Navi Transaction</Button>

    </Container>
  );
}