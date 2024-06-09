/// Module: mynft
module mynft::mynft {
    use std::string::{Self,String,utf8};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::object;
    use sui::event;
    
    struct KundingwhaleNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct KundingwhaleNFTMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    struct KundingwhaleNFTTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    struct KundingwhaleNFTBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &KundingwhaleNFT): string::String {
        nft.name
    }

    public fun description(nft: &KundingwhaleNFT): string::String {
        nft.description
    }

    public fun url(nft: &KundingwhaleNFT): Url {
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
        let nft = KundingwhaleNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(KundingwhaleNFTMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: KundingwhaleNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(KundingwhaleNFTTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut KundingwhaleNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: KundingwhaleNFT,
        _: &mut TxContext
    ) {
        let KundingwhaleNFT { id, name: _, description: _, url: _} = nft;

        event::emit(KundingwhaleNFTBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}