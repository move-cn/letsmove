/// Module: whdevlab_nft
module whdevlab_nft::whdevlab_nft {

	use sui::url::{Url, Self};
	use std::string;
	use sui::object::{Self, ID, UID};
	use sui::event;
	use sui::transfer;
	use sui::tx_context::{TxContext, Self};

	public struct WHDEVLAB_NFT has key, store {
		id: UID,
		name:string::String,
		description:string::String,
		url:Url,
	}

	public struct WHDEVLAB_NFT_EVENT has copy, drop {
		object_id: ID,
		creator:address,
		name: string::String,
	}

	public struct WHDEVLAB_NFT_TRANSFER_EVENT has copy, drop {
		object_id: ID,
		from: address, 
		to:address,
	}

	public struct WHDEVLAB_NFT_BURN_EVENT has copy, drop {
		object_id: ID,
	}

	public fun name(nft: &WHDEVLAB_NFT):string::String {
		nft.name
	}

	public fun url(nft: &WHDEVLAB_NFT):Url {
		nft.url
	}

	public fun description(nft: &WHDEVLAB_NFT):string::String {
		nft.description
	}

	public entry fun mint_nft(name:vector<u8>, description:vector<u8>, url:vector<u8>, ctx: &mut TxContext) {
		let sender = tx_context::sender(ctx);
		let nft = WHDEVLAB_NFT{
			id: object::new(ctx),
			name: string::utf8(name),
			description: string::utf8(description),
			url: url::new_unsafe_from_bytes(url),
		};

		event::emit(WHDEVLAB_NFT_EVENT {
			object_id: object::id(&nft),
			creator:sender,
			name: nft.name
		});

		transfer::public_transfer(nft, sender);
	}

	public entry fun transfer_nft(
		nft: WHDEVLAB_NFT, 
		recipient:address, 
		_: &mut TxContext) {
		event::emit(WHDEVLAB_NFT_TRANSFER_EVENT { 
			object_id: object::id(&nft),
			from:tx_context::sender(_),
			to: recipient,
		 });

		 transfer::public_transfer(nft, recipient);
	}

	public entry fun update_description(nft:&mut WHDEVLAB_NFT, description:vector<u8>, _: &mut TxContext) {
		nft.description = string::utf8(description);
	}


	public entry fun burn(nft: WHDEVLAB_NFT, _:&mut TxContext) {
		let WHDEVLAB_NFT {id, name:_, description:_, url:_} = nft;

		event::emit(WHDEVLAB_NFT_BURN_EVENT { 
			object_id:object::uid_to_inner(&id),
		});

		object::delete(id);
	}

}
