module galanft::galanft {

    use std::string::{utf8,String};
    use sui::object;
    use sui::package;
    use sui::display;
    use sui::object::{UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct GALANFT has drop {}

    struct NftObject has key, store {
        id: UID,
        image_url: String,
        name: String,
        desc: String
    }

    fun init(witness: GALANFT,ctx: &mut TxContext){
        let keys = vector[
            utf8(b"image_url"),
            utf8(b"name"),
            utf8(b"desc")
        ];

        let values = vector[
            utf8(b"{image_url}"),
            utf8(b"{name}"),
            utf8(b"{desc}")
        ];

        let publisher = package::claim(witness, ctx);
        let display =
            display::new_with_fields<NftObject>(&publisher, keys, values, ctx);
        display::update_version(&mut display);

        transfer::public_transfer(publisher,tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint(image_url: vector<u8>, name: vector<u8>,  desc: vector<u8>, ctx: &mut TxContext){
        let no = NftObject{
            id: object::new(ctx),
            image_url: utf8(image_url),
            name: utf8(name),
            desc: utf8(desc)
        };

        transfer::transfer(no, tx_context::sender(ctx));
    }

}
