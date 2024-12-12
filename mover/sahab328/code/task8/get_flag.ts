import { getFullnodeUrl, SuiClient } from "@mysten/sui/client";
import { bcs, toHex, fromHex, fromBase64 } from '@mysten/bcs';
import { createHash, getRandomValues } from "crypto";


async function get_flag(sender: string) {
    const obj_id = "0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9";
    const client = new SuiClient({ url: getFullnodeUrl("testnet") });

    const obj = await client.getObject({ 
        id: obj_id, 
        options: {
            showBcs: true,
            showContent: true,
        } 
    });
    const content = obj.data!.content as any;
    const difficulty = content.fields['difficulity'];
    
    const Address = bcs.bytes(32).transform({
        input: (val: string) => fromHex(val),
        output: (val) => toHex(val),
    });
    const sender_bcs_bytes = Address.serialize(sender).toBytes();
    const obj_bcs_bytes = fromBase64((obj.data!.bcs as any)["bcsBytes"])
    const proof_length = difficulty * 2;
    const proof_bytes = new Uint8Array(proof_length);
    while(true) {
        getRandomValues(proof_bytes);
        const buffer = Buffer.concat([proof_bytes, sender_bcs_bytes, obj_bcs_bytes]);
        const hash = createHash('sha3-256').update(buffer).digest();
        let prefix_sum = 0;
        for (let k = 0; k < difficulty; ++k) {
            prefix_sum += hash[k];
        }
        if (prefix_sum == 0) {
            console.log(toHex(proof_bytes));
            break;
        }
    }
}