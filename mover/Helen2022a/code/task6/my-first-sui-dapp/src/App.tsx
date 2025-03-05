import { useCurrentAccount, useSignAndExecuteTransaction, ConnectButton, useConnectWallet, useWallets } from "@mysten/dapp-kit";
import { Container, Flex, Heading, Text, Button } from "@radix-ui/themes";
import { wUSDC } from "navi-sdk/dist/address";
import { borrowAction } from "./borrowFromNavi.ts";

//根据月、日、小时计算借出的usdc的金额
const calculateBorrowAmount = (month: number, day: number, hour: number): number => {
  const borrowAmountStr = `0.${month.toString().padStart(2, "0")}${day.toString().padStart(2, "0")}${hour.toString().padStart(2, "0")}`;
  //需要乘以wUSDC的精度: 10 ** wUSDC.decimal
  return parseFloat(borrowAmountStr) * 10 ** wUSDC.decimal;
};

const App = () => {

  const wallets = useWallets();
  const { mutate: connect } = useConnectWallet();

  const account = useCurrentAccount();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();

  // 获取当前日期生成借出usdc的金额
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
                Connected to {wallet.name}
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

      <Text>========================================================================================</Text>
      <Heading mb="2">Transaction Action</Heading>
      {account ? (
        <Flex direction="column">
          <Heading mb="3">Execute the following steps in one transaction:</Heading>
          <Flex direction="column">
            <Text>  1. Deposit 1 SUI into Navi Protocol </Text>
            <Text>  {`2. Borrow ${usdcAmount} USDC from Navi Protocal`}</Text>
            <Text>  3. Deposit the same amount of USDC</Text>
          </Flex>
          <Button
            size="3" 
            onClick={() => {
              borrowAction(account, {
                signAndExecute, usdcAmount, onSuccess(result) {
                  console.log(result, 'Succeeded to execute the transaction!')
                }, onError(error) {
                  console.log(error, 'Failed to execute the transaction!')
                },
              });
            }}
            style={{ cursor: 'pointer', width: '300px' }}
          >
            <Text>Execute this transaction</Text>
          </Button>
        </Flex>
      ) : null}
    </Container>
  );
}

export default App;

