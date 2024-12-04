/// Module: task3
module task3::task3 {
    // ----- use -----
    use sui::url::{Self};
    use std::string;
    use sui::event;

    // ----- const -----

    // ----- err -----

    // ----- struct -----
    public struct Task3NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: url::Url,
    }

    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String
    }

    // ----- fun -----
    public entry fun mint_to_sender(name: vector<u8>, description: vector<u8>, url: vector<u8>, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = Task3NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            name: nft.name,
            creator: sender
        });

        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer (nft: Task3NFT, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient);
    }

    public entry fun burn(nft: Task3NFT, _: &mut TxContext) {
        let Task3NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id);
    }
}