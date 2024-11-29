/// Module: task3
module task3::task3 {
    use sui::url::{Self, Url};
    use std::string::{Self, String};
    use sui::event;

    //event
    public struct Miai has key, store { id: UID, name: String, description: String, url: Url}
    public struct Burned has copy, drop { object_id: ID, destroyer: address, name: String}
    public struct Minted has copy, drop { object_id: ID, creator: address, name: String}

    public fun get_name(nft: &Miai): &String {
        &nft.name
    }

    public fun get_description(nft: &Miai): &String {
        &nft.description
    }

    public fun get_url(nft: &Miai): &Url {
        &nft.url
    }

    //mint
    public fun mint(name: vector<u8>, descriptrion: vector<u8>, url: vector<u8>,ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = Miai {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(descriptrion),
            url: url::new_unsafe_from_bytes(url)
        };
        event::emit(Minted {
            object_id: object::id(&nft),
            creator: sender,
            name: nft.name
        });
        transfer::public_transfer(nft, sender);
    }

    //burn
    public fun burn(nft: Miai, ctx: &mut TxContext) {
        let Miai {id, name, description: _, url: _} = nft;event::emit(
            Burned {
                object_id: object::uid_to_inner(&id),
                destroyer: tx_context::sender(ctx),
                name:name,
            }
        );
        object::delete(id);
    }

    //transfer
    public fun transfer(nft: Miai, recipient: address) {
        transfer::public_transfer(nft, recipient);
    }

    public fun update_description(nft: &mut Miai, new_description: vector<u8>) {
        nft.description = string::utf8(new_description);
    }
}
