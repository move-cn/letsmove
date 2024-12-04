/// Module: collar_ntf
module collar_ntf::collar_ntf {
    use sui::display;
    use sui::package;
    use sui::transfer;
    use sui::transfer::public_transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};
    use std::string::{utf8, String};

    public struct COLLAR_NTF has drop {}

    public struct COLLARNTF has key,store {
        id: UID,
        name: String,
    }
    
    fun init(otw: COLLAR_NTF, ctx: &mut sui::tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/49566393"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<COLLARNTF>(&publisher, keys, values,ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_and_transfer(name: String, recipient: address,ctx: &mut TxContext) {
        let nft = COLLARNTF{
            id: object::new(ctx),
            name,
        };
        public_transfer(nft, recipient)
    }
}
