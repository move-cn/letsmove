/// Module: mynft
module mynft::mynft {
    use std::string::{Self,String,utf8};
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::object;
    use sui::event;

    struct WoodWhaleNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    // Event 事件
    struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    /// Get the NFT's `name`
    public fun name(nft: &WoodWhaleNFT): &string::String {
        &nft.name
    }

    /// Get the NFT's `description`
    public fun description(nft: &WoodWhaleNFT): &string::String {
        &nft.description
    }

    /// Get the NFT's `url`
    public fun url(nft: &WoodWhaleNFT): &Url {
        &nft.url
    }

    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = WoodWhaleNFT {
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

    /// 转移NFT给新的所有者
    public fun transfer(
        nft: WoodWhaleNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
}

