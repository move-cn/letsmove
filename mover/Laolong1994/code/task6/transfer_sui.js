import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';

// random Keypair 随机创建私钥对
const keypair = new Ed25519Keypair();

//输出公钥地址
const publicKey = keypair.getPublicKey();
console.log(publicKey)