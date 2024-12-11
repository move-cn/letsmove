import {
    useCurrentAccount,
    useSignAndExecuteTransaction,
    useSuiClient,
    useSuiClientQuery,
  } from "@mysten/dapp-kit";
  import type { SuiObjectData } from "@mysten/sui/client";
  import { Transaction } from "@mysten/sui/transactions";
  import { Button, Flex, Heading, Text } from "@radix-ui/themes";
  import { useNetworkVariable } from "./networkConfig";
  import { useState } from "react";
  import ClipLoader from "react-spinners/ClipLoader";
  import {get_nav_test_tx} from './tx'
  
  export function NaviTest() {
    const suiClient = useSuiClient();
    const currentAccount = useCurrentAccount();
    const { mutate: signAndExecute } = useSignAndExecuteTransaction();
    const [waitingForTxn, setWaitingForTxn] = useState("");
    const executeMoveCall = () => {
    const tx = get_nav_test_tx();  
    
    signAndExecute(
        {
          transaction: tx,
        },
        {
          onSuccess: (tx) => {
            suiClient.waitForTransaction({ digest: tx.digest }).then(async () => {
              setWaitingForTxn("");
            });
          },
          onError :(err) =>{
            console.log(err);
          }
        },
      );
    };
    return (
      <>
        <Flex direction="column" gap="2">
          <Flex direction="row" gap="2">
            <Button
              onClick={() => executeMoveCall()}
              disabled={waitingForTxn !== ""}
            >
 	     Do Navi Test
            </Button>

          </Flex>
        </Flex>
      </>
    );
  }

  