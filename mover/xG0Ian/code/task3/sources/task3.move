/// Module: task3
module task3::task3 {
    use std::string::String;
    use sui::event;

    public struct AxG0Ian has key, store {
        id: UID,
        name: String,
        url: String,
    }

    public struct Minted has copy, drop {
        id: ID,
        owner: address, 
    }

    public fun mint(
        name: String,
        url: String,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);

        event::emit(Minted {
            id: id.to_inner(),
            owner: ctx.sender(),
        });

        let nft = AxG0Ian { id, name, url };

        transfer::public_transfer(nft, ctx.sender());
    }

    entry public fun set_url(nft: &mut AxG0Ian, url: String) {
        nft.url = url;
    }

    entry public fun burn(nft: AxG0Ian) {
        let AxG0Ian {id, name: _, url: _} = nft;
        id.delete();
    }
}
