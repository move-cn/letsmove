/// Module: nft
module nft::nft {

    use sui::url::{Self, Url};
    use std::string;
    use std::string::String;
    use sui::event;

    public struct Nft has key, store {
        id: UID,
        name: String,
        description: String,
        creator: address,
        url: Url,
    }

    // ===== Events =====

    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }

    // ===== Public view functions =====
    public fun name(nft: &Nft): &string::String {
        &nft.name
    }

    public fun description(nft: &Nft): &string::String {
        &nft.description
    }

    public fun url(nft: &Nft): &Url {
        &nft.url
    }

    public fun creator(nft: &Nft): &address {
        &nft.creator
    }

    // ===== Entrypoints =====

    #[allow(lint(self_transfer))]
    /// Create a new nft
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = Nft {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            creator: sender,
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// transfer nft to another
    public entry fun transfer(
        nft: Nft, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient);
    }

    public entry fun update_description(
        nft: &mut Nft,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description);
    }

    /// delete NFT
    public entry fun burn(nft: Nft, _: &mut TxContext) {
        let Nft { id, name: _, description: _, creator: _, url: _ } = nft;
        object::delete(id);
    }
}
