/// Module: move_nft
module nft::nft {
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    //funtion some nft
    public struct Wbqqqq has key, store {
        id: UID,
        name: String
    }

    //OTW is same with module name
    public struct NFT has drop {}

    fun init(otw: NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")];

        let values = vector[
            utf8(b"Wbqqqq_NFT"),
            utf8(b"https://avatars.githubusercontent.com/u/17332298")];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<Wbqqqq>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }


    public entry fun mint_to_sender(name: String, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = Wbqqqq{
            id: object::new(ctx),
            name,
        };
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(nft: Wbqqqq, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }

}

