module my_nft::my_nft {

    use std::string::{utf8, String};
    use sui::display;
    use sui::package;
    use sui::tx_context::sender;

    //NFT Object
    public struct MyImageNFT has key, store {
        id: UID,
        name: String,
        creator: address,
    }

    //OTW
    public struct MY_NFT has drop {}

    //module init function
    fun init(witness: MY_NFT, ctx: &mut TxContext) {
        let publisher = package::claim(witness, ctx);

        let fields = vector[
            utf8(b"{name}"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator")
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"my github nft"),
            utf8(
                b"https://avatars.githubusercontent.com/u/76994469?s=400&u=9641179f93e7b3fefcc20a58d0b724e74dc3b4af&v=4"
            ),
            utf8(b"{creator}")
        ];

        let mut display = display::new_with_fields<MyImageNFT>(&publisher, fields, values, ctx);


        display::update_version(&mut display);

        transfer::public_transfer(display, sender(ctx));
        transfer::public_transfer(publisher, sender(ctx));
    }

    public entry fun mint_to(name: String, recipient: address, ctx: &mut TxContext) {
        let nft = MyImageNFT {
            id: object::new(ctx),
            name,
            creator: sender(ctx),
        };

        transfer::public_transfer(nft, recipient);
    }
}
