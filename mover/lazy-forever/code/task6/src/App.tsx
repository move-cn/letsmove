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
            console.log("pool_sui", pool_sui);
            const [to_deposit] = txb.splitCoins(txb.gas, [deposit_amount]);
            console.log("to_deposit", to_deposit);
            await depositCoin(txb, pool_sui, to_deposit, deposit_amount);

            let borrow_amount = 80119;
            let usdc_symbol = USDC.symbol;
            const pool_usdc: PoolConfig = pool[usdc_symbol as keyof Pool];
            console.log("pool_usdc", pool_usdc);
            const [borrow_coin] = await borrowCoin(txb, pool_usdc, borrow_amount);
            console.log("borrow_coin", borrow_coin);

            await depositCoin(txb, pool_usdc, borrow_coin, borrow_amount);
            console.log("txb", txb);

            const resData = await wallet.signAndExecuteTransaction({
                transaction: txb,
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
                        </div>
                        <div className={"btn-group"} style={{ margin: "8px 0" }}>
                            <button onClick={handleNAVISDK}>Trans</button>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}

export default App;