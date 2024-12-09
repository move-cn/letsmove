import { bcs, fromHex, toHex } from '@mysten/bcs';
import { sha3_256 } from '@noble/hashes/sha3';

// Address type for 32-byte addresses
const Address = bcs.bytes(32).transform({
	input: (val: string) => fromHex(val),
	output: (val) => toHex(val),
});

// UID type for 32-byte unique identifiers
const UID = bcs.fixedArray(32, bcs.u8()).transform({
	input: (id: string) => fromHex(id),
	output: (id) => toHex(Uint8Array.from(id)),
});

// Test sender address
const sender = '0x77083d27beec05358aff1356c1826fc582ae381440c028646b817705aabca3a8';
const senderBytes = Address.serialize(sender).toBytes();

// Challenge struct definition
const ChallengeStruct = bcs.struct('Challenge', {
    id: UID,
    str: bcs.string(),
    difficulity: bcs.u64(),
    ture_num: bcs.u64(),
});

// Test challenge data
const challengeBytes = ChallengeStruct.serialize({
    id: '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9',
    str: "]c:_}|)[iB'G*$p1E\"$",
    difficulity: 3,
    ture_num: 100,
}).toBytes();

/**
 * Calculates proof of work by finding a number that results in a hash with specific properties
 * @param maxAttempts Maximum number of attempts before giving up
 * @returns The proof number if found, null otherwise
 */
function calculateProof(maxAttempts = 10000000): number | null {
    const targetPrefixSum = 0;
    const prefixLength = 3;

    for (let attempts = 1; attempts <= maxAttempts; attempts++) {
        // Generate random proof between 0 and 100M
        const proof = Math.floor(Math.random() * 100000000);

        if (attempts % 1000 === 0) {
            console.log(`Attempt ${attempts}: ${proof}`);
        }

        const proofBytes = bcs.u64().serialize(proof).toBytes();

        // Combine all components for hashing
        const combined = new Uint8Array([...proofBytes, ...senderBytes, ...challengeBytes]);
        const hash = sha3_256(combined);

        // Calculate prefix sum of first N bytes
        const prefix_sum = hash
            .slice(0, prefixLength)
            .reduce((sum, byte) => sum + byte, 0);

        if (prefix_sum === targetPrefixSum) {
            console.log(`Success! Found proof after ${attempts} attempts: ${proof}`);
            console.log(`Proof bytes: [${proofBytes.toString()}]`);
            return proof;
        }
    }

    console.error(`Failed to find proof after ${maxAttempts} attempts`);
    return null;
}

// Execute proof calculation
calculateProof();

// Success! Found proof after 7158758 attempts: 5860720
// Proof bytes: [112,109,89,0,0,0,0,0]