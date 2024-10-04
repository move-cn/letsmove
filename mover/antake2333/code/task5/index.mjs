import { SuiClient,getFullnodeUrl } from "@mysten/sui.js/client";
import {TransactionBlock} from "@mysten/sui.js/transactions";
import { Ed25519Keypair } from "@mysten/sui.js/keypairs/ed25519";
import {SUI_TYPE_ARG } from "@mysten/sui.js/utils";

const keypair = Ed25519Keypair.deriveKeypair("your 助记词",);
const client = new SuiClient({url:getFullnodeUrl('mainnet')});
const USDC_TYPE_ARG = "0x5d4b302506645c37ff133b98c4b50a5ae14841659738d6d733d59d0d217a93bf::coin::COIN";
async function test_task6(){
	let package_id= "0xc6374c7da60746002bfee93014aeb607e023b2d6b25c9e55a152b826dbc8c1ce";
	let module_name="incentive_v2";
	let borrow_function_name="borrow";
	let deposit_function_name="entry_deposit";
	let sui_deposit_amount=1e9;
	let usdc_borrow_amount=0.051417 * 1e6;

	let txb = new TransactionBlock();
	{
		// 存SUI
		txb.moveCall({
			target:`${package_id}::${module_name}::${deposit_function_name}`,
			arguments:[
				txb.object('0x0000000000000000000000000000000000000000000000000000000000000006'),
				txb.object('0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe'),
				txb.object('0x96df0fce3c471489f4debaaa762cf960b3d97820bd1f3f025ff8190730e958c5'),
				txb.pure(0),
				txb.splitCoins(txb.gas, [txb.pure(sui_deposit_amount)]),
				txb.pure(sui_deposit_amount),
				txb.object('0xaaf735bf83ff564e1b219a0d644de894ef5bdc4b2250b126b2a46dd002331821'),
				txb.object('0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c')
			],
			typeArguments:[SUI_TYPE_ARG],
		});
	}
	let usdc_coin;
	{
		// 借出usdc
	   let [ret] = txb.moveCall({
			target:`${package_id}::${module_name}::${borrow_function_name}`,
			arguments:[
				txb.object('0x0000000000000000000000000000000000000000000000000000000000000006'),
				txb.object('0x1568865ed9a0b5ec414220e8f79b3d04c77acc82358f6e5ae4635687392ffbef'),
				txb.object('0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe'),
				txb.object('0xa02a98f9c88db51c6f5efaaf2261c81f34dd56d86073387e0ef1805ca22e39c8'),
				txb.pure(1),
				txb.pure(usdc_borrow_amount),
				txb.object('0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c')
			],
			typeArguments:[USDC_TYPE_ARG],
		});
		const [coin_temp] = txb.moveCall({
			target: `0x2::coin::from_balance`,
			arguments: [txb.object(ret)],
			typeArguments: [USDC_TYPE_ARG]
		});
		usdc_coin = coin_temp;
	}
	{
		// 存usdc
		console.log(usdc_coin);
		txb.moveCall({
			target:`${package_id}::${module_name}::${deposit_function_name}`,
			arguments:[
				txb.object('0x0000000000000000000000000000000000000000000000000000000000000006'),
				txb.object('0xbb4e2f4b6205c2e2a2db47aeb4f830796ec7c005f88537ee775986639bc442fe'),
				txb.object('0xa02a98f9c88db51c6f5efaaf2261c81f34dd56d86073387e0ef1805ca22e39c8'),
				txb.pure(1),
				usdc_coin,
				txb.pure(usdc_borrow_amount),
				txb.object('0xaaf735bf83ff564e1b219a0d644de894ef5bdc4b2250b126b2a46dd002331821'),
				txb.object('0xf87a8acb8b81d14307894d12595541a73f19933f88e1326d5be349c7a6f7559c')
			],
			typeArguments:[USDC_TYPE_ARG],
		});
	}
 	let result = await client.signAndExecuteTransactionBlock(
		{
			transactionBlock:txb,
			signer:keypair
		}
	);
	console.log(result);
}

test_task6().then().catch(console.error);