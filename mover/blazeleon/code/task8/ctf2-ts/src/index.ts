import { fromBase64 } from '@mysten/bcs';
import { getFullnodeUrl, SuiClient, RawData } from '@mysten/sui/client';
import { fromHex, toHex } from '@mysten/sui/utils';
import * as crypto from 'crypto';
import { sha3_256 } from 'js-sha3';


const suiClient = new SuiClient({ url: getFullnodeUrl('testnet') });

const challengeObjectId = '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9';

// Uint8Array 数组相连
function concatenateUint8Arrays(arrays: Uint8Array[]): Uint8Array {
    let totalLength = 0;
    for (const arr of arrays) {
        totalLength += arr.length;
    }

    const result = new Uint8Array(totalLength);
    let offset = 0;
    for (const arr of arrays) {
        result.set(arr, offset);
        offset += arr.length;
    }

    return result;
}

// 生成随机字符串，Node 自带的 cypto 模块
function generateSecureRandomHexStringNode(byteLength: number): string {
    if (byteLength <= 0) {
        throw new Error("Byte length must be a positive number.");
    }
    const randomBytes: Buffer = crypto.randomBytes(byteLength);

    return toHex(randomBytes);
}

// 获取链上的 Challenge 对象的 BCS 编码
async function getChallengeObjectBCS(suiClient: SuiClient,objectId: string): Promise<Uint8Array> {
    const object = await suiClient.getObject({
        id: objectId,
        options: {
            showBcs: true,
        },
    });
    const bcsData = object.data?.bcs;
    if (bcsData && typeof bcsData === 'object' && 'bcsBytes' in bcsData) {
        return fromBase64(bcsData.bcsBytes);
    }
    throw new Error('BCS data not found in object response');
}


const myAddress = '0xd7f7d8c2516e822c41bad58b365dc41a0a9835a2ab52be4d030ae9f6ca75aedc';

const senderUnit8Array = fromHex(myAddress);
console.log(senderUnit8Array);

// ⚒️ 工作量证明
(async () => {
    const bcsUint8Array = await getChallengeObjectBCS(suiClient, challengeObjectId);
    console.log(bcsUint8Array);

    if (!bcsUint8Array || bcsUint8Array.length === 0) {
        console.error("获取链上 Challenge 对象 BCS 值失败...");
        process.exit(1);
    }

    let maxCount = 16000000;
    let curCount = 0;
    let found = false;

    while (curCount < maxCount) {
        
        curCount++;

        // 生成随机的 32 字节十六进制字符串
        let randomHex = generateSecureRandomHexStringNode(32);
        //  拼接 Uint8Array
        let concatenatedArray = concatenateUint8Arrays([fromHex(randomHex), senderUnit8Array, bcsUint8Array]);
        // 使用 js-sha3 库的 sha3_256 函数计算哈希值
        let flag = sha3_256(concatenatedArray);
        // 将 flag 转换为 Uint8Array
        let flagUint8Array = fromHex(flag);

        if (flagUint8Array[0] + flagUint8Array[1] + flagUint8Array[2] === 0) {
            found = true;
            console.log(`\n在 ${curCount} 次尝试中找到匹配的哈希！`);
            console.log("有效的 flag 哈希值:", flag);
            console.log("目标值 proof:", randomHex);
            break;
        }
        if (curCount % 10000 === 0) {
            console.log(`已尝试 ${curCount} 次...`);
        }
    }
    if (!found) {
        console.log(`\n在 ${maxCount} 次尝试中未能找到匹配的哈希。`);
    }
})();