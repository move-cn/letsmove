/// Module: move_nft
module move_nft::qyoung_nft {
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    //funtion some nft
    public struct Qyoung has key, store {
        id: UID,
        name: String
    }

    //OTW is same with module name
    public struct QYOUNG_NFT has drop {}

    fun init(otw: QYOUNG_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")];

        let values = vector[
            utf8(b"QYOUNG_NFT"),
            utf8(b"https://raw.githubusercontent.com/isQyoung/letsmove/main/mover/isQyoung/images/isqyoung.png")];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<Qyoung>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }
    public entry fun mint_to_sender(name: String, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = Qyoung{
            id: object::new(ctx),
            name,
        };
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(nft: Qyoung, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
}

