module task3::mynft {
    use sui::tx_context::{Self, TxContext};
    use sui::display;
    use sui::object::{Self, UID};
    use sui::package;
    use sui::transfer;
    use std::string::{String, utf8};

    public struct MYNFT has drop {}

    public struct SYYANI has key, store {
        id: UID,
        name: String,
        description: String,
    }

    fun init(otw: MYNFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"syyani"),
            utf8(b"A sample NFT for syyani"),
            utf8(b"https://avatars.githubusercontent.com/u/40732861")
        ];
        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<SYYANI>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        let deployer = tx_context::sender(ctx);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = SYYANI {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
        };
        transfer::public_transfer(nft, recipient);
    }
}