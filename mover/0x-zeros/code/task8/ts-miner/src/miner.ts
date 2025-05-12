
import { bcs } from '@mysten/sui/bcs';
import {fromHex, toHex} from '@mysten/bcs';
import { SuiClient } from '@mysten/sui/client';
import * as crypto from 'crypto';

//https://sdk.mystenlabs.com/typescript/bcs


const DEV_NET_URL = 'https://fullnode.testnet.sui.io:443';

// 配置参数
const CHALLENGE_ID = '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9';
// const CHALLENGE_STR = '\+E"YK|"T9]Oc"OkyDFbJ6(8$WD}';
// const CHALLENGE_DIFFICULTY = 3;
// const CHALLENGE_TRUE_NUM = 133;
const SENDER_ADDRESS = '0x6e6c6885e780bbfd7c81b6b3849b45881305e3ecd08340a32fef3b5f3a619be7';



export async function mineProof(max_attempts: number): Promise<Uint8Array | null> {

    console.log('开始挖矿...');
    const {bcs, difficulity} = await getChallenge();

    for (let nonce = 0; nonce < max_attempts; nonce++) {
        const proof = nonceToProof(nonce);
        
        if (nonce % 10000 === 0) {
            console.log(`尝试nonce: ${nonce}`);
            console.log(`proof: ${Buffer.from(proof).toString('hex')}`);
        }
        
        if (checkProof(proof, {bcs, difficulity})) {
            console.log(`找到有效证明，nonce: ${nonce}`);
            console.log(`证明 proof: ${Buffer.from(proof).toString('hex')}`);
            return proof;
        }
    }
    
    console.log(`未找到有效证明，已达到最大尝试次数: ${max_attempts}`);
    return null;
}


function sha3_256_hash(data: Uint8Array): Uint8Array {
    return crypto.createHash('sha3-256').update(Buffer.from(data)).digest();
  }

// 检查证明是否有效
function checkProof(proof: Uint8Array, {bcs, difficulity}: {bcs: Uint8Array, difficulity: number}): boolean {

    // 构建完整证明
    const challengeBytes = bcs;
    
    // 合并proof, sender address和challenge bytes
    const fullProof = new Uint8Array([
        ...proof,
        ...fromHex(SENDER_ADDRESS), //.replace('0x', '')
        ...challengeBytes
    ]);
    // console.log(`SENDER_ADDRESS: ${fromHex(SENDER_ADDRESS)}`);
    // console.log(`fullProof: ${Buffer.from(fullProof).toString('hex')}`);
    // console.log(`fullProof: ${Buffer.from(fullProof).toString('base64')}`);
    
    // 计算SHA3-256哈希
    const hashBytes = sha3_256_hash(fullProof);
    
    // 计算前缀和
    let prefixSum = 0;
    for (let i = 0; i < difficulity; i++) {
        prefixSum += hashBytes[i];
    }
    
    return prefixSum === 0;
}

// 将nonce转换为证明
function nonceToProof(nonce: number): Uint8Array {
    const proof = new Uint8Array(8);
    let tempNonce = nonce;
    
    for (let i = 0; i < 8; i++) {
        proof[i] = tempNonce & 0xFF;
        tempNonce = tempNonce >> 8;
    }
    
    return proof;
}

async function getChallengeOnChain() {
    const client = new SuiClient({ url: DEV_NET_URL });
    
    const {data, error} = await client.getObject({
        id: CHALLENGE_ID,
        options: {
            showBcs: true,
            showContent: true,
        }
    });

    // @ts-ignore
    const bsc = data?.bcs?.bcsBytes; //string

    // @ts-ignore
    const fields = data?.content?.fields;


    console.log('challenge bcs: ', bsc);
    console.log('challenge fields: ', fields);

    return {bsc, fields};
}


//    public struct Challenge has key {
//     id: UID,
//     str: String,
//     difficulity: u64,
//     ture_num: u64
// }
// define ID as a 32-byte array, then add a transform to/from hex strings
const ID = bcs.fixedArray(32, bcs.u8()).transform({
	input: (id: string) => {
        // console.log('input [id]: ', id);
        return fromHex(id);
    },
	output: (id) => {
        // console.log('output [id]: ', id);
        return toHex(Uint8Array.from(id));
    },
});

const Challenge = bcs.struct('Challenge', {
    id: bcs.struct('UID', {
        id: ID,
    }),
	str: bcs.string(),
	difficulity: bcs.u64(),
	ture_num: bcs.u64(),
});


async function getChallenge(): Promise<{bcs: Uint8Array, difficulity: number}> {

    const {bsc, fields} = await getChallengeOnChain();

    const serializedBcs = Challenge.serialize(fields);
    // console.log('serializedBcs: ', serializedBcs);
    const bcsBytes = serializedBcs.toBytes();
    const bcsBytesString = serializedBcs.toBase64();

    console.log('serialized bcsBytes: ', bcsBytesString);

    //check bsc is equal to bcsBytesString
    if (bsc !== bcsBytesString) {
        throw new Error('fetched bsc is not equal to serialized bcsBytes');
    }
    
    return {bcs: bcsBytes, difficulity: fields.difficulity};
}
