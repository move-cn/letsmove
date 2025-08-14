import { SHA3 } from "sha3";
import { bcs } from "@mysten/sui/bcs";

let address =
	"0x781979aa4c2ebc2d88be8c3f50dc2da7a69d9e9191f4ce3fd9bd7cf192203d6a";
const objectId =
	"0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9";
const address_bcs = bcs.Address.serialize(address);
const objectId_bcs = bcs.Address.serialize(objectId);
const str_bcs = bcs.String.serialize("*;?cGSW_D");
const difficulity_bcs = bcs.U64.serialize(3);
const ture_num_bcs = bcs.U64.serialize(76);
const address_bcs_hex = address_bcs.toHex();
const objectId_bcs_hex = objectId_bcs.toHex();
const str_bcs_hex = str_bcs.toHex();
const difficulity_bcs_hex = difficulity_bcs.toHex();
const ture_num_bcs_hex = ture_num_bcs.toHex();

for (let i = 0; i < 16 * 16 * 16 * 16 * 16 * 16 * 16 * 16 * 16; i++) {
	const proof = i.toString(16);
	const input = `${proof}${address_bcs_hex}${objectId_bcs_hex}${str_bcs_hex}${difficulity_bcs_hex}${ture_num_bcs_hex}`;
	const hash = new SHA3(256);
	hash.update(input, "hex");
	const result = hash.digest("hex");

	console.log(i);
	console.log(result)

	if (result.slice(0, 6) === "000000") {
		console.log(proof, result, input);
		break;
	}
}
