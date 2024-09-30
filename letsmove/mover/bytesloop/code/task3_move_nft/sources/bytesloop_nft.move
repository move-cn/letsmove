/// Module: bytesloop_nft
module task3_move_nft::bytesloop_nft {
    use sui::tx_context::sender;
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    
    public struct BYTESLOOP_NFT has drop{}

    public struct BYTESNFT has key, store{
        id: UID,
        name: String,
        image_url: String,
    }

    fun init(otw: BYTESLOOP_NFT, ctx: &mut TxContext) {
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
            utf8(b"{link}"),
            utf8(b"{image_url}"),
            utf8(b"{description}"),
            utf8(b"{project_url}"),
            utf8(b"{creator}"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<BYTESNFT>(
            &publisher,
            keys,
            values,
            ctx
        );

        display::update_version(&mut display);
        transfer::public_transfer(display, tx_context::sender(ctx));
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext){
        let nft = BYTESNFT{id: object::new(ctx), name, image_url};
        transfer::public_transfer(nft, sender(ctx));
    }

    public entry fun transferto(nft: BYTESNFT, recipient: address, _: &mut TxContext){
        transfer::public_transfer(nft, recipient);
    }

    public entry fun burn(nft: BYTESNFT){
        let BYTESNFT{id, name: _, image_url: _} = nft;
        object::delete(id);
    }
}