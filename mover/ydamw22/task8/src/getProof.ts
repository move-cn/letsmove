import { sha3_256 } from 'js-sha3';
import { SuiClient, getFullnodeUrl } from '@mysten/sui/client';
import { bcs, fromHex, toHex } from '@mysten/bcs';

const crypto = window.crypto;
const suiClient = new SuiClient({ url: getFullnodeUrl('testnet') });
const objectId = "0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9";
const objectData = await suiClient.getObject({
  id: objectId,
  options: { showContent: true },
});
// 获取testnet上实时challenge对象的数据
const challengeObjectFields = objectData.data?.content?.fields;

// 定义UID
const UID = bcs.fixedArray(32, bcs.u8()).transform({
	input: (id: string) => fromHex(id),
	output: (id) => toHex(Uint8Array.from(id)),
});
// 定义challenge结构
const Challenge = bcs.struct('Challenge', {
	id: UID,
  str: bcs.string(),
  difficulity: bcs.u64(),
  ture_num: bcs.u64(),
});
// 用拿到的链上数据进行bcs序列化
const challengeBytes = Challenge.serialize({
	id: challengeObjectFields.id.id,
  str: challengeObjectFields.str,
  difficulity: challengeObjectFields.difficulity,
  ture_num: challengeObjectFields.ture_num,
}).toBytes();

// 地址转化成bytes
const Address = bcs.bytes(32).transform({
  // To change the input type, you need to provide a type definition for the input
  input: (val: string) => fromHex(val),
  output: (val) => toHex(val),
});
const sender = '0xaf795c762d38591318bf7c471552ce9034be41552eb3607c382776b3b9e68859';
const senderBytes = Address.serialize(sender).toBytes();

// 查找有效proof
export async function findValidProof() {
  // 计数器（5k倍）
  let count = 0;
  for (let i = 0; i < 5000; i++) {
    // 生成8字节数组
    const proofBytes = new Uint8Array(8);
    // 填充随机字节
    crypto.getRandomValues(proofBytes);

    // 拼接完整数据
    const fullProof = full_proof_concatUint8Arrays([
      proofBytes,
      senderBytes,
      challengeBytes
    ]);

    // 计算哈希
    const hash = new Uint8Array(sha3_256.arrayBuffer(fullProof));

    // 验证前3字节和
    const sum = hash.slice(0, 3).reduce((a, b) => a + b, 0);
    if (sum === 0) {
      console.log(`Found valid proof after ${count} attempts`);
      return proofBytes;
    }
    count += 5;
  }
}

// 获取full_proof,拼接Uint8Array
function full_proof_concatUint8Arrays (arrays: Uint8Array[]) {
  let totalLength = arrays.reduce((acc, arr) => acc + arr.length, 0);
  let result = new Uint8Array(totalLength);
  let offset = 0;
  for ( let arr of arrays ) {
    result.set(arr, offset);
    offset += arr.length;
  }
  return result;
}