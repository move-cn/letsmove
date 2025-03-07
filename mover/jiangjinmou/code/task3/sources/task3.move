module task3::jiangjinmou_nft {
    use std::string::{Self, utf8, String};
    use sui::display;
    use sui::package;
    use sui::transfer::transfer;

    public struct NFT has key,store {
        id: UID,
        name: String,
        description: String,
        creator: address,
        url: String,
    }
    
    public struct JIANGJINMOU_NFT has drop {}

    #[allow(lint(share_owned))]
    fun init(otw: JIANGJINMOU_NFT, ctx: &mut sui::tx_context::TxContext) {
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

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_to(recipient: address,ctx: &mut TxContext) {
        let nft = NFT{
            id: object::new(ctx),
            name: string::utf8(b"jiangjinmou"),
            description: string::utf8(b"JIANGJINMOU NFT"),
            creator: tx_context::sender(ctx),
            url: string::utf8(b"https://avatars.githubusercontent.com/u/113187175"),
        };
        transfer(nft, recipient);
    }
}