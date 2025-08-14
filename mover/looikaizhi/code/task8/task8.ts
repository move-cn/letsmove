import {getFullnodeUrl, SuiClient} from '@mysten/sui/client';
import {fromBase64} from '@mysten/bcs';
import { bcs } from '@mysten/sui/bcs';
import {createHash} from 'crypto';

const rpcUrl = getFullnodeUrl('testnet');
const client = new SuiClient({url: rpcUrl});
const challengeID = '0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9';
const address = '0x0234bddfc4deb68aaddd61b79a5857c1b0a29268a3b2e9d162bc13f45be60e1a';
// const githubID = 'looikaizhi';

async function findAnswer(){
    const challenge = await client.getObject({id : challengeID, options:{showBcs:true, showContent: true}});
    console.log(challenge.data);
    const data = challenge.data;
    const content = data?.content;
    console.log(content);

    const addressBytes = bcs.Address.serialize(address).toBytes();
    const challengeBytes1 = fromBase64((data!.bcs as any)['bcsBytes']);
    let nonce = 0;
    do {
        const proofBytes = bcs.U64.serialize(nonce).toBytes();
        const combinedBytes = new Uint8Array(proofBytes.length + addressBytes.length + challengeBytes1.length);
        combinedBytes.set(proofBytes, 0);
        combinedBytes.set(addressBytes, proofBytes.length);
        combinedBytes.set(challengeBytes1, proofBytes.length + addressBytes.length);

        const hash = Array.from(createHash('sha3-256').update(combinedBytes).digest());
        let prefix_sum = 0;
        let i = 0;
        while(i < content?.fields.difficulity){
            prefix_sum = prefix_sum + hash[i];
            i += 1;
        }
        if(prefix_sum == 0){
            console.log(`第${nonce}次成功:`, JSON.stringify(Array.from(proofBytes)));
            console.log("proof: ", "0x" + Buffer.from(proofBytes).toString('hex'))
            break;
        }else{
            nonce++;
            //console.log(`第${nonce}次失败:`, proofBytes);
        }

    }while(true)
}

findAnswer().catch(console.error);
