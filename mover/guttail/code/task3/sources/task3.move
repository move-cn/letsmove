module task3::guttail_nft  {
    use std::ascii::String;
    use std::string::utf8;
    use sui::display;
    use sui::package;
    use sui::transfer::public_transfer;

    public struct GUTTAIL_NFT has drop {}

    public struct NFT has key,store {
        id: UID,
        name: String,
    }
    
    fun init(otw: GUTTAIL_NFT, ctx: &mut sui::tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/169068214"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values,ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_to(name: String, recipient: address,ctx: &mut TxContext) {
        let nft = NFT{
            id: object::new(ctx),
            name,
        };
        public_transfer(nft, recipient)
    }
}