/// Module: ghnft
module ghnft::ghnft {

    use std::string::String;
    use std::string::utf8;
    use sui::display;
    use sui::object;
    use sui::object::UID;
    use sui::package;
    use sui::transfer;
    use sui::transfer::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct GHNFT has drop {}

    public struct MYGHNFT has key,store {
        id: UID,
        gh_id: String,
        image: String,
    }

    fun init(witness: GHNFT, ctx: &mut TxContext) {
        let key = vector[
            utf8(b"gh_id"),
            utf8(b"image"),
        ];
        let value = vector[
            utf8(b"{gh_id}"),
            utf8(b"{image}"),
        ];

        let publisher = package::claim(witness, ctx);
        let mut display = display::new_with_fields<MYGHNFT>(
        &publisher, key, value, ctx
        );
        display::update_version(&mut display);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint(recipient: address, ctx: &mut TxContext) {
        let gh_id = utf8(b"chongmingdu");
        let image = utf8(b"https://avatars.githubusercontent.com/u/22591706");
        let nft = MYGHNFT {
            id: object::new(ctx),
            gh_id,
            image,
        };
        transfer::public_transfer(nft, recipient);
    }

}

