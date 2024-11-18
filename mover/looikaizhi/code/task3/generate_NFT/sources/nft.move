module generate_nft::nft{
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;
    use sui::transfer;

    public struct MyNFT has key, store{
        id: UID,
        name: String
    }

    public struct NFT has drop{}

    fun init(otw: NFT, ctx: &mut TxContext){
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://sui-heroes.io/hero/{id}"),
            utf8(b"https://pbs.twimg.com/profile_images/1809913909513699328/6IF8so7d_400x400.jpg"),
            utf8(b"A Meme NFT of the Sui ecosystem!"),
            utf8(b"https://docs.sui.io/standards/display"),
            utf8(b"looikaizhi"),
        ];

        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        );

        display.update_version();

        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
    }

    public entry fun mint(name: String, minter:address, ctx: &mut TxContext){
        let nft = MyNFT{
            id: object::new(ctx),
            name
        };

        transfer::public_transfer(nft, minter);
    }

}

