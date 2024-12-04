/*
/// Module: nft
module nft::nft {

}
*/

module nft::nft {
    use std::string::{Self, utf8, String};
    use sui::url::{Self, Url};
    use sui::display;
    use sui::package;

    public struct Nft has key, store {
        id: UID,
        name: String,
        description: String,
        creator: address,
        url: Url,
    }

    public struct NFT has drop {}

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

        let mut display = display::new_with_fields<Nft>(
            &publisher,
            keys,
            values,
            ctx
        );

        display::update_version(&mut display);

        transfer::public_share_object(display);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    entry fun mint(recipient:address, ctx: &mut TxContext) {
        let nft = Nft {
            id: object::new(ctx),
            name: string::utf8(b"shuhaoLIN"),
            description: string::utf8(b"shuhaoLIN NFT"),
            creator: tx_context::sender(ctx),
            url: url::new_unsafe_from_bytes(
                b"https://avatars.githubusercontent.com/u/33955704?s=400&u=6630f5a23c0821a6cbcde9cdf270dce917ea80b2&v=4"
            )
        };
        transfer::public_transfer(nft, recipient);
    }
}
