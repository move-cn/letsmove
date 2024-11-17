import suietLogo from "./assets/suiet-logo.svg";
import "./App.css";
import {
  ConnectButton,
  useAccountBalance,
  useWallet,
  SuiChainId,
  ErrorCode,
  formatSUI,
} from "@suiet/wallet-kit";
import "@suiet/wallet-kit/style.css";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { useMemo } from "react";
import { NAVISDKClient } from 'navi-sdk'
import {depositCoin, borrowCoin, SignAndSubmitTXB } from 'navi-sdk/dist/libs/PTB'
import { Pool, PoolConfig } from "navi-sdk/dist/types";
import { pool } from 'navi-sdk/dist/address'
import {Sui, USDC} from 'navi-sdk/dist/address';

const sampleNft = new Map([
  [
    "sui:devnet",
    "0xe146dbd6d33d7227700328a9421c58ed34546f998acdc42a1d05b4818b49faa2::nft::mint",
  ],
  [
    "sui:testnet",
    "0x5ea6aafe995ce6506f07335a40942024106a57f6311cb341239abf2c3ac7b82f::nft::mint",
  ],
  [
    "sui:mainnet",
    "0x5b45da03d42b064f5e051741b6fed3b29eb817c7923b83b92f37a1d2abf4fbab::nft::mint",
  ],
]);

function App() {
  const wallet = useWallet();
  const { balance } = useAccountBalance();
  const nftContractAddr = useMemo(() => {
    if (!wallet.chain) return "";
    return sampleNft.get(wallet.chain.id) ?? "";
  }, [wallet]);

  function uint8arrayToHex(value: Uint8Array | undefined) {
    if (!value) return "";
    // @ts-ignore
    return value.toString("hex");
  }

  async function handleExecuteMoveCall(target: string | undefined) {
    if (!target) return;
  }

  async function handleSignMsg() {
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
  
      let borrow_amount = 0.081822 * 1e6;
      let usdc_symbol = USDC.symbol;
      const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
      const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);     
  
      await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);
  
      const resData = await wallet.signAndExecuteTransactionBlock({
        transactionBlock: txb,
      });
      console.log("transaction digest: " + resData);
    } catch (e) {
      console.error("failed", e);
      alert("failed (see response in the console)");
    }
  }

  const chainName = (chainId: string | undefined) => {
    switch (chainId) {
      case SuiChainId.MAIN_NET:
        return "Mainnet";
      case SuiChainId.TEST_NET:
        return "Testnet";
      case SuiChainId.DEV_NET:
        return "Devnet";
      default:
        return "Unknown";
    }
  };

  return (
    <div className="App">
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src="/vite.svg" className="logo" alt="Vite logo" />
        </a>
        <a href="https://github.com/suiet/wallet-kit" target="_blank">
          <img src={suietLogo} className="logo" alt="Suiet logo" />
        </a>
      </div>
      <h1>Vite + Suiet Kit</h1>
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
          <p>Connect DApp with Suiet wallet from now!</p>
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
              <button onClick={handleSignMsg}>PTB_OP</button>
            </div>
          </div>
        )}
      </div>
      <p className="read-the-docs">
        Click on the Vite and Suiet logos to learn more
      </p>
    </div>
  );
}

export default App;
