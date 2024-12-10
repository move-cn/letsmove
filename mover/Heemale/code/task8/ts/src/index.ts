import {sha3_256} from 'js-sha3';
import {bcs, fromHex, toHex} from "@mysten/bcs";
import { Transaction } from "@mysten/sui/transactions";

const mergeUint8Arrays = (...arrays: Uint8Array[]): Uint8Array => {
  // 计算合并后数组的总长度
  const totalLength = arrays.reduce((sum, arr) => sum + arr.length, 0);

  // 创建一个新的 Uint8Array 用来存放合并后的字节数组
  const mergedArray = new Uint8Array(totalLength);

  // 将每个数组依次拷贝到 mergedArray 中
  let offset = 0;
  for (const array of arrays) {
    mergedArray.set(array, offset);
    offset += array.length;
  }

  return mergedArray;
};

const Address = bcs.bytes(32).transform({
  // To change the input type, you need to provide a type definition for the input
  input: (val: string) => fromHex(val),
  output: (val) => toHex(val),
});

const UID = bcs.fixedArray(32, bcs.u8()).transform({
  input: (id: string) => fromHex(id),
  output: (id) => toHex(Uint8Array.from(id)),
});

const Challenge = bcs.struct('Challenge', {
  id: UID,
  str: bcs.string(),
  difficulity: bcs.u64(),
  ture_num: bcs.u64(),
});

const challengeBytes = Challenge.serialize({
  id: '0x34401905bebdf8c04f3cd5f04f442a39372c8dc321c29edfb4f9cb30b23ab96',
  str: "kR}Qd&*h]Ub?.ld}",
  difficulity: 3,
  ture_num: 101,
}).toBytes();

export const main = async () => {
  let proof = 31591919;
  const sender = '';

  let is_success = false;
  while (!is_success) {
    const proofBytes = bcs.string().serialize(proof.toString()).toBytes();
    const senderBytes = Address.serialize(sender).toBytes();
    const fullProof = mergeUint8Arrays(
      proofBytes,
      senderBytes,
      challengeBytes,
    );
    const hash = sha3_256(fullProof);
    const hashBytes = fromHex(hash);

    let prefixSum = 0;
    let i = 0;
    while (i < 3) {
      prefixSum = prefixSum + hashBytes[i];
      i = i + 1;
    }
    if (prefixSum == 0) {
      console.log(`Found proof: ${proof} with hash: ${hash}`);
      is_success = true;
    } else {
      proof++;
    }
  }
};

export const getFlag = () => {
  const tx = new Transaction();
  tx.moveCall({
    typeArguments: [],
    target: '0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f::lets_move::get_flag',
    arguments: [
      tx.pure.vector('u8', [
        8, 51, 49, 53, 57,
        49, 57, 49, 57
      ]),
      tx.pure.string('Heemale'),
      tx.object('0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9'),
      tx.object('0x8'),
    ],
  });
}

main().catch(({message}) => {
  console.error({message});
});