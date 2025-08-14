/// Module: move_nft
module move_nft::bird_nft {
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    //funtion some nft
    public struct BIRD has key, store {
        id: UID,
        name: String
    }

    //otw name is same as module
    public struct BIRD_NFT has drop {}

    fun init(otw: BIRD_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")];

        let values = vector[
            utf8(b"BIRD_NFT"),
            utf8(b"https://avatars.githubusercontent.com/u/39985362?s=400&u=37dc69923de003499aa614ed8c2fa3ddb61907ce&v=4")];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<BIRD>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }
    
    // mint NFT
    public entry fun mint_to_sender(name: String, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = BIRD{
            id: object::new(ctx),
            name,
        };
        transfer::public_transfer(nft, sender);
    }

    // transfer NFT
    public entry fun transfer(nft: BIRD, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
}
