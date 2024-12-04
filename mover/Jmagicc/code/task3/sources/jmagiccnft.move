/// Module: jmagiccnft
module jmagiccnft::jmagiccnft {
    use std::debug;
    use std::ascii::string;
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

  
    public struct JmagiccNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
        ex_param: string::String,
    }

    // ===== Events =====
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    // ===== Public view functions =====
    /// Get the NFT's `name`
    public fun name(nft: &JmagiccNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &JmagiccNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &JmagiccNFT): &Url {
        &nft.url
    }

    // ===== Entrypoints ===== 入口函数
    #[allow(unused_variable)]
    public entry fun mint_ntf(ctx: &mut TxContext)
    {
        debug::print(&string(b"mint ntf"));
        let sender = tx_context::sender(ctx);

        let nft = JmagiccNFT {
            id: object::new(ctx),
            name: string::utf8(b"Jmagicc NTF"),
            description: string::utf8(b"This is the description of Jmagicc NTF"),
            url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/58356228"),
            ex_param: string::utf8(b"ex param"),
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);

    }

    /// Create a new devnet_nft
    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        exparam: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = JmagiccNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
            ex_param: string::utf8(exparam),
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public entry fun transfer(
        nft: JmagiccNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    /// Update the `description` of `nft` to `new_description`
    public entry fun update_description(
        nft: &mut JmagiccNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: JmagiccNFT, _: &mut TxContext) {
        let JmagiccNFT { id, name: _, description: _, url: _, ex_param: _ } = nft;
        object::delete(id)
    }

}
