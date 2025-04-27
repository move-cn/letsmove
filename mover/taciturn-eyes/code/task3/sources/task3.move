module task3::taciturneyes_nft  {
    use std::string::{String,utf8};
    // use std::string::utf8;
    use sui::display;
    use sui::object;
    use sui::object::{UID};
    use sui::package;
    use sui::transfer;
    use sui::transfer::public_transfer;
    use sui::tx_context;
    use sui::tx_context::{TxContext};

    public struct TACITURNEYES_NFT has drop {}

    public struct NFT has key,store {
        id: UID,
        name: String,
        image_url: String,
    }
    
    fun init(otw: TACITURNEYES_NFT, ctx: &mut sui::tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/77370454?v=4"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values,ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
        let nft = NFT{
            id: object::new(ctx),
            name: utf8(b"TACITURNEYES_NFT"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/77370454?v=4"),
        };
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

    public entry fun mint_to(name: String, image_url:String,recipient: address,ctx: &mut TxContext) {
        let nft = NFT{
            id: object::new(ctx),
            name,
            image_url,
        };
        public_transfer(nft, recipient)
    }
}