module my_Cheshire::my_Cheshire{
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    public struct SimpleNFT has key, store {
        id: UID,


        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct SimpleNftMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct SimpleNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public struct SimpleNftBurnEvent has copy, drop {
        object_id: ID,
    }

    public fun name(nft: &SimpleNFT): string::String {
        nft.name
    }

    public fun description(nft: &SimpleNFT): string::String {
        nft.description
    }

    public fun url(nft: &SimpleNFT): Url {
        nft.url
    }
    public entry fun mint_nft(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = SimpleNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(SimpleNftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: SimpleNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(SimpleNftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut SimpleNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: SimpleNFT,
        _: &mut TxContext
    ) {
        let SimpleNFT { id, name: _, description: _, url: _} = nft;

        event::emit(SimpleNftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}


