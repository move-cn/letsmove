import { useCurrentAccount, useSignAndExecuteTransaction } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text, Button } from "@radix-ui/themes";
import { ConnectButton, useConnectWallet, useWallets } from '@mysten/dapp-kit';
import { wUSDC } from "navi-sdk/dist/address";
import { mainAction } from "./NAVI.ts";

const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
  const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
  return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

const Execute = () => {

  const wallets = useWallets();
  const { mutate: connect } = useConnectWallet();

  const account = useCurrentAccount();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();

  const date = new Date();
  const usdcAmount = calculateBorrowAmount(date.getMonth() + 1, date.getDate(), date.getHours());

  return (


    <Container my="2">
      <Heading mb="2">Wallet Status</Heading>

      <div style={{ padding: 20 }}>
        <ConnectButton />
        <ul>
          {wallets.map((wallet) => (
            <li key={wallet.name}>
              <button
                onClick={() => {
                  connect(
                    { wallet },
                    {
                      onSuccess: () => console.log('connected'),
                    },
                  );
                }}
              >
                Connect to {wallet.name}
              </button>
            </li>
          ))}
        </ul>
      </div>

      {account ? (
        <Flex direction="column">
          <Text>Wallet connected</Text>
          <Text>Address: {account.address}</Text>
        </Flex>
      ) : (
        <Text>Wallet not connected</Text>
      )}

      <Heading mb="2">Transaction Action</Heading>
      {account ? (
        <Flex direction="column">
          <Heading mb="2">执行交易</Heading>
          <Flex direction="column">
            <Text>1. [存入Navi Protocol 1 SUI] </Text>
            <Text>{`2.[借出当前日期的USDC ${usdcAmount} 的 USDC ]`}</Text>
            <Text>3.[然后在存入等额的USDC]</Text>
          </Flex>
          <Button
            size="3"
            onClick={() => {
              mainAction(account, {
                signAndExecute, usdcAmount, onSuccess(result) {
                  console.log(result, 'Transaction success!')
                }, onError(error) {
                  console.log(error, 'Something went wrong!')
                },
              });
            }}
            style={{ cursor: 'pointer' }}
          >
            <Text>点击执行此交易</Text>
          </Button>
        </Flex>
      ) : null}
    </Container>
  );
}

export default Execute;
