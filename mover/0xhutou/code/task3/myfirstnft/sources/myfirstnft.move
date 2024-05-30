/// Module: myfirstnft
module myfirstnft::myfirstnft {

    use sui::tx_context::{sender};
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    public struct HuTou has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    /// One-Time-Witness for the module.
    public struct MYFIRSTNFT has drop {}

    /// In the module initializer one claims the `Publisher` object
    /// to then create a `Display`. The `Display` is initialized with
    /// a set of fields (but can be modified later) and published via
    /// the `update_version` call.
    ///
    /// Keys and values are set in the initializer but could also be
    /// set after publishing if a `Publisher` object was created.
    fun init(otw: MYFIRSTNFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            // For `name` one can use the `Hero.name` property
            utf8(b"HuTou"),
            // For `link` one can build a URL using an `id` property
            utf8(b"Under construction!"),
            // For `image_url` use an IPFS template + `image_url` property.
            utf8(b"ipfs://{image_url}}"),
            // Description is static for all `Hero` objects.
            utf8(b"HuTou's first nft!"),
            // Project URL is usually static
            utf8(b"Under construction!"),
            // Creator field can be any
            utf8(b"HuTou")
        ];

        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);

        // Get a new `Display` object for the `Hero` type.
        let mut display = display::new_with_fields<HuTou>(
            &publisher, keys, values, ctx
        );

        // Commit first version of `Display` to apply changes.
        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
    }

    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        transfer::public_transfer(HuTou { id, name, image_url },sender(ctx));
    }

    public entry fun update_imageurl (self: &mut HuTou, image_url: String) {
        self.image_url = image_url;
    }

}

