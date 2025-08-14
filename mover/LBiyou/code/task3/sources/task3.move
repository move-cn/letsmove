
/// Module: task3
module task3::lbiyou_nft {

    use std::ascii::String;
    use std::string::utf8;
    use sui::display;
    // use sui::object;
    // use sui::object::{UID};
    use sui::package;
    // use sui::transfer;
    use sui::transfer::public_transfer;
    // use sui::tx_context;

    public struct LBIYOU_NFT has drop {}

    public struct NFT has key,store {
        id: UID,
        name: String,
    }
    
    fun init(otw: LBIYOU_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/104566270?v=4"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values,ctx);

        // update version to 1
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    // every one can mint
    public entry fun mint_to(name: String, recipient: address,ctx: &mut TxContext) {
        let nft = NFT{
            id: object::new(ctx),
            name,
        };
        public_transfer(nft, recipient)
    }
}