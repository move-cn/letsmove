/*
/// Module: move_nft
module move_nft::move_nft;
*/
module move_nft::move_nft {
    use std::string;
    use sui::url::{Self, Url};
    use sui::event;

    public struct MOVENFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }


    /// Get the NFT's `name`
    public fun name(nft: &MOVENFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &MOVENFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &MOVENFT): &Url {
        &nft.url
    }

    // ===== Entrypoints =====

    #[allow(lint(self_transfer))]
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = MOVENFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    #[allow(lint(self_transfer))]
    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = MOVENFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }

    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: MOVENFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut MOVENFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: MOVENFT, _: &mut TxContext) {
        let MOVENFT { id, name: _, description: _, url: _ } = nft;
        id.delete()
    }
}