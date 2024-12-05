import { Transaction } from "@mysten/sui/transactions";
import { Button, Container } from "@radix-ui/themes";
import { useSignAndExecuteTransaction, useSuiClient } from "@mysten/dapp-kit";
// import { useNetworkVariable } from "./networkConfig";
import ClipLoader from "react-spinners/ClipLoader";
import {Pool, PoolConfig} from "navi-sdk/dist/types";
import {nUSDC , pool, Sui} from "navi-sdk/dist/address";
import {depositCoin} from "navi-sdk";
import {borrowCoin, repayDebt} from "navi-sdk/dist/libs/PTB";

export function CreateCounter() {
  const suiClient = useSuiClient();
  const {
    mutate: signAndExecute,
    isSuccess,
    isPending,
  } = useSignAndExecuteTransaction();

   async function executeBorrow() {
    const tx = new Transaction();

    // const account = client.accounts[0];
    // const sender = account.address;
    const toBorrowCoin =  nUSDC;
    const    amountToBorrow =  0.120213;

    // console.log("Sender Address:", sender);
    // tx.setSender(sender);

    // try {
      // Fetch the coin object for the account

      // const sourceTokenObjAddress = await suiClient.getCoins(toBorrowCoin);
      // const coinObjects = sourceTokenObjAddress.data || [];
      // if (coinObjects.length === 0) {
      //   throw new Error(`No coin objects found for ${toBorrowCoin.symbol}`);
      // }

      // const sourceTokenObj = tx.object(coinObjects[0].coinObjectId);

      // Retrieve loan pool configuration
      const loanPoolConfig: PoolConfig = pool[toBorrowCoin.symbol as keyof Pool];
      console.log("Loan Pool Configuration:", loanPoolConfig);

      const suiPoolConfig: PoolConfig = pool[Sui.symbol as keyof  Pool];

      const [coin] = tx.splitCoins(tx.gas, [1e9]);
      await depositCoin(tx,suiPoolConfig,coin,1e9)
       console.log("deposit coin",coin)


      // Calculate the amount to borrow in smallest units (wei-like units)
      const borrowAmountInWei = amountToBorrow * 10 ** toBorrowCoin.decimal;
      const [borrowedCoin] = await borrowCoin(tx,loanPoolConfig, borrowAmountInWei)
      await repayDebt(tx, loanPoolConfig,borrowedCoin,borrowAmountInWei)
      signAndExecute(
          {
            transaction: tx,
          },
          {
            onSuccess: async ({ digest }) => {
              const { effects } = await suiClient.waitForTransaction({
                digest: digest,
                options: {
                  showEffects: true,
                },
              });
              console.log("transaction effects",effects)
              // onCreated(effects?.created?.[0]?.reference?.objectId!);
            },
          },
      );
      console.log("Transaction Result:", "result");
    // } catch (error) {
    //   console.error("Error during flashloan execution:", error);
    // }
  }

  return (
    <Container>
      <Button
        size="3"
        onClick={() => {
          executeBorrow();
        }}
        disabled={isSuccess || isPending}
      >
        {isSuccess || isPending ? <ClipLoader size={20} /> : "PTB call"}
      </Button>
    </Container>
  );
}
