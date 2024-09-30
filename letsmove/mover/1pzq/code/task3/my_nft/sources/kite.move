module my_nft::kite {
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8, String};
    use sui::transfer::public_transfer;
    use sui::object::UID;

    use sui::package;
    use sui::display;

    public struct Hero has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    public struct KITE has drop {}

    fun init(otw: KITE, ctx: &mut TxContext) {
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
            utf8(b"https://sui-heroes.io/hero/{id}"),
            utf8(b"{image_url}"),
            utf8(b"He Jing Yi's birthday!"),
            utf8(b"https://sui-heroes.io"),
            utf8(b"Unknown Sui Fan")
        ];

        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<Hero>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);

        public_transfer(publisher, sender(ctx));
        public_transfer(display, sender(ctx));
    }

    public fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        transfer::public_transfer(Hero { id, name, image_url },sender(ctx))
    }

    public entry fun transfer_nft(
        nft: Hero,
        recipient: address,
        _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient);
    }
}
/*
Transaction Digest: 41qRoqcNHKga4Pe5omDX1YXogBBecoWEuZ59f2WqnUZA
 PackageID

0xae98f7099f2417d0a32e1089d6ea36f138926a62a7eba85f57cda01815a530cf

minthash 9nzkgf24R5orUQ62QUBADoQ9dMfmV4pcy78GvxscStmx
 objectID1 0xb92d62ee0a1c32b128404dba3c79216d7de2e310f3210e4ab767845ce89e8215


 transferhash 94FEeT5PqGQcXL7dH9LRQzp4KszhRzwB9EhzZQFYPaC9

*/