/// Module: m4sk93_nft
module m4sk93_nft::m4sk93_nft {
    use sui::display;
    use sui::package;
    use sui::transfer;
    use sui::transfer::public_transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};
    use std::string::{utf8, String};

    public struct M4SK93_NFT has drop {}

    public struct M4SK93NFT has key,store {
        id: UID,
        name: String,
    }
    
    fun init(otw: M4SK93_NFT, ctx: &mut sui::tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/162651341?v=4"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<M4SK93NFT>(&publisher, keys, values,ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_and_transfer(name: String, recipient: address,ctx: &mut TxContext) {
        let nft = M4SK93NFT{
            id: object::new(ctx),
            name,
        };
        public_transfer(nft, recipient)
    }
}
