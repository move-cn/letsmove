module my_nft::nft2 {
    use std::string::String;
    use std::string::utf8;
    use sui::display;
    // use sui::object;
    use sui::package;
    // use sui::transfer::transfer;
    use sui::transfer::public_transfer;

    public struct NFT2 has drop {}

    public struct MyNft2 has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    fun init(otw: NFT2, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
        ];
        let values = vector[
            utf8(b"{name}"),
            utf8(b"this is {name}'s NFT"),
            utf8(b"{image_url}"),
        ];
        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<MyNft2>(&publisher, keys, values, ctx);

        display.update_version();

        public_transfer(publisher, tx_context::sender(ctx));
        public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint(addr: address, ctx: &mut TxContext) {
        let nft = MyNft2 {
            id: object::new(ctx),
            name: utf8(b"fengfengxiong123"),
            image_url: utf8(
                b"https://avatars.githubusercontent.com/u/46967327?u=d074eb812d53a9d64a78464af56e0a801cfbbbf2&v=4"
            )
        };
        public_transfer(nft, addr)
    }
}