/*
/// Module: display_nft
module display_nft::display_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module display_nft::display_nft {
    use std::string::{utf8, String};

    use sui::object::{new};
    use sui::package::{claim};
    use sui::display::{new_with_fields, update_version};
    use sui::transfer::{public_transfer};
    use sui::tx_context::{sender};

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    public struct DISPLAY_NFT has drop {}

    fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b""),
            utf8(b"{image_url}"),
            utf8(b"My fist display NFT!"),
            utf8(b""),
            utf8(b"riscver")
        ];

        let publisher = claim(otw, ctx);

        let mut display = new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );

        update_version(&mut display);

        public_transfer(publisher, sender(ctx));
        public_transfer(display, sender(ctx));
        
        let  my_nft = MyNFT {
            id: new(ctx),
            name: utf8(b"riscver display nft"),
            image_url: utf8(b"https://avatars.githubusercontent.com/u/203748122"),
        };

        public_transfer(my_nft, sender(ctx));
    }

    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let  my_nft = MyNFT {
            id: new(ctx),
            name,
            image_url
        };

        public_transfer(my_nft, sender(ctx));
    }

    public entry fun edit_url(my_nft: &mut MyNFT, url: String, ctx: &mut TxContext){
        my_nft.image_url  = url;
    }
}
