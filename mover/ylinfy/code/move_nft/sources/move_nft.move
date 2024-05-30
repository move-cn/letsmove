/// Module: move_nft
module move_nft::move_nft {
    use std::string::{Self, String};
    use sui::url::{Self, Url};
    use sui::event;

    // NFT data structure
    public struct MonkeyKing has key, store {
        id: UID,
        name: String,
        desc: String,
        url: Url,
    }

    // Mint Event
    public struct MonkeyKingMinted has copy, drop {
        id: ID,
        minted_by: address,
    }

    // Transfer Event
    public struct MonkeyKingTransferred has copy, drop {
        id: ID,
        to: address,
    }

    entry fun mint_for(recipient: address, ctx: &mut TxContext) {
        let uid = object::new(ctx);
        let id = object::uid_to_inner(&uid);
        let monkey_king = MonkeyKing {
            id: uid,
            name: string::utf8(b"Monkey King"),
            desc: string::utf8(b"Monkey king is a mythological hero"),
            url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/57430085?v=4"),
        };
        
        event::emit(MonkeyKingMinted {
            id,
            minted_by: tx_context::sender(ctx),
        });

        transfer::public_transfer(monkey_king, recipient);
        event::emit(MonkeyKingTransferred {
            id,
            to: recipient,
        });
    }

    public fun name(monkey_king: &MonkeyKing): String {
        monkey_king.name
    }

    public fun desc(monkey_king: &MonkeyKing): String {
        monkey_king.desc
    }

    public fun url(monkey_king: &MonkeyKing): Url {
        monkey_king.url
    }
}
