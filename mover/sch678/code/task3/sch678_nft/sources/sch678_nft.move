/// Module: sch678_nft
module sch678_nft::sch678_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::event;

    public struct SCH678_NFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
        /// URL for the token
        url: Url,
    }

    public struct NFTMintedEvent has copy, drop {
        // The Object ID of the NFT
        object_id: ID,
        // The creator of the NFT
        creator: address,
        // The name of the NFT
        name: string::String,
    }

    #[allow(lint(self_transfer))]
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = SCH678_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMintedEvent {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: SCH678_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Permanently delete `nft`
    public fun burn(nft: SCH678_NFT, _: &mut TxContext) {
        let SCH678_NFT { id, name: _, description: _, url: _ } = nft;
        id.delete()
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut SCH678_NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Get the NFT's `name`
    public fun name(nft: &SCH678_NFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &SCH678_NFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &SCH678_NFT): &Url {
        &nft.url
    }

}
