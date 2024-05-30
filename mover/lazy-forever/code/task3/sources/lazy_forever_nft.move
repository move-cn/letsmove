module lazy_forever_nft::lazy_forever_nft {
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    public struct LazyforeverNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct LazyforeverNftMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct LazyforeverNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct LazyforeverNftBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &LazyforeverNFT): string::String {
        nft.name
    }

    public fun description(nft: &LazyforeverNFT): string::String {
        nft.description
    }

    public fun url(nft: &LazyforeverNFT): Url {
        nft.url
    }

    // Public entry functions
    public entry fun mint_nft(
        recipient: address,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = LazyforeverNFT {
            id: object::new(ctx),
            name: string::utf8(b"lazy_forever"),
            description: string::utf8(b"lazy_forever's NFT"),
            url: url::new_unsafe_from_bytes(b"https://blog.lazyforever.top/img/favicon.png"),
        };

        event::emit(LazyforeverNftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun transfer_nft(
        nft: LazyforeverNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(LazyforeverNftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut LazyforeverNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: LazyforeverNFT,
        _: &mut TxContext
    ) {
        let LazyforeverNFT { id, name: _, description: _, url: _} = nft;

        event::emit(LazyforeverNftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}