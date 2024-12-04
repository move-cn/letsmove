module starkright_nft::starkright_nft {
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    public struct STARKRIGHT_NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct STARKRIGHTNFTMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct STARKRIGHTNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct STARKRIGHTNFTBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &STARKRIGHT_NFT): string::String {
        nft.name
    }

    public fun description(nft: &STARKRIGHT_NFT): string::String {
        nft.description
    }

    public fun url(nft: &STARKRIGHT_NFT): Url {
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
        let nft = STARKRIGHT_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(STARKRIGHTNFTMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: STARKRIGHT_NFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(STARKRIGHTNFTTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut STARKRIGHT_NFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: STARKRIGHT_NFT,
        _: &mut TxContext
    ) {
        let STARKRIGHT_NFT { id, name: _, description: _, url: _} = nft;

        event::emit(STARKRIGHTNFTBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}