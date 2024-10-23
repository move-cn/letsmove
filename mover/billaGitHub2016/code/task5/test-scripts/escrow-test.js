import { Transaction, Inputs } from '@mysten/sui/transactions';
import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';

// const ENV = 'testnet'
const ENV = 'mainnet'

const ADDRESS = '0x28eb471d3f18c0faa15ded45c0442d99fa5226c2d7e63b14d731f6a6a7b10e74';
const lock_owner_address = '0x4c016d80dbd4c4715a877fe274fe33bdd33b1557e38f888db23be790564fcfd6'
const secretKey = 'suiprivkey1qr2eldw0pwq9tkalfh3y5unlup7d99flthcpnec2pesrv7r0uc4rkuy8prd'
const lockOwnerSecretKey = 'suiprivkey1qqtjl0fs9p5z9ra374w2fft0ap5rlnw24faml6e3nw2p0dt5fdrm6n0u0v5'

async function createEscrow() {
    // const target = '0x2b7839e43026493223be4d5412f66f029c4710b2dd1d8aa8657d9e8dac212805::billa_github2016_shared::create' // testnet
    const target = '0x410ceddd715f97c511d21a17a95a3eedbab9b23de7c6773ff2a9aa5172217109::billa_github2016_shared::create' // mainnet
    // const escrow_coin_id = '0x8e846e2accca62a838c406ddbbea25fd27a77c4f4e6f4ed5b057c700fa181c0f' // testnet
    const escrow_coin_id = '0xa0e04d17525f58e12d8f341722ec7bab291792b50bdcda3570a9e70900a1474e' // mainnet
    // const lock_key_id = '0xfecf3af70f7a2b3d7db741c2cb6eda554ced89e97ebf00ecf46ad04990e74fd8' // testnet
    const lock_key_id = '0x3d1e532800e2cda61dfdc96bb93e7d9de88b02dff0aee8ff86cb405a2ed0fd63' // mainnet
    // const gas_coin_id = '0x15dd7c7954f2e6982a9d54d687f965cad743b72768cadd5aa28d241adfc5f97d' // testnet
    const gas_coin_id = '0x06a98ae2a006b40e9b6524004a4c66d9aea34742798c5d42a7c92f129e63e7a1' // testnet

    const tx = new Transaction();
    
    // create a new SuiClient object pointing to the network you want to use
    const client = new SuiClient({ url: getFullnodeUrl(ENV) });
    
    const swapCoin = await client.getObject({ id: escrow_coin_id, options: { showType: true } });
    console.log('swapCoin = ', swapCoin)
    tx.moveCall({
        target,
        arguments: [
            tx.object(swapCoin.data.objectId),
            tx.object(lock_key_id),
            tx.pure.address(lock_owner_address)
        ],
        typeArguments: [swapCoin.data.type]
    })
    
    const coinToPay = await client.getObject({ id: gas_coin_id });
    // console.log('coinToPay = ', coinToPay)
    tx.setGasPayment([coinToPay.data]);
    tx.setGasBudget(30000000);
    
    // random Keypair
    let keypair = Ed25519Keypair.fromSecretKey(secretKey);
    
    const result = await client.signAndExecuteTransaction({ signer: keypair, transaction: tx });
    const digestResult = await client.waitForTransaction({ digest: result.digest });
    console.log('digestResult = ', digestResult)    
}

async function swapEscrow() {
    // const target = '0x2b7839e43026493223be4d5412f66f029c4710b2dd1d8aa8657d9e8dac212805::billa_github2016_shared::swap' // testnet
    const target = '0x410ceddd715f97c511d21a17a95a3eedbab9b23de7c6773ff2a9aa5172217109::billa_github2016_shared::swap' // mainnet
    // const escrow_id = '0x1adec696ca420bf94aefea18dd9658a58b3d691fbbbc99cf18c975cb89aeec32' // testnet
    const escrow_id = '0x6e3b73e04a15331c699a5f2b9c6c3446058cfad6e6eb908dfd667ccecf9056ee' // mainnet
    // const key_id = '0xfecf3af70f7a2b3d7db741c2cb6eda554ced89e97ebf00ecf46ad04990e74fd8' // testnet
    const key_id = '0x3d1e532800e2cda61dfdc96bb93e7d9de88b02dff0aee8ff86cb405a2ed0fd63' // mainnet
    // const lock_id = '0xca539eb68f0e90597ea185643c2901ea47592fff4a609cf356dd08e59f35cf5f' // testnet
    const lock_id = '0xa1006587870b4589e5a5820abab53d9e840237ba9591ee957352dea8401ed617' // mainnet
    // const gas_coin_id = '0xd0b3cef5f21c2a6d3ddf7cc03e83302cd20df9d65eef325333e01d3368b9d29e' // testnet
    const gas_coin_id = '0x27dbf068010152c93270733d88f033a4f3f43866027584bc3a24617fa6c1225f' // mainnet

    const tx = new Transaction();
    // create a new SuiClient object pointing to the network you want to use
    const client = new SuiClient({ url: getFullnodeUrl(ENV) });
    let escrowCoin = await client.getDynamicFields({ parentId: escrow_id });
    if (escrowCoin && escrowCoin.data.length > 0) {
        escrowCoin = escrowCoin.data[0]
    }
    console.log('escrowCoin = ', escrowCoin )

    let lockedCoin = await client.getDynamicFields({ parentId: lock_id });
    if (lockedCoin && lockedCoin.data.length > 0) {
        lockedCoin = lockedCoin.data[0]
    }
    console.log('lockedCoin = ', lockedCoin )

    const escrowType = escrowCoin.objectType
    const lockedType = lockedCoin.objectType

    if (!escrowType || !lockedType) {
        throw new Error("Failed to fetch types.");
    }

    const receiveItem = tx.moveCall({
        target,
        arguments: [
            tx.object(escrow_id),
            tx.object(key_id),
            tx.object(lock_id)
        ],
        typeArguments: [escrowType, lockedType]
    })

    tx.transferObjects([receiveItem], tx.pure.address(lock_owner_address));

    const coinToPay = await client.getObject({ id: gas_coin_id });
    // console.log('coinToPay = ', coinToPay)
    tx.setGasPayment([coinToPay.data]);
    tx.setGasBudget(20000000);
    
    // random Keypair
    let keypair = Ed25519Keypair.fromSecretKey(lockOwnerSecretKey);
    const result = await client.signAndExecuteTransaction({ signer: keypair, transaction: tx });
    const digestResult = await client.waitForTransaction({ digest: result.digest });
    console.log('digestResult = ', digestResult)
}

swapEscrow()

// createEscrow()