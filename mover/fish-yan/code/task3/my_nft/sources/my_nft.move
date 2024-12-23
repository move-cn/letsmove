/*
/// Module: my_nft
module my_nft::my_nft;
*/
module my_nft::fish {
    use sui::display;
    use sui::package;
    use std::string::{String, utf8};

    public struct FISH has drop {}

    public struct FISHNFT has key, store {
        id: UID,
        name: String,
        description: String,
    }

    fun init(otw: FISH, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"fish-yan"),
            utf8(b"NFT for fish-yan"),
            utf8(b"https://avatars.githubusercontent.com/u/15316488?v=4")
        ];
        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<FISHNFT>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        let deployer = tx_context::sender(ctx);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = FISHNFT {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
        };
        transfer::public_transfer(nft, recipient);
    }
}