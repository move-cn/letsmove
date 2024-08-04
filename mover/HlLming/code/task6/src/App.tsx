import "./App.css";
import {
  ConnectButton,
  useAccountBalance,
  useWallet,
  ErrorCode,
  formatSUI,
} from "@suiet/wallet-kit";
import "@suiet/wallet-kit/style.css";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import {depositCoin, borrowCoin} from 'navi-sdk/dist/libs/PTB'
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import {Sui, USDC} from 'navi-sdk/dist/address';

function App() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();

  function uint8arrayToHex(value: Uint8Array | undefined) {
    if (!value) return "";
    // @ts-ignore
    return value.toString("hex");
  }

  async function handleNAVISDK() {
    if (!wallet.account) return;
    const account = wallet.account;
    const sender = account.address;
    try {
      let txb = new TransactionBlock();
      txb.setSender(sender);
      
      let getCoinInfo = balance;
      if (!getCoinInfo) {
          throw new Error("Insufficient balance");
      }
      
      let deposit_amount = 1e9;
      let sui_symbol = Sui.symbol;
      const pool_sui: PoolConfig = pool[sui_symbol as keyof Pool];
      const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
      await depositCoin(txb, pool_sui, to_deposit, deposit_amount);
  
      let borrow_amount = 0.072817 * 1e6;
      let usdc_symbol = USDC.symbol;
      const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
      const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);     
  
      await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);
  
      const resData = await wallet.signAndExecuteTransactionBlock({
        transactionBlock: txb,
      });
      console.log("transaction digest: " + JSON.stringify(resData));
    } catch (e) {
      console.error("failed", e);
      alert("failed (see response in the console)");
    }
  }

  return (
    <div className="App">
      <div className="card">
        <ConnectButton
          onConnectError={(error) => {
            if (error.code === ErrorCode.WALLET__CONNECT_ERROR__USER_REJECTED) {
              console.warn(
                "user rejected the connection to " + error.details?.wallet
              );
            } else {
              console.warn("unknown connect error: ", error);
            }
          }}
        />

        {!wallet.connected ? (
          <p>Connect wallet from now!</p>
        ) : (
          <div>
            <div>
              <p>current wallet: {wallet.adapter?.name}</p>
              <p>
                wallet status:{" "}
                {wallet.connecting
                  ? "connecting"
                  : wallet.connected
                  ? "connected"
                  : "disconnected"}
              </p>
              <p>wallet address: {wallet.account?.address}</p>
              <p>current network: {wallet.chain?.name}</p>
              <p>
                wallet balance:{" "}
                {formatSUI(balance ?? 0, {
                  withAbbr: false,
                })}{" "}
                SUI
              </p>
              <p>
                wallet publicKey: {uint8arrayToHex(wallet.account?.publicKey)}
              </p>
            </div>
            <div className={"btn-group"} style={{ margin: "8px 0" }}>
              <button onClick={handleNAVISDK}>PTB_OP</button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default App;
