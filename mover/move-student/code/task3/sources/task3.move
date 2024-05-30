module task3::movestuduentnft {
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self};
    use sui::event;
 

    struct MoveStudentNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: url::Url,
    }

    struct NFTMint has copy, drop {
        object_id: ID,
        creater: address,
        name: string::String,
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = MoveStudentNFT{id: object::new(ctx), name: string::utf8(name), description: string::utf8(description), url: url::new_unsafe_from_bytes(url)};
        event::emit(NFTMint{object_id: object::id(&nft), creater:sender, name:nft.name});
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(nft: MoveStudentNFT, recipient:address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }
}