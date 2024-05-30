module newnft::wyzzheNft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct WyzzheNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct WyzzheNftMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct WyzzheNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct WyzzheNftBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &WyzzheNFT): string::String {
        nft.name
    }

    public fun description(nft: &WyzzheNFT): string::String {
        nft.description
    }

    public fun url(nft: &WyzzheNFT): Url {
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
        let nft = WyzzheNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(WyzzheNftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: WyzzheNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(WyzzheNftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut WyzzheNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: WyzzheNFT,
        _: &mut TxContext
    ) {
        let WyzzheNFT { id, name: _, description: _, url: _} = nft;

        event::emit(WyzzheNftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}
