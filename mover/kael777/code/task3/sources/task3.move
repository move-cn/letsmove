
/// Module: task3
module task3::kael777_nft {
    use sui::tx_context::{sender};
    use sui::url;
    use std::string;
    use sui::event;

    public struct Kael777Nft has key, store {
        id: UID,
        creator: address,
        name: string::String,
        description: string::String,
        url: url::Url,
    }

    public struct Kael777NftMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public struct Kael777NftBurnEvent has copy, drop {
        object_id: ID,
    }

    public struct Kael777NftTransferEvent has copy, drop {
        object_id: ID,
        from: address,
        to: address,
    }

    public fun name(nft: &Kael777Nft): &string::String {
        &nft.name
    }

    public fun description(nft: &Kael777Nft): &string::String {
        &nft.description
    }

    public fun url(nft: &Kael777Nft): &url::Url {
        &nft.url
    }

    // modify the description of nft
    public entry fun update_description(
        nft: &mut Kael777Nft,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

     public entry fun mint_to_sender(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        // mint nft
        let nft = Kael777Nft {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            creator: sender(ctx),
            url: url::new_unsafe_from_bytes(url)
        };

        // send mint event
        event::emit(Kael777NftMinted {
            object_id: object::id(&nft),
            creator: sender(ctx),
            name: nft.name,
        });

        // transfer nft to sender
        transfer::public_transfer(nft, sender(ctx));
    }

    public entry fun transfer(
        nft: Kael777Nft, recipient: address, _: &mut TxContext
    ) {
        event::emit(Kael777NftTransferEvent {
            object_id: object::id(&nft),
            from: tx_context::sender(_),
            to: recipient,
        });
        // transfer nft to recipient
        transfer::public_transfer(nft, recipient)
    }

    public entry fun burn(nft: Kael777Nft, _: &mut TxContext) {
        let Kael777Nft { id, name: _, description: _, url: _, creator: _} = nft;
        
        event::emit(Kael777NftBurnEvent {
            object_id: object::uid_to_inner(&id),
        });
        object::delete(id)
    }
}