/// Module: task_3
module task_3::mynft {

    use std::string::{String, utf8};
    use sui::url::{Url, new_unsafe};
    use sui::event::{emit};

    // onetime witness
    public struct MYNFT has drop {}

    // Mintcap struct
    public struct MintCap<phantom T> has key, store {
        id: UID,
    }

    // nft colleciton struct
    public struct MyNFT_Collection has key, store {
        id: UID,
        name: String,
        description: String,
        url: Url,
    }

    // nft struct
    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        collection: ID,
        url: Url,
    }

    // Event struct
    public struct MintEvent has copy, drop {
        nft_id: ID,
        receiver: address
    }

    // init nft collection
    fun init(
        _otw: MYNFT,
        ctx: &mut TxContext
    ) {
        let my_nft_collection = MyNFT_Collection {
            id: object::new(ctx),
            name: utf8(b"do0x0ob_collection"),
            description: utf8(b"This is a test collection"),
            url: new_unsafe(std::ascii::string(b"https://github.com/do0x0ob")),
        };

        let mint_cap = MintCap<MYNFT> {
            id: object::new(ctx),
        };

        transfer::public_transfer(mint_cap, ctx.sender());
        transfer::share_object(my_nft_collection)

    }

    // mint nft 
    public entry fun mint_nft (
        _: &MintCap<MYNFT>,
        collection: &MyNFT_Collection,
        name: String,
        description: String,
        ctx: &mut TxContext
    ) {
        let nft = MyNFT {
            id: object::new(ctx),
            name,
            description,
            collection: object::uid_to_inner(&collection.id),
            url: new_unsafe(std::ascii::string (
                b"https://avatars.githubusercontent.com/u/153002627?v=4"
                )
            )
        };

        // emit event
        emit(MintEvent {
            nft_id: object::uid_to_inner(&nft.id),
            receiver: ctx.sender()
        });


        // transfer nft to function caller
        transfer::public_transfer(nft, ctx.sender());


    }

    // Destroy the nft
    public entry fun delete_nft (
        nft: MyNFT,
    ) {
        let MyNFT {
            id,
            name: _,
            description: _,
            collection: _,
            url: _
        } = nft;
        object::delete(id);
    }

}

