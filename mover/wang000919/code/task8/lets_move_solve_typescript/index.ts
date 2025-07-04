import { fromB64 } from "@mysten/sui.js/utils";

const { TransactionBlock } = require('@mysten/sui.js/transactions');
const { Ed25519Keypair } = require('@mysten/sui.js/keypairs/ed25519');
const { SuiClient, getFullnodeUrl } = require('@mysten/sui.js/client');
const { bcs } = require('@mysten/sui.js/bcs');
const crypto_ = require('crypto');

// 配置
const PACKAGE_ID = '0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f'; // 替换为实际的包ID
const CHALLENGE_OBJECT_ID = '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9'; // 替换为实际的挑战对象ID
const GITHUB_ID = 'wang000919'; // 替换为你的GitHub ID

// 创建客户端和密钥对
const client = new SuiClient({ url: getFullnodeUrl('testnet') });
const keypair = Ed25519Keypair.fromSecretKey(fromB64(process.env.MY_PRIVATE_KEY).slice(1));


// SHA3-256 哈希函数
function sha3_256(data) {
    return crypto_.createHash('sha3-256').update(data).digest();
}
// Challenge对象的BCS序列化结果（链上序列化）
const CHALLENGE_BCS_BYTES = new Uint8Array([
    25, 231, 108, 165, 4, 197, 165, 250, 94, 33, 74, 69,
    252, 166, 192, 88, 23, 27, 163, 51, 246, 218, 137, 123,
    130, 115, 16, 148, 80, 77, 90, 185, 15, 121, 43, 48,
    79, 80, 117, 62, 117, 125, 116, 51, 54, 74, 60, 36,
    3, 0, 0, 0, 0, 0, 0, 0, 146, 0, 0, 0,
    0, 0, 0, 0
]);
// 获取挑战对象的当前状态
async function getChallengeObject(objectId) {
    const response = await client.getObject({
        id: objectId,
        options: {
            showContent: true,
        },
    });
    return response.data;
}

// 将地址转换为字节数组
function addressToBytes(address) {
    // 移除 0x 前缀并转换为字节数组
    const hex = address.startsWith('0x') ? address.slice(2) : address;
    return Buffer.from(hex, 'hex');
}

// 工作量证明求解器
async function solveProofOfWork(senderAddress, challengeObjectId, difficulty = 3) {
    console.log('开始求解工作量证明...');
    console.log(`难度: ${difficulty}`);
    console.log(`发送者地址: ${senderAddress}`);

    // 固定部分：发送者地址 + 挑战对象字节
    const senderBytes = addressToBytes(senderAddress);
    const fixedPart = Buffer.concat([senderBytes, Buffer.from(CHALLENGE_BCS_BYTES)]);
    let nonce = 0;
    let found = false;

    while (!found) {
        // 生成当前 nonce 的字节表示
        const nonceBytes = Buffer.alloc(8);
        nonceBytes.writeBigUInt64BE(BigInt(nonce), 0);

        // 构造完整证明
        const fullProof = Buffer.concat([nonceBytes, fixedPart]);

        // 计算哈希
        const hash = sha3_256(fullProof);

        // 检查前缀和
        let prefixSum = 0;
        for (let i = 0; i < difficulty; i++) {
            prefixSum += hash[i];
        }

        if (prefixSum === 0) {
            console.log(`找到解! Nonce: ${nonce}`);
            console.log(`Proof: ${nonceBytes.toString('hex')}`);
            console.log(`Hash: ${hash.toString('hex')}`);
            return Array.from(nonceBytes);
        }

        nonce++;
        if (nonce % 100000 === 0) {
            console.log(`已尝试 ${nonce} 次...`);
        }
    }
}
// 转换为 ArrayBuffer
function hexToArrayBuffer(hex) {
    const bytes = new Uint8Array(hex.length / 2);
    for (let i = 0; i < hex.length; i += 2) {
        bytes[i / 2] = parseInt(hex.substr(i, 2), 16);
    }
    return bytes.buffer;
}
// 调用 get_flag 函数
async function callGetFlag(proof, githubId, challengeObjectId) {
    const tx = new TransactionBlock();

    // 获取随机对象ID (0x8)
    const randomObjectId = '0x0000000000000000000000000000000000000000000000000000000000000008';

    tx.moveCall({
        target: `${PACKAGE_ID}::lets_move::get_flag`,
        arguments: [
            tx.pure(proof, 'vector<u8>'),
            tx.pure(githubId, 'string'),
            tx.object(challengeObjectId),
            tx.object(randomObjectId),
        ],
    });

    // 执行交易
    const result = await client.signAndExecuteTransactionBlock({
        signer: keypair,
        transactionBlock: tx,
        options: {
            showEvents: true,
            showEffects: true,
        },
    });

    console.log('交易结果:', result);

    // 检查事件
    if (result.events) {
        const flagEvent = result.events.find(event =>
            event.type.includes('Flag')
        );
        if (flagEvent) {
            console.log('Flag 事件:', flagEvent.parsedJson);
        }
    }

    return result;
}

// 主函数
async function main() {
    try {
        const senderAddress = keypair.getPublicKey().toSuiAddress();
        console.log('发送者地址:', senderAddress);

        // 求解工作量证明
        const proof = await solveProofOfWork(senderAddress, CHALLENGE_OBJECT_ID);

        // 调用 get_flag
        // const result = await callGetFlag(proof, GITHUB_ID, CHALLENGE_OBJECT_ID);

        console.log('成功调用 get_flag!');

    } catch (error) {
        console.error('错误:', error);
    }
}

// 如果只生成proof
async function generateProof() {
    const senderAddress = keypair.getPublicKey().toSuiAddress();
    const proof = await solveProofOfWork(senderAddress, CHALLENGE_OBJECT_ID);
    console.log('生成的proof:', proof);
    return proof;
}

// 运行
// main();
generateProof()

// 导出函数供其他脚本使用
module.exports = {
    solveProofOfWork,
    callGetFlag,
    generateProof
};