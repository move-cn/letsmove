module task3::archie_nft {
    use std::string::{utf8};
    use sui::package;
    use sui::display;

    public struct MintingCapability has key {
        id: UID,
    }

    public struct ARCHIE_NFT has drop {}

    public struct Archie_NFT has key, store {
        id: UID,
    }

    fun init(witness: ARCHIE_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];
        let values = vector[
            utf8(b"ArchieR7"),
            utf8(b"An NFT representing a ArchieR7"),
            utf8(b"https://avatars.githubusercontent.com/u/9522925?v=4"),
            utf8(b"ArchieR7"),
        ];
        let publisher = package::claim(witness, ctx);
        let mut display = display::new_with_fields<Archie_NFT>(
            &publisher, keys, values, ctx
        );
        display::update_version(&mut display);
        
        transfer::transfer(MintingCapability{ id: object::new(ctx) }, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
        transfer::public_transfer(publisher, tx_context::sender(ctx));
    }

    public fun mint(_: &MintingCapability, count: u16, recipient: address, ctx: &mut TxContext) {
        let mut i = 0;
        while (i < count) {
            transfer::public_transfer(Archie_NFT { id: object::new(ctx) }, recipient);
            i = i + 1;
        };
    }
}
