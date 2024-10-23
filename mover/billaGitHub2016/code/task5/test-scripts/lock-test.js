import { Transaction } from '@mysten/sui/transactions';
import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';

// const ENV = 'testnet'
const ENV = 'mainnet'

 // replace <YOUR_SUI_ADDRESS> with your actual address, which is in the form 0x123...
const MY_ADDRESS = '0x4c016d80dbd4c4715a877fe274fe33bdd33b1557e38f888db23be790564fcfd6';
const secretKey = 'suiprivkey1qqtjl0fs9p5z9ra374w2fft0ap5rlnw24faml6e3nw2p0dt5fdrm6n0u0v5'
// const gas_coin_id = '0x3a853c33b8bb5f53c43505b581fe74776d7cf310f3a70be9793e799abec7caaf' // testnet
const gas_coin_id = '0x27dbf068010152c93270733d88f033a4f3f43866027584bc3a24617fa6c1225f' // mainnet
// const lock_coin = '0x3e483c54381c9bd9e82b3d28142632c42f531a627346c6a84bc9f001c93524ee' // testnet
const lock_coin = '0xc2ad3bd110a62c6cbad7f466b45bdd7902fc206a03304a168d77cd86534a4269' // mainnet

// const target = '0x2b7839e43026493223be4d5412f66f029c4710b2dd1d8aa8657d9e8dac212805::billa_github2016_lock::lock' // testnet
const target = '0x410ceddd715f97c511d21a17a95a3eedbab9b23de7c6773ff2a9aa5172217109::billa_github2016_lock::lock' // mainnet
 
const tx = new Transaction();

// create a new SuiClient object pointing to the network you want to use
const client = new SuiClient({ url: getFullnodeUrl(ENV) });

const lockCoin = await client.getObject({ id: lock_coin, options: { showType: true } });
console.log('lockCoin = ', lockCoin)
const [ locked, key ] = tx.moveCall({
    target,
    arguments: [
        tx.object(lockCoin.data.objectId)
    ],
    typeArguments: [lockCoin.data.type]
})

// tx.transferObjects([locked, key], tx.pure.address(MY_ADDRESS));
tx.transferObjects([locked, key], MY_ADDRESS);

const coinToPay = await client.getObject({ id: gas_coin_id });
console.log('coinToPay = ', coinToPay)
tx.setGasPayment([coinToPay.data]);
tx.setGasBudget(40000000);

// random Keypair
// const keypair = new Ed25519Keypair();
let keypair = Ed25519Keypair.fromSecretKey(secretKey);
// const { bytes, signature } = tx.sign({ client, signer: keypair });
// const result = await client.executeTransactionBlock({
// 	transactionBlock: bytes,
// 	signature,
// 	requestType: 'WaitForLocalExecution',
// 	options: {
// 		showEffects: true,
// 	},
// });

const result = await client.signAndExecuteTransaction({ signer: keypair, transaction: tx });
// console.log('result = ', result)
const digestResult = await client.waitForTransaction({ digest: result.digest });
console.log('digestResult = ', digestResult)

