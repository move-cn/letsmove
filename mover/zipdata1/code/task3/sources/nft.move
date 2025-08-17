module zipdata_task3::zipdata1_nft {
    use std::string;

    public struct MyNFT has key, store {
        id: sui::object::UID,
        name: string::String,
        image_url: string::String,
    }

    fun init(ctx: &mut sui::tx_context::TxContext) {
        let my_nft = MyNFT {
            id: sui::object::new(ctx),
            name: string::utf8(b"My NFT"),
            image_url: string::utf8(
                b"https://avatars.githubusercontent.com/u/107616568?v=4",
            ),
        };
        sui::transfer::public_transfer(my_nft, sui::tx_context::sender(ctx));
    }
    public fun mint(url: string::String, ctx: &mut sui::tx_context::TxContext) {
        let my_nft = MyNFT {
            id: sui::object::new(ctx),
            name: string::utf8(b"My NFT"),
            image_url: url,
        };
        sui::transfer::public_transfer(my_nft, sui::tx_context::sender(ctx));
    }
}
