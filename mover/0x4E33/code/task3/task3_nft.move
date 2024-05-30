module my_first_package::myNft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string::utf8;

    public struct NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // mint event
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    // transfer event
    public struct NFTTransfered has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    // burn event
    public struct NftBurn has copy, drop {
        object_id: ID,
    }

    public fun name(nft: &NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &NFT): &Url {
        &nft.url
    }

    public fun mint(
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/639160");
        let nft = NFT {
            id: object::new(ctx),
            name: utf8(b"0x4E33"),
            description: utf8(b"my first nft series"),
            url: url,
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public fun mint_to(recipient: address,ctx: &mut TxContext) {
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/639160");
        let nft = NFT {
            id: object::new(ctx),
            name: utf8(b"0x4E33"),
            description: utf8(b"my first nft series"),
            url: url,
        };

        transfer::public_transfer(nft, recipient)
    }

    public fun transfer(
        nft: NFT, recipient: address, _: &mut TxContext
    ) {
        event::emit(NFTTransfered {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient)
    }

    public fun update_description(
        nft: &mut NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public fun burn(nft: NFT, _: &mut TxContext) {
        let NFT { id, name: _, description: _, url: _ } = nft;

        event::emit(NftBurn { object_id: object::uid_to_inner(&id) });

        object::delete(id)
    }
}