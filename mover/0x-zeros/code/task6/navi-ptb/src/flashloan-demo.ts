// copy from https://github.com/naviprotocol/navi-sdk/blob/main/examples/flashloan-demo/flashloan-demo.ts
//参考ptb的用法

import { NAVISDKClient } from "navi-sdk";
import { Transaction } from "@mysten/sui/transactions";
import { flashloan, repayFlashLoan, SignAndSubmitTXB } from "navi-sdk/dist/libs/PTB";
import { CoinInfo, PoolConfig, Pool } from "navi-sdk/dist/types";
import { pool, wUSDC, nUSDC } from "navi-sdk/dist/address";
// import dotenv from "dotenv";

// dotenv.config();

/**
 * Configuration Zone
 *
 * NOTE:
 * - `wUSDC` (Wormhole USDC): USDC bridged to the Sui network via the Wormhole protocol.
 * - `nUSDC` (Native USDC): Native USDC issued directly on the Sui network.
 *
 * Choose the appropriate token based on your use case.
 */
const CONFIG: {
    mnemonic: string | undefined;
    networkType: string;
    numberOfAccounts: number;
    toBorrowCoin: CoinInfo; 
    amountToBorrow: number;
} = {
    mnemonic: process.env.mnemonic, // Wallet mnemonic
    networkType: "mainnet", // Network type
    numberOfAccounts: 1, // Number of accounts to initialize
    toBorrowCoin: nUSDC, // Coin to borrow (default: Native USDC)
    amountToBorrow: 1, // Borrow amount (in whole units, e.g., 1 Native USDC)
};
if (!CONFIG.mnemonic) {
    throw new Error("Mnemonic is not defined in environment variables");
}


/**
 * SECURITY WARNING:
 * Ensure that your `.env` file containing the mnemonic is included in `.gitignore`
 * to prevent accidental uploads to GitHub or other repositories.
 */

// Initialize NAVISDKClient
const client = new NAVISDKClient({
    mnemonic: CONFIG.mnemonic,
    networkType: CONFIG.networkType,
    numberOfAccounts: CONFIG.numberOfAccounts,
});

/**
 * Main function to execute the flashloan process
 */
async function executeFlashLoan() {
    const tx = new Transaction();
    const account = client.accounts[0];
    const sender = account.address;

    console.log("Sender Address:", sender);
    tx.setSender(sender);

    try {
        // Fetch the coin object for the account
        const sourceTokenObjAddress = await account.getCoins(CONFIG.toBorrowCoin);
        const coinObjects = sourceTokenObjAddress.data || [];
        if (coinObjects.length === 0) {
            throw new Error(`No coin objects found for ${CONFIG.toBorrowCoin.symbol}`);
        }
        const sourceTokenObj = tx.object(coinObjects[0].coinObjectId);

        // Retrieve loan pool configuration
        const loanPoolConfig: PoolConfig = pool[CONFIG.toBorrowCoin.symbol as keyof Pool];
        console.log("Loan Pool Configuration:", loanPoolConfig);

        // Calculate the amount to borrow in smallest units (wei-like units)
        const borrowAmountInWei = CONFIG.amountToBorrow * 10 ** CONFIG.toBorrowCoin.decimal;

        // Execute flashloan and get the borrowed balance
        const [borrowedBalance, receipt] = await flashloan(tx, loanPoolConfig, borrowAmountInWei);

        // Merge borrowed funds with the wallet balance
        const flashCoin = createCoinFromBalance(tx, borrowedBalance, loanPoolConfig.type);
        tx.mergeCoins(sourceTokenObj, [flashCoin]);

        // Prepare repayment balance
        const repayBalance = createCoinIntoBalance(tx, sourceTokenObj, loanPoolConfig.type);

        // Repay the flashloan
        const [remainingBalance] = await repayFlashLoan(tx, loanPoolConfig, receipt, repayBalance);

        // Transfer remaining funds back to the wallet
        const extraCoin = createCoinFromBalance(tx, remainingBalance, loanPoolConfig.type);
        tx.transferObjects([extraCoin], sender);

        // Sign and submit the transaction
        const result = await SignAndSubmitTXB(tx, account.client, account.keypair);
        console.log("Transaction Result:", result);
    } catch (error) {
        console.error("Error during flashloan execution:", error);
    }
}

/**
 * Helper function to create a coin from a balance
 */
function createCoinFromBalance(tx: Transaction, balance: any, type: string) {
    return tx.moveCall({
        target: "0x2::coin::from_balance",
        arguments: [balance],
        typeArguments: [type],
    });
}

/**
 * Helper function to convert a coin object into a balance
 */
function createCoinIntoBalance(tx: Transaction, coin: any, type: string) {
    return tx.moveCall({
        target: "0x2::coin::into_balance",
        arguments: [coin],
        typeArguments: [type],
    });
}

// Execute the script
(async () => {
    await executeFlashLoan();
})();