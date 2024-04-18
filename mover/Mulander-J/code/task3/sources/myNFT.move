module task3::mulander_tintin_nft {
    use std::string;
    use sui::url::{Self, Url};
    use sui::event;

    public struct MULANDER_TINTIN_NFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
        /// URL for the token
        url: Url,
        // TODO: allow custom attributes
    }

    public struct EventNFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The owner of the NFT
        owner: address,
        // The name of the NFT
        name: string::String,
    }

    // ===== Public view functions =====

    /// Get the NFT's `name`
    public fun name(nft: &MULANDER_TINTIN_NFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &MULANDER_TINTIN_NFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &MULANDER_TINTIN_NFT): &Url {
        &nft.url
    }

    // ===== Entrypoints =====

    // Mint a new nft
    public entry fun mint(
        name: vector<u8>, 
        description: vector<u8>, 
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MULANDER_TINTIN_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(EventNFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            owner: recipient,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: MULANDER_TINTIN_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut MULANDER_TINTIN_NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public fun burn(nft: MULANDER_TINTIN_NFT, _: &mut TxContext) {
        let MULANDER_TINTIN_NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}