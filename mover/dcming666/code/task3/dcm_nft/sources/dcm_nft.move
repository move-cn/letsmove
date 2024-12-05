module dcm_nft::dcm_nft;
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    public struct DcmNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct DcmNFTMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct DcmNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct DcmNFTBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &DcmNFT): string::String {
        nft.name
    }

    public fun description(nft: &DcmNFT): string::String {
        nft.description
    }

    public fun url(nft: &DcmNFT): Url {
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
        let nft = DcmNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(DcmNFTMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: DcmNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(DcmNFTTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut DcmNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: DcmNFT,
        _: &mut TxContext
    ) {
        let DcmNFT { id, name: _, description: _, url: _} = nft;

        event::emit(DcmNFTBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }