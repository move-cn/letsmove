module task3::yueliaoNFT {
    use sui::tx_context::{Self, TxContext};
    use sui::display;
    use sui::object::{Self, UID};
    use sui::package;
    use sui::transfer;
    use std::string::{String, utf8};

    public struct YUELIAONFT has drop {}

    public struct YUELIAO has key, store {
        id: UID,
        name: String,
        description: String,
    }

    fun init(otw: YUELIAONFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url")
        ];
        let values = vector[
            utf8(b"yueliao11"),
            utf8(b"NFT for yueliao11"),
            utf8(b"https://avatars.githubusercontent.com/u/187120306?u=1902a0c17e07b76b0bb5ff5a93144d78ed5c1ed8&v=4&size=64")
        ];
        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<YUELIAO>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        let deployer = tx_context::sender(ctx);
        transfer::public_transfer(publisher, deployer);
        transfer::public_transfer(display, deployer);
    }

    public entry fun mint(name: vector<u8>, description: vector<u8>, recipient: address, ctx: &mut TxContext) {
        let nft = YUELIAO {
            id: object::new(ctx),
            name: utf8(name),
            description: utf8(description),
        };
        transfer::public_transfer(nft, recipient);
    }
}