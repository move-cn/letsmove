module lumia001::Lumia001Nft {
    use std::ascii::String;
    use std::string::utf8;

    use sui::package;
    use sui::transfer::public_transfer;

    use sui::display;

    public struct LUMIA001NFT has drop {}

    public

    struct NFT has key, store {
        id: sui::object::UID,
        name: String,
    }

    fun init(otw: LUMIA001NFT, ctx: &mut tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
        ];

        let values = vector[
            utf8(b"Lumia001"),
            utf8(b"https://avatars.githubusercontent.com/u/44024489?v=4"),
            utf8(b"Lumia001's NFT."),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    // every one can mint
    public entry fun mint_to(name: String, recipient: address, ctx: &mut TxContext) {
        let nft = NFT {
            id: object::new(ctx),
            name,
        };
        public_transfer(nft, recipient)
    }
}