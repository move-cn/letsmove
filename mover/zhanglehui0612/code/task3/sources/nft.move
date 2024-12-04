module nft::hero_nft {
    use sui::tx_context::{sender, TxContext};
    use std::string::{utf8, String};
    use sui::transfer::transfer;
    use sui::object::{Self, UID};
    use sui::package;
    use sui::display;

    /// One-Time-Witness for the module.
    public struct HERO_NFT has drop {}

    /// Hero NFT
    public struct Hero has key, store {
        id: UID,
        name: String,
        image_url: String
    }

    fun init(witness: HERO_NFT, ctx: &mut TxContext) {
        // 构造字段列表
        let fields = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        // 构造值列表
        let values = vector[
            // For `name` one can use the `Hero.name` property
            utf8(b"{name}"),
            // For `link` one can build a URL using an `id` property
            utf8(b"https://sui-heroes.io/hero/{id}"),
            // For `image_url` use an IPFS template + `image_url` property.
            utf8(b"ipfs://{image_url}"),
            // Description is static for all `Hero` objects.
            utf8(b"A true Hero of the Sui ecosystem!"),
            // Project URL is usually static
            utf8(b"https://sui-heroes.io"),
            // Creator field can be any
            utf8(b"Unknown Sui Fan")
        ];

        // 创建Publisher
        let publisher = package::claim(witness, ctx);

        // 创建Display
        let mut display = display::new_with_fields<Hero>(&publisher, fields, values, ctx);
        display::update_version(&mut display);
        // 把publisher和display转移给合约部署的人
        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
    }

    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let hero =  Hero { id, name, image_url };
        transfer::public_transfer(hero, sender(ctx));
    }
}
