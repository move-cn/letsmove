module task3::mynft {
    use std::string::{Self,String,utf8};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::object;
    use sui::event;

    //nft
    public struct MYNFT has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    //event
    public struct MYNFTMintedEvent has copy,drop {
        object_id: ID,
        creator: address,
        name: String
    }

    // name
    public fun name(nft: &MYNFT): &String {
        &nft.name
    }

    // description
    public fun description(nft: &MYNFT): &String {
        &nft.description
    }

    // url
    public fun url(nft: &MYNFT): &Url {
        &nft.url
    }

    //mint
    public entry fun mint(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = MYNFT {
            id: object::new(ctx),
            name: utf8(name),
            description :utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };
        // emit event
        event::emit(MYNFTMintedEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });
        // transfer
        transfer::public_transfer(nft, sender);

    }

    public entry fun transfer(nft: MYNFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(nft: &mut MYNFT,  new_description: vector<u8>,_: &mut TxContext) {
        nft.description = utf8(new_description);
    }

    public entry fun burn(nft: MYNFT, _: &mut TxContext) {
        let MYNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id);
    }
}