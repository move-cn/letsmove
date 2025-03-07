module display_nft::display_nft {
    use sui::tx_context::{sender};
        use std::string::{Self, String};
    use sui::transfer;
    // use std::string::{Self, String};
    use sui::package;
    use sui::display;

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    public struct DISPLAY_NFT has drop {}


    fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
        let keys = vector[
             string::utf8(b"name"),
             string::utf8(b"link"),
             string::utf8(b"image_url"),
            string::utf8(b"description"),
            string::utf8(b"project_url"),
            string::utf8(b"creator"),
        ];

        let values = vector[
            string::utf8(b"{name}"),
            string::utf8(b"https://sui-heroes.io/hero/{id}"),
            string::utf8(b"{image_url}"),
            string::utf8(b"THIS IS A GIFT NFT FORM SINGMIN!"),
            string::utf8(b"https://sui-heroes.io"),
            string::utf8(b"Unknown Sui Fan")
        ];

        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));

        let nft = MyNFT { id: object::new(ctx),
         name:string::utf8(b"SINGMIN DISPLAY NFT"),
         image_url: string::utf8(b"https://avatars.githubusercontent.com/u/74779427?v=4") };
        transfer::public_transfer(nft, sender(ctx));
    }


    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let nft =  MyNFT { id, name, image_url };
        transfer::public_transfer(nft, sender(ctx));
    }
    public entry fun mint_to(name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
         let id = object::new(ctx);
        let nft =  MyNFT { id, name, image_url };
        transfer::public_transfer(nft, recipient);
    }
}