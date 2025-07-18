import { createHash } from 'crypto';

function hexstrToBytes(s: string): Buffer {
    if (s.startsWith('0x')) {
        s = s.slice(2);
    }
    if (s.length % 2 !== 0) s = '0' + s;
    const bytes = new Uint8Array(s.length / 2);
    for (let i = 0; i < s.length; i += 2) {
        bytes[i / 2] = parseInt(s.slice(i, i + 2), 16);
    }
    return Buffer.from(bytes);
}

// 參數
const sender_bytes = hexstrToBytes('0xb961b905ab4a1d6ea41e21b29bacff75efc09759bf68decb4733a772f32820b3') as Buffer;
const challenge_bcs = hexstrToBytes('0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab90a6d612d6b7a3a3b25596e03000000000000009300000000000000') as Buffer;
const github_id = Buffer.from('jack-751'); // 沒用到

let found = false;
for (let try_val = 100; try_val < 4294967295; try_val++) {
    const proof = Buffer.alloc(4);
    proof.writeUInt32LE(try_val, 0);
    const full_proof = Buffer.concat([proof, sender_bytes, challenge_bcs]);
    const hash_bytes = createHash('sha3-256').update(full_proof).digest();
    let prefix_sum = 0;
    for (let i = 0; i < 3; i++) {
        prefix_sum += hash_bytes[i];
    }
    if (prefix_sum === 0) {
        found = true;
        console.log('FOUND proof int:', try_val);
        console.log('FOUND proof bytes:', proof);
        console.log('FOUND hash:', hash_bytes.toString('hex'));
        console.log('proof (hex):', proof.toString('hex'));
        break;
    }
}
if (!found) {
    console.log('No valid proof found');
}
