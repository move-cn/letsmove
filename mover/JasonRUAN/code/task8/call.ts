import { bcs, fromBase64 } from "@mysten/bcs";
import { getFullnodeUrl, SuiClient } from "@mysten/sui/dist/cjs/client";
import { Transaction } from "@mysten/sui/transactions";
import { execSync } from "child_process";
import { readFileSync } from "fs";
import { homedir } from "os";
import path from "path";
import { Ed25519Keypair } from "@mysten/sui/keypairs/ed25519";

export const getAddressByAlias = (alias: string): string => {
  const str = execSync(`sui client  switch --address ${alias}`, {
    encoding: "utf8",
  }).trim();

  const regex = /Active address switched to (\S+)/;
  const match = str.match(regex);

  return match ? match[1] : "";
};

export const getSigner = (alias: string) => {
  const sender = getAddressByAlias(alias);

  const keystore = JSON.parse(
    readFileSync(
      path.join(homedir(), ".sui", "sui_config", "sui.keystore"),
      "utf8"
    )
  );

  for (const priv of keystore) {
    const raw = fromBase64(priv);
    if (raw[0] !== 0) {
      continue;
    }

    const pair = Ed25519Keypair.fromSecretKey(raw.slice(1));
    if (pair.getPublicKey().toSuiAddress() === sender) {
      return pair;
    }
  }

  throw new Error(`keypair not found for sender: ${sender}`);
};

async function call() {
  const rpcUrl = getFullnodeUrl("testnet");
  const client = new SuiClient({ url: rpcUrl });

  const pkgId =
    "0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f";
  const moduleName = "lets_move";
  const funcName = "get_flag";

  const tx = new Transaction();

  tx.moveCall({
    target: `${pkgId}::${moduleName}::${funcName}`,

    arguments: [
      tx.pure(bcs.vector(bcs.u8()).serialize([112, 109, 89, 0, 0, 0, 0, 0])),
      tx.pure.string("JasonRUAN"),
      tx.object(
        "0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9"
      ),
      tx.object("0x8"),
    ],
  });

  const signer = getSigner("JasonRUAN");
  const result = await client.signAndExecuteTransaction({
    signer,
    transaction: tx,
  });
  return result;
}

call().then(console.log).catch(console.error);