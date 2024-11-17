
module movenft::gracecampo_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct GRACECAMPO_NFT has store, key {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    public struct GRACECAMPO_NFT_Minted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }
    public fun name(nft: &GRACECAMPO_NFT) : &string::String {
        &nft.name
    }
    public fun description(nft: &GRACECAMPO_NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &GRACECAMPO_NFT): &Url {
        &nft.url
    }

    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = GRACECAMPO_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(GRACECAMPO_NFT_Minted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }
    public entry fun mint_to_public(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let nft = GRACECAMPO_NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url),
        };

        event::emit(GRACECAMPO_NFT_Minted {
            object_id: object::id(&nft),
            creator: recipient,
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }
    public entry fun transfer(
        nft: GRACECAMPO_NFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }
    public entry fun update_description(
        nft: &mut GRACECAMPO_NFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }
    public entry fun burn(nft: GRACECAMPO_NFT, _: &mut TxContext) {
        let GRACECAMPO_NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }

}

