/// Module: task3
module task3::mynft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    public struct ChengNFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
        /// URL for the token
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
    public fun name(nft: &ChengNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &ChengNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &ChengNFT): &Url {
        &nft.url
    }

    // Create a new devnet_nft
    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = ChengNFT {
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

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: ChengNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut ChengNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public fun burn(nft: ChengNFT, _: &mut TxContext) {
        let ChengNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}

