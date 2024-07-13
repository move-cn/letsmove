module nft::nft {

    use std::string;
    use std::string::utf8;
    use sui::display;
    use sui::package;
    use sui::transfer::{public_transfer};
    use sui::tx_context::sender;

    public struct MY_NFT has key, store {
        id: UID,
        name: string::String,
        image_url: string::String,
    }

    public struct NFT has drop {}

    fun init(witness: NFT, ctx: &mut tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{image_url}"),
            utf8(b"BenjaminHang test NFTs"),
            utf8(b"https://github.com/BenjaminHang/letsmove"),
            utf8(b"BenjaminHang"),
        ];

        let publisher = package::claim(witness, ctx);

        let mut display = display::new_with_fields<MY_NFT>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        public_transfer(publisher, sender(ctx));
        public_transfer(display, sender(ctx));
    }

    public entry fun mint(name: string::String, image_url: string::String, ctx: &mut tx_context::TxContext) {
        let my_nft = MY_NFT {
            id: object::new(ctx),
            name,
            image_url,
        };

        public_transfer(my_nft, sender(ctx));
    }
}
