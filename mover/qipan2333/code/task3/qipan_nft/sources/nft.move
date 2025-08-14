module qipan2333::nft {

    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    
    struct QipanNFT has key, store {
        id: UID,
        name: string::String,
        url: Url,
    }

    struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public entry fun mint_to_sender(
        name: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        let nft = QipanNFT {
            id: object::new(ctx),
            name: string::utf8(name),
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
        nft: QipanNFT, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public entry fun burn(nft: QipanNFT, _: &mut TxContext) {
        let QipanNFT { id, name: _, url: _ } = nft;
        object::delete(id)
    }

    public fun name(nft: &QipanNFT): &string::String {
        &nft.name
    }

    public fun url(nft: &QipanNFT): &Url {
        &nft.url
    }
}