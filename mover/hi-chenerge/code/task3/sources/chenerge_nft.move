module task3::chenerge_nft {
    use std::string::utf8;
    use sui::display;
    use sui::object;
    use sui::object::UID;
    use sui::package;
    use sui::transfer::{transfer, public_transfer, share_object};
    use sui::tx_context::{TxContext, sender};

    public struct CHENERGE_NFT has drop {}

    public struct CHENERGE_NB has key, store {
        id: UID,
        tokenId: u64
    }

    public struct State has key {
        id: UID,
        count: u64
    }

    fun init(otw: CHENERGE_NFT, ctx: &mut TxContext) {
        let pub = package::claim(otw, ctx);

        let keys = vector[
            utf8(b"name"),
            utf8(b"collection"),
            utf8(b"description"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"CHENERGE #{tokenId}"),
            utf8(b"CHENERGE collection"),
            utf8(b"CHENERGE nb"),
            utf8(
                b"https://avatars.githubusercontent.com/u/82131587?s=400&u=cf16292bd0fd209531d7dc43f4daed55f39f1714&v=4"
            )
        ];

        let mut display = display::new_with_fields<CHENERGE_NB>(&pub, keys, values, ctx);

        display::update_version(&mut display);

        let deployer = sender(ctx);

        public_transfer(pub, deployer);
        public_transfer(display, deployer);

        share_object(State {
            id: object::new(ctx),
            count: 0
        });
    }

    public entry fun mint(state: &mut State, to: address, ctx: &mut TxContext) {
        state.count = state.count + 1;

        let nft = CHENERGE_NB {
            id: object::new(ctx),
            tokenId: state.count
        };

        public_transfer(nft, to);
    }
}
