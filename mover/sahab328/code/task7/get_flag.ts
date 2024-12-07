import { getFullnodeUrl, SuiClient } from "@mysten/sui/client";
import { bcs, toHex } from '@mysten/bcs';
import { createHash } from "crypto";


async function get_flag(github_id: string) {
    const flag_str_id = "0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147";
    const client = new SuiClient({ url: getFullnodeUrl("testnet") });

    const flag_str_obj = await client.getObject({ 
        id: flag_str_id, 
        options: {
            showBcs: true,
            showContent: true,
        } 
    });
    const content = flag_str_obj.data!.content as any;
    const flag_str = content.fields["str"] as string;
    const flag_str_bcs_bytes = bcs.string().serialize(flag_str).toBytes();
    const github_id_bytes = new TextEncoder().encode(github_id);
    const buffer = Buffer.concat([flag_str_bcs_bytes, github_id_bytes]);
    const flag = createHash('sha3-256').update(buffer).digest();
    console.log(toHex(new Uint8Array(flag))); 
}