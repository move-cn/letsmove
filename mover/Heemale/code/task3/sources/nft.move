module task3::nft {

    use std::string::{Self, utf8, String};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url};
    use sui::display;
    use sui::package;
    use sui::transfer;

    struct Nft has key, store {
        id: UID,
        name: String,
        description: String,
        creator: address,
        url: Url,
    }

    struct NFT has drop {}

    #[allow(lint(share_owned))]
    fun init(otw: NFT, ctx: &mut TxContext) {
        let publisher = package::claim(otw, ctx);

        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"creator"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"{description}"),
            utf8(b"{creator}"),
            utf8(b"{url}"),
        ];

        let display = display::new_with_fields<Nft>(
            &publisher,
            keys,
            values,
            ctx
        );

        display::update_version(&mut display);

        transfer::public_share_object(display);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    entry fun mint(ctx: &mut TxContext) {
        let nft = Nft {
            id: object::new(ctx),
            name: string::utf8(b"Heemale"),
            description: string::utf8(b"Heemale NFT"),
            creator: tx_context::sender(ctx),
            url: url::new_unsafe_from_bytes(
                b"https://avatars.githubusercontent.com/u/57651639?s=400&u=25e8d8a5c8eed5d1408617994c5d8ea8ec0ac5c2&v=4"
            )
        };
        transfer::public_transfer(nft, tx_context::sender(ctx));
    }
}