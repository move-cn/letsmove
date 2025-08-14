module w626w::devnet_nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct DevNetNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }


    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public fun name(nft: &DevNetNFT): &string::String {
        &nft.name
    }

    public fun description(nft: &DevNetNFT): &string::String {
        &nft.description
    }

    public fun url(nft: &DevNetNFT): &Url {
        &nft.url
    }


    public entry fun mint_to_sender(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = DevNetNFT {
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

    public entry fun transfer(
        nft: DevNetNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public entry fun update_description(
        nft: &mut DevNetNFT,
        new_description: vector<u8>,
        _: &mut TxContext
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: DevNetNFT, _: &mut TxContext) {
        let DevNetNFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }
}

//0x581d4d7726bd1878cbd617e2bcf205923ede197d09a158809767c567ce128194
//0x5f4c447290d7a2db15ee3f4ec70f38eb228da19394e7d60595265590a9513a73
//sui client call --function transfer --module devnet_nft --package 0x581d4d7726bd1878cbd617e2bcf205923ede197d09a158809767c567ce128194 --args 0x5f4c447290d7a2db15ee3f4ec70f38eb228da19394e7d60595265590a9513a73 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
//sui client call --function mint_to_sender --module devnet_nft --package 0x581d4d7726bd1878cbd617e2bcf205923ede197d09a158809767c567ce128194 --args w626w nft https://avatars.githubusercontent.com/u/118292614?s=400&v=4
