import { bcs } from "@mysten/sui.js/bcs";
import { getFullnodeUrl, SuiClient } from "@mysten/sui.js/client";
import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { fromB64 } from "@mysten/sui.js/utils";
import { sha3_256 } from "@noble/hashes/sha3";

const client = new SuiClient({
    url: getFullnodeUrl("testnet"),
});

async function main() {
    // flag_str.str = "&bEC{c"
    // bcs.vector(bcs.u8, "&bEC{c")
    const github_id = "wang000919"
    const tx = new TransactionBlock()
    const msg1 = '&bEC{c';
    const bytes1 = new TextEncoder().encode(msg1);
    const bcsFlag   = bcs.ser('vector<u8>', Array.from(bytes1)).toBytes(); 
    const msg2 = github_id;
    const bytes2 = new TextEncoder().encode(msg2);
    let payload = new Uint8Array(bcsFlag.length + bytes2.length)
    payload.set(bcsFlag, 0)
    payload.set(bytes2, bcsFlag.length)
    payload = sha3_256(payload)
    const serialized = bcs.ser("vector<u8>", Array.from(payload)).toBytes();
    console.log("serialized", serialized.slice(1))
    return 
    console.log("构建交易")
    tx.moveCall({
        target: "0x914099b4d1b4f5513acc8aaa4fdc1f67578522b81d818f61bae527d590c6d87d::check_in::get_flag",
        arguments: [
            tx.pure(serialized),
            tx.pure.string(github_id),
            tx.object("0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147"),
            tx.object("0x8"),
        ]
    })
    console.log("执行交易")
    const result = await client.signAndExecuteTransactionBlock({
        transactionBlock: tx,
        signer: Ed25519Keypair.fromSecretKey(fromB64("ALO8ckmhc4dtt2kJz54BRUYeFsOKZZfi9sgLBFvZOi5N").slice(1)),
    })
    console.log(result)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log('error', error)
        process.exit(1);
    });
