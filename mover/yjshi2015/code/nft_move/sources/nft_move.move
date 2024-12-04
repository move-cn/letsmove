module nft_move::YJSHI2015NFT {
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8, String};
    use sui::transfer::transfer;
    use sui::object::{Self, UID};
    use sui::event;

    // The creator bundle: these two packages often go together.
    use sui::package;
    use sui::display;

    public struct MintEvent has copy, drop {
        nft_id: ID,
        minter: address,
        name: String,
    }

    /// The Hero - an outstanding collection of digital art.
    public struct YJSHI2015 has key, store {
        id: UID,
        name: String,
        img_url: String,
        description: String,
    }

    /// One-Time-Witness for the module.
    public struct YJSHI2015NFT has drop {}

    /// In the module initializer one claims the `Publisher` object
    /// to then create a `Display`. The `Display` is initialized with
    /// a set of fields (but can be modified later) and published via
    /// the `update_version` call.
    ///
    /// Keys and values are set in the initializer but could also be
    /// set after publishing if a `Publisher` object was created.
    // fun init(otw: YJSHI2015NFT, ctx: &mut TxContext) {


    //      let publisher = package::claim(otw, ctx);

    //     // create a new display object
    //     let mut display = display::new<YJSHI2015>(&publisher, ctx);

    //     display.add(b"name".to_string(), b"YJSHI2015NFT {name}".to_string());
    //     display.add(b"img_url".to_string(), b"{img_url}".to_string());
    //     display.add(b"description".to_string(), b"YJSHI2015 NFT".to_string());

    //     display::update_version(&mut display);
    //     transfer::public_transfer(display, tx_context::sender(ctx));
    //     transfer::public_transfer(publisher, tx_context::sender(ctx));
    // }

    fun init(otw: YJSHI2015NFT, ctx: &mut TxContext) {
         let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"creator"),
        ];
        let values = vector[
            utf8(b"{name}"),
            utf8(b"{img_url}"),
            utf8(b"this is YJSHI2015NFT!"),
            utf8(b"yjshi2015")
        ];

        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);

        // Get a new `Display` object for the `Hero` type.
        let mut display = display::new_with_fields<YJSHI2015>(
            &publisher, keys, values, ctx
        );

        display::update_version(&mut display);
        transfer::public_transfer(display, tx_context::sender(ctx));
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    /// Anyone can mint their `Hero`!
    public fun mint(name: String, img_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let nft = YJSHI2015 { id, name, img_url, description: b"MY NFT".to_string() };

        event::emit(MintEvent {
            nft_id: object::id(&nft),
            minter: tx_context::sender(ctx),
            name,
        });

        transfer::public_transfer(nft, tx_context::sender(ctx));
    }

}
