import dotenv from 'dotenv';
import { NAVISDKClient } from 'navi-sdk';

dotenv.config();
const mnemonic = process.env.mnemonic || ""; 
// Use an existing mnemonic or leave empty to generate a new one
const client = new NAVISDKClient({
  mnemonic,
  networkType: "mainnet", 
  numberOfAccounts: 5
}); 
const account = client.accounts[0];