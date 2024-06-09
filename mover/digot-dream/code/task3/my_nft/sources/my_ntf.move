
/// Module: my_nft
module my_ntf::my_nft {

    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct My_nft has key, store {
        id: sui::object::UID,
        url: Url,
        name: vector<u8>,
        description: vector<u8>,
    }

    public entry fun mint(
        ctx: &mut TxContext,
    )
    {
        let id = object::new(ctx);
        let sender = @0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2;
        let nft = My_nft {
            id,
            url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/92988539?s=400&v=4"),
            name: b"digot-dream-ntf",
            description: b"used for letmove task",
        };
        //event::emit(nft);
        transfer::public_transfer(nft, sender);
    }

    public fun burn(nft: My_nft,ctx: &mut TxContext)
    {
        let My_nft { id, url, name, description } = nft;
        object::delete(id)
    }






}

