module task3::nft {

    use std::string::String;
    use std::string::utf8;
    use sui::display;
    use sui::object;
    use sui::object::UID;
    use sui::package;
    use sui::transfer;
    use sui::transfer::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct NFT has drop {}

    public struct MyNFT has key,store {
        id: UID,
        github_id: String,
        image_url: String,
    }

    fun init(witness: NFT, ctx: &mut TxContext) {
        let key = vector[
            utf8(b"github_id"),
            utf8(b"image_url"),
        ];
        let valus = vector[
            utf8(b"{github_id}"),
            utf8(b"{image_url}"),
        ];

        let publisher = package::claim(witness, ctx);
        let mut display = display::new_with_fields<MyNFT>(
            &publisher, key, valus, ctx
        );
        display::update_version(&mut display);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_and_transfer(recipient: address, ctx: &mut TxContext) {
        let github_id = utf8(b"brookbang");
        let image_url = utf8(b"https://avatars.githubusercontent.com/u/145747643?v=4");
        let nft = MyNFT {
            id: object::new(ctx),
            github_id,
            image_url,
        };
        transfer::public_transfer(nft, recipient);
    }

}