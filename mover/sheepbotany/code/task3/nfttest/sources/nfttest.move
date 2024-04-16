
/// Module: nfttest
module nfttest::nfttest {
    use sui::event;
    use std::string::{Self};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::object;

    struct NFTtest has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    /// Get the NFT's `name`
    public fun name(nft: &NFTtest): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &NFTtest): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &NFTtest): &Url {
        &nft.url
    }

    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = NFTtest {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };
        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });
        transfer::public_transfer(nft, sender);
    }

    public fun transfer(
        nft: NFTtest, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
}

