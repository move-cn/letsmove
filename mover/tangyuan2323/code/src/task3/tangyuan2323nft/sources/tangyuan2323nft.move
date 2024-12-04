
/// Module: tangyuan2323nft
module tangyuan2323nft::tangyuan2323nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string::utf8;

    public struct TANGYUAN2323NFT has key, store {
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

    public fun name(nft: &TANGYUAN2323NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &TANGYUAN2323NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &TANGYUAN2323NFT): &Url {
        &nft.url
    }

    public fun mint(
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/70282618?v=4");
        let nft = TANGYUAN2323NFT {
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
        let url = url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/70282618?v=4");
        let nft = TANGYUAN2323NFT {
            id: object::new(ctx),
            name: utf8(b"TANGYUAN2323NFT"),
            description: utf8(b"my first nft"),
            url: url,
        };

        transfer::public_transfer(nft, recipient)
    }

    public fun transfer(
        nft: TANGYUAN2323NFT, recipient: address, _: &mut TxContext
    ) {
        event::emit(NFTTransfered {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient)
    }

    public fun update_description(
        nft: &mut TANGYUAN2323NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public fun burn(nft: TANGYUAN2323NFT, _: &mut TxContext) {
        let TANGYUAN2323NFT { id, name: _, description: _, url: _ } = nft;

        event::emit(NftBurn { object_id: object::uid_to_inner(&id) });

        object::delete(id)
    }
}

