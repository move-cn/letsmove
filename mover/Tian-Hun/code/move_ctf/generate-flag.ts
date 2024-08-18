import { bcs } from '@mysten/bcs';
import { sha3_256 } from '@noble/hashes/sha3';

function calculateFlag(flagStr: string, githubId: string): string {
    // Serialize flagStr
    const serializedFlagStr = bcs.string().serialize(flagStr);

    // Convert SerializedBcs to Uint8Array
    const flagStrBytes = serializedFlagStr.toBytes();

    // Combine serialized flagStr with githubId bytes
    const combined: Uint8Array = new Uint8Array([...flagStrBytes, ...Buffer.from(githubId, 'utf8')]);

    // Calculate SHA3-256 hash
    const hash: Uint8Array = sha3_256(combined);

    // Convert hash as an array of numbers (vector<u8>)
    const hashArray = Array.from(hash);
    console.log(`vector<u8>: [${hashArray.toString()}]`);

    // Convert hash to hexadecimal string
    return '0x' + Buffer.from(hash).toString('hex');
}

export { calculateFlag };