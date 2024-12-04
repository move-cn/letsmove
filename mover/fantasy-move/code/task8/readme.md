## 我用的ts进行 bcs 与 sha3_256

```ts
import { bcs, fromHEX, toHEX } from '@mysten/bcs';
import { sha3_256 } from '@noble/hashes/sha3';
import { Transaction } from '@mysten/sui/transactions';
import { suiClient, signer } from '../untils/sui-elements';

const Address = bcs.bytes(32).transform({
	// To change the input type, you need to provide a type definition for the input
	input: (val: string) => fromHEX(val),
	output: (val) => toHEX(val),
});


const UID = bcs.fixedArray(32, bcs.u8()).transform({
	input: (id: string) => fromHEX(id),
	output: (id) => toHEX(Uint8Array.from(id)),
});


const sender = '0x0c5aeba79521f673430ddbee3b25cf9615dc74f8fab219a9b78460bcb137e178';
const senderBytes = Address.serialize(sender).toBytes();


const ChallengeStruct = bcs.struct('Challenge', {
    id: UID,
    str: bcs.string(),
    difficulity: bcs.u64(),
    ture_num: bcs.u64(),
});

const challengeBytes = ChallengeStruct.serialize({
    id: '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9',
    str: "4{rryDI0d@Q'#",
    difficulity: 3,
    ture_num: 74,
}).toBytes();


function calculateProof(maxAttempts = 10000000) {
    let attempts = 0;
    while (true) {
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
```





## 合约交互我用的ts
```ts
import { bcs } from '@mysten/sui/bcs';
import { Transaction } from '@mysten/sui/transactions';
import { suiClient, signer } from '../untils/sui-elements';

// const Address = bcs.bytes(32).transform({
// 	// To change the input type, you need to provide a type definition for the input
// 	input: (val: string) => fromHEX(val),
// 	output: (val) => toHEX(val),
// });


// const UID = bcs.fixedArray(32, bcs.u8()).transform({
// 	input: (id: string) => fromHEX(id),
// 	output: (id) => toHEX(Uint8Array.from(id)),
// });


// const sender = '0x0c5aeba79521f673430ddbee3b25cf9615dc74f8fab219a9b78460bcb137e178';
// const senderBytes = Address.serialize(sender).toBytes();


// const ChallengeStruct = bcs.struct('Challenge', {
//     id: UID,
//     str: bcs.string(),
//     difficulity: bcs.u64(),
//     ture_num: bcs.u64(),
// });

// const challengeBytes = ChallengeStruct.serialize({
//     id: '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9',
//     str: "4{rryDI0d@Q'#,
//     difficulity: 3,
//     ture_num: 74,
// }).toBytes();


// function calculateProof(maxAttempts = 10000000) {
//     let attempts = 0;
//     while (attempts < maxAttempts) {
//         attempts++;

//         // Generate random proof
//         const proof = Math.floor(Math.random() * 100000000);
//         console.log(`Attempt ${attempts}: ${proof}`);
//         const proofBytes = bcs.u64().serialize(proof).toBytes();

//         // Combine proof, sender and challenge
//         const combined: Uint8Array = new Uint8Array([...proofBytes, ...senderBytes, ...challengeBytes]);

//         // Calculate SHA3-256 hash
//         const hash: Uint8Array = sha3_256(combined);

//         // Calculate prefix_sum
//         let prefix_sum = 0;
//         for (let i = 0; i < 3; i++) {
//             prefix_sum += hash[i];
//         }

//         // Check if prefix_sum is 0
//         if (prefix_sum === 0) {
//             console.log(`Found proof: ${proof}`);
//             console.log(`[${proofBytes.toString()}]`);
//             return proof;
//         }
//     }

//     console.error('Failed to find proof after', maxAttempts, 'attempts');
//     return null;
// }

// // Calculate proof
// calculateProof();


async function customContractTransaction() {

    /** 输入合约调用相关信息 **/
    const pkgId = '0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f'; // 合约包ID
    const moduleName = 'lets_move'; // 合约模块名
    const funcName = 'get_flag'; // 方法名

    /** 组织交易数据 **/
    const tx = new Transaction();
    // const target = `${pkgId}::${moduleName}::${funcName}`;
    tx.setGasBudget(100000000)

    tx.moveCall({
        target: `${pkgId}::${moduleName}::${funcName}`,

        arguments: [tx.pure(bcs.vector(bcs.U8).serialize([25,138,83,5,0,0,0,0])),
            tx.pure.string('fantasy-move'),
            tx.object('0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9'),
            tx.object('0x8')]
    });

    /** 发起交易 **/
    const result = await suiClient.signAndExecuteTransaction({
        signer,
        transaction: tx,
    });
    return result;
}

customContractTransaction().then(console.log).catch(console.error);



```
