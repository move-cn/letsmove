import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { createHash } from 'crypto';
import { bcs } from '@mysten/sui/bcs';

const rpcUrl = getFullnodeUrl('testnet');
const client = new SuiClient({url: rpcUrl});
const flagStringId = '0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147';
const githubID = 'looikaizhi';

async function getFlagStringData() {
    const flagObject = await client.getObject({id: flagStringId, options: {showContent: true}});
    const content = flagObject.data?.content;
    console.log(content);
    return content.fields.str;
}

async function calVector() {
    const flagStr = await getFlagStringData();
    // 使用BCS序列化
    const flagStrBytes = bcs.String.serialize(flagStr).toBytes();
    const githubBytes = Buffer.from(githubID,'utf-8');
    // 字符串字节添加在BCS后面
    const combinedBytes = new Uint8Array(flagStrBytes.length + githubBytes.length);
    combinedBytes.set(flagStrBytes, 0);
    combinedBytes.set(githubBytes, flagStrBytes.length);
    // 测试
    console.log(flagStrBytes);
    console.log(githubBytes);
    console.log(combinedBytes);
    const hash1 = createHash('sha3-256').update(combinedBytes).digest();
    console.log('最终哈希值:', JSON.stringify(Array.from(hash1)));
    console.log("hash: ", "0x" + hash1.toString('hex'));
}

calVector().catch(console.error);