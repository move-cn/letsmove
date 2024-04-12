module mynft::mynft {
    use sui::event;
    use sui::transfer;
    use sui::object::{Self, UID, ID};
    use std::string::{Self, String, utf8};
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};

    struct MySelfNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // Events
    struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    /// Get the NFT's `name`
    public fun name(nft: &MySelfNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &MySelfNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &MySelfNFT): &Url {
        &nft.url
    }

    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MySelfNFT {
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
        nft: MySelfNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
}

