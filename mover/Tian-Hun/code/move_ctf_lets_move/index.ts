import { bcs, fromHEX, toHEX } from '@mysten/bcs';
import { sha3_256 } from '@noble/hashes/sha3';

const Address = bcs.bytes(32).transform({
	// To change the input type, you need to provide a type definition for the input
	input: (val: string) => fromHEX(val),
	output: (val) => toHEX(val),
});

// define UID as a 32-byte array, then add a transform to/from hex strings
const UID = bcs.fixedArray(32, bcs.u8()).transform({
	input: (id: string) => fromHEX(id),
	output: (id) => toHEX(Uint8Array.from(id)),
});

// Convert sender to bytes
const sender = '0xfdfad1a18a116af300270a2ac936c6695c37209fcc74a771042637611bf51631';
const senderBytes = Address.serialize(sender).toBytes();

// Convert challenge to bytes
const ChallengeStruct = bcs.struct('Challenge', {
    id: UID,
    str: bcs.string(),
    difficulity: bcs.u64(),
    ture_num: bcs.u64(),
});
const challengeBytes = ChallengeStruct.serialize({
    id: '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9',
    str: '_r}5ik7pM,q]^KE%47D~K;|i*xwJbU',
    difficulity: 3,
    ture_num: 70,
}).toBytes();

// 已知以上变量的值，根据如下 move 代码计算 proof 的值
/*
    let mut full_proof: vector<u8> = vector::empty<u8>();
    vector::append<u8>(&mut full_proof, proof);
    vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
    vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));

    let hash: vector<u8> = hash::sha3_256(full_proof);

    let mut prefix_sum: u32 = 0;
    let mut i: u64 = 0;
    while (i < challenge.difficulity) {
        prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
        i = i + 1;
    };

    assert!(prefix_sum == 0, EPROOF);
*/

function calculateProof(maxAttempts = 10000000) {
    let attempts = 0;
    while (attempts < maxAttempts) {
        attempts++;

        // Generate random proof
        const proof = Math.floor(Math.random() * 100000000);
        console.log(`Attempt ${attempts}: ${proof}`);
        const proofBytes = bcs.u64().serialize(proof).toBytes();

        // Combine proof, sender and challenge
        const combined: Uint8Array = new Uint8Array([...proofBytes, ...senderBytes, ...challengeBytes]);
    
        // Calculate SHA3-256 hash
        const hash: Uint8Array = sha3_256(combined);
    
        // Calculate prefix_sum
        let prefix_sum = 0;
        for (let i = 0; i < 3; i++) {
            prefix_sum += hash[i];
        }

        // Check if prefix_sum is 0
        if (prefix_sum === 0) {
            console.log(`Found proof: ${proof}`);
            console.log(`[${proofBytes.toString()}]`);
            return proof;
        }
    }

    console.error('Failed to find proof after', maxAttempts, 'attempts');
    return null;
}

// Calculate proof
calculateProof();

// Output:
/*
    Attempt 17863607: 32803021
    Found proof: 32803021
    [205,136,244,1,0,0,0,0]
*/

