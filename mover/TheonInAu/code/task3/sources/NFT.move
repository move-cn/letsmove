module task3::mynft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An example NFT that can be minted by anybody
    struct MyNFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
        /// Avatar for the token
        avatar: Url,
    }

    // ===== Events =====

    struct NFTMinted has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }

    // ===== Public view functions =====

    /// Get the NFT's `name`
    public fun name(nft: &MyNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &MyNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun avatar(nft: &MyNFT): &Url {
        &nft.avatar
    }

    // ===== Entrypoints =====

    /// Create a new MyNFT
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        avatar: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            avatar: url::new_unsafe_from_bytes(avatar)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: MyNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut MyNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public fun burn(nft: MyNFT, _: &mut TxContext) {
        let MyNFT { id, name: _, description: _, avatar: _ } = nft;
        object::delete(id)
    }
}