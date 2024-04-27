/// Module: sui_nft
module sui_nft::sui_nft {
    use sui::tx_context::sender;
    use std::string::{utf8, String};

    // The creator bundle: these two packages often go together.
    use sui::package;
    use sui::display;

    /// The Hero - an outstanding collection of digital art.
    public struct Hero has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    /// One-Time-Witness for the module.
    public struct SUI_NFT has drop {}

    fun init(otw: SUI_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
        ];

        let values = vector[
            // For `name` one can use the `Hero.name` property
            utf8(b"{name}"),
            // For `image_url` use an IPFS template + `image_url` property.
            utf8(b"{image_url}"),
            // Description is static for all `Hero` objects.
            utf8(b"A true Hero of the Sui ecosystem!"),
            // Creator field can be any
            utf8(b"Qiao")
        ];

        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);

        // Get a new `Display` object for the `Hero` type.
        let mut display = display::new_with_fields<Hero>(
            &publisher, keys, values, ctx
        );

        // Commit first version of `Display` to apply changes.
        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
    }

    /// Anyone can mint their `Hero`!
    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let hero = Hero { id, name, image_url };
        transfer::public_transfer(hero, ctx.sender());
    }

    public entry fun transfer(
        nft: Hero, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }

    public entry fun burn(hero: Hero, _: &mut TxContext) {
        let Hero { id, name: _, image_url: _ } = hero;
        object::delete(id)
    }
}
