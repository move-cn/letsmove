/// Module: toma3610_nft
module toma3610_nft::toma3610_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    public struct TOMA3610_NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct MintNFTEvent has copy, drop {
        object_id: ID,
        creator: address,
        recipient: address,
        name: string::String,
    }

    public entry fun mint_and_transfer(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let nft = TOMA3610_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };
        let sender = tx_context::sender(ctx);
        event::emit(MintNFTEvent {
            object_id: object::uid_to_inner(&nft.id),
            creator: sender,
            recipient: recipient,
            name: nft.name,
        });
        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut TOMA3610_NFT,
        new_description: vector<u8>,
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: TOMA3610_NFT) {
        let TOMA3610_NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }

    public fun name(nft: &TOMA3610_NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &TOMA3610_NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &TOMA3610_NFT): &Url {
        &nft.url
    }
}



