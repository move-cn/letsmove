module hungyan_nft::hungyan_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    public struct HUNGYAN_NFT has key, store {
        id: UID, 
        name: string::String,
        description: string::String,
        url: Url
    }

    public struct Mint_NftEvent has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }   

    #[allow(lint(self_transfer))]
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = HUNGYAN_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(Mint_NftEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(
        nft: HUNGYAN_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public entry fun update_description(
        nft: &mut HUNGYAN_NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: HUNGYAN_NFT, _: &mut TxContext) {
        let HUNGYAN_NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }


    public fun name(nft: &HUNGYAN_NFT): &string::String {
        &nft.name
    }


    public fun description(nft: &HUNGYAN_NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &HUNGYAN_NFT): &Url {
        &nft.url
    }
}