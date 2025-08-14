module nft_example::my_nft {
    use sui::url::{Url, Self};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{TxContext, Self};

    struct MyNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct MyNftMintEvent has copy, drop  {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    struct MyNftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    struct MyNftBurnEvent has copy, drop {
        object_id: ID,
    }

    // Public view function
    public fun name(nft: &MyNFT): string::String {
        nft.name
    }

    public fun description(nft: &MyNFT): string::String {
        nft.description
    }

    public fun url(nft: &MyNFT): Url {
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
        let nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(MyNftMintEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer_nft(
        nft: MyNFT,
        recipient: address,
        _: &mut TxContext
    ) {
        event::emit(MyNftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });

        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut MyNFT,
        description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(description);
    }

    public entry fun burn(
        nft: MyNFT,
        _: &mut TxContext
    ) {
        let MyNFT { id, name: _, description: _, url: _} = nft;

        event::emit(MyNftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });

        object::delete(id);
    }
}
