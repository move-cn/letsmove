/// Module: move_nft
module move_nft::tmm_nft {
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    //funtion some nft
    public struct TMM has key, store {
        id: UID,
        name: String
    }

    public struct TMM_NFT has drop {}

    fun init(otw: TMM_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")];

        let values = vector[
            utf8(b"TMM_NFT"),
            utf8(b"https://avatars.githubusercontent.com/u/149467233?v=4")];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<TMM>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }
    
    public entry fun mint_to_sender(name: String, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = TMM{
            id: object::new(ctx),
            name,
        };
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(nft: TMM, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
}
