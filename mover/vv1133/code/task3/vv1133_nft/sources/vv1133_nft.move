/// Module: vv1133_nft
module vv1133_nft::vv1133_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// An example NFT that can be minted by anybody
    public struct VV1133_NFT has key, store {
        id: UID,
        /// Name for the token
        name: string::String,
        /// Description of the token
        description: string::String,
        /// URL for the token
        url: Url,
        // TODO: allow custom attributes
    }

    /// Get the NFT's `name`
    public fun name(nft: &VV1133_NFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &VV1133_NFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &VV1133_NFT): &Url {
        &nft.url
    }

    /// Create a new nft
    public fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = VV1133_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: VV1133_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public fun update_description(
        nft: &mut VV1133_NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public fun burn(nft: VV1133_NFT, _: &mut TxContext) {
        let VV1133_NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}
