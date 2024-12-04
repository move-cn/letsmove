module mynft::mynft {
    use std::string;

    use sui::event;
    use sui::object::{Self, ID, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};

    public struct XU8117Nft has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct XU8117NftMintEvent has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct XU8117NftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct XU8117NftBurnEvent has copy, drop {
        object_id: ID,
    }

    public fun name(nft: &XU8117Nft): string::String {
        nft.name
    }

    public fun description(nft: &XU8117Nft): string::String {
        nft.description
    }

    public fun url(nft: &XU8117Nft): Url {
        nft.url
    }

    // Entrypoints
    public entry fun mint_nft(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = XU8117Nft {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(XU8117NftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: XU8117Nft,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(XU8117NftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut XU8117Nft,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: XU8117Nft,
        _: &mut TxContext
    ) {
        let XU8117Nft { id, name: _, description: _, url: _ } = nft;

        event::emit(XU8117NftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}
