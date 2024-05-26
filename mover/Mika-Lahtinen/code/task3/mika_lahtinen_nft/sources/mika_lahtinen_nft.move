module mika_lahtinen_nft::mika_lahtinen_nft {
    /*
    Now we have a contract to define a NFT.
    What does the contract have:
    1. Import API from Sui framework
    2. Defination of the structure of NFT
    3. Functions for basic usage of NFT
    */

    // imports
    use std::string::{utf8, String};
    use std::vector;
    use sui::transfer;
    use sui::object::{Self, ID, UID};
    use sui::url;
    use sui::tx_context::{Self, TxContext};
    use sui::display;
    use sui::package;

    public struct MIKA_LAHTINEN_NFT has drop {
    }

    public struct MIKA_LAHTINEN_NFT_MINTED has key, store {
        id: UID,
        name: String,
    }

    
    fun init(otw:MIKA_LAHTINEN_NFT, ctx: &mut TxContext) {
        let key = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let value = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/36355287"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<MIKA_LAHTINEN_NFT_MINTED>(
            &publisher, key, value, ctx
        );

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_to(name: String, recipient: address, ctx: &mut TxContext){
        let nft = MIKA_LAHTINEN_NFT_MINTED{
            id: object::new(ctx),
            name,
        };

        transfer::public_transfer(nft, recipient)
    }
}
