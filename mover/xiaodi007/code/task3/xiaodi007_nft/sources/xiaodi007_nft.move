/*
/// Module: xiaodi007_nft
module xiaodi007_nft::xiaodi007_nft {

}
*/
module xiaodi007_nft::xiaodi007_nft {
    use std::string::{String, utf8};
    use sui::event;
    use sui::url::{Self, Url};
    use sui::display;
    use sui::package;

    public struct XIAODI007_NFT has drop {}

    public struct XiaoDi has key, store {
        id: UID,
        name: String,
    }

    /// Event: emitted when a new Puppy is minted.
    public struct XiaoDiMinted has copy, drop {
        id: ID,
        name: String,
        minted_by: address,
    }

fun init(otw: XIAODI007_NFT, ctx: &mut sui::tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
            utf8(b"description"),
        ];

        let values = vector[
            // For `name` we can use the `Github.name` property
            utf8(b"{name}"),
            // Image URL wo can use the `Github.name` property
            utf8(b"https://github.com/{name}.png"),
            utf8(b"{name}'s awsome NFT"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<XiaoDi>(&publisher, keys, values,ctx);

        // update version to 1
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }


    public fun mint_to_sender(
        name: vector<u8>,
        ctx: &mut TxContext
    ) {
        let sender = ctx.sender();
        let nft = XiaoDi {
            id: object::new(ctx),
            name: utf8(name)
        };

        event::emit(XiaoDiMinted {
            id: object::id(&nft),
            minted_by: sender,
            name: nft.name,
        });

        transfer::public_transfer(nft, sender);
    }

    /// Transfer `nft` to `recipient`
    public fun transfer(
        nft: XiaoDi, recipient: address, _: &mut TxContext
    ) {
        transfer::public_transfer(nft, recipient)
    }



    public fun destroy(xiaodi: XiaoDi) {
        let XiaoDi { id, name: _ } = xiaodi;
        id.delete()
    }

    public fun name(xiaodi: &XiaoDi): String { xiaodi.name }


}
