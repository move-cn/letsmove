/// Module: mynft
module mynft::mynft {
    use std::string::utf8;
    use sui::package;
    use sui::display;

    public struct MYNFT has drop {}

    public struct NFT has key, store {
        id: UID,
        tokenId: u64,
    }

    public struct State has key {
        id: UID,
        count: u64,
    }

    fun init(witness: MYNFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"collection"),
            utf8(b"image_url"),
            utf8(b"description"),
        ];

        let values = vector[
            utf8(b"MyNFT #{tokenID}"),
            utf8(b"MyNFT collection"),
            utf8(b"https://avatars.githubusercontent.com/u/86464159?s=400&u=140a967736ff67d13e882f43ead3dc508c6644e2&v=4"),
            utf8(b"This is MyNFT"),
        ];

        let publisher = package::claim(witness, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values, ctx);
        display::update_version(&mut display);
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());

        transfer::share_object(State{id: object::new(ctx), count: 0});
    }

    entry public fun mint(state: &mut State, ctx: &mut TxContext) {
        state.count = state.count + 1;
        let nft = NFT {
            id: object::new(ctx),
            tokenId: state.count,
        };
        transfer::public_transfer(nft, ctx.sender());
    }
}


