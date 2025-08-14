/*
/// Module: task3
module task3::sui_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module task3::sui_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct SuiNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // ===== Events ===== 

    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    // ===== Public view functions ===== 

    /// get name
    public fun name(nft: &SuiNFT): &string::String {
        &nft.name
    }

    /// get description
    public fun description(nft: &SuiNFT): &string::String {
        &nft.description
    }

    /// get url
    public fun url(nft: &SuiNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 
    /// mint to sender
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = SuiNFT {
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

    /// transfer to new owner
    public entry fun transfer(
        nft: SuiNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// update description
    public entry fun update_description(
        nft: &mut SuiNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// burn
    public entry fun burn(nft: SuiNFT, _: &mut TxContext) {
        let SuiNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}
