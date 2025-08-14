module mynft::mynft {
    use sui::event;
    use std::string::{Self, String, utf8};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::object;

    struct MyNFTStruct has key, store {
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
    public fun name(nft: &MyNFTStruct): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &MyNFTStruct): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &MyNFTStruct): &Url {
        &nft.url
    }

    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MyNFTStruct {
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
        nft: MyNFTStruct, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
}

