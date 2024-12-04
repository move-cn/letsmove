/// Module: oliverxl_nft
module move_nft::oliverxl_nft {
    use std::string;
    use std::string::String;
    use sui::object;
    use sui::transfer::public_transfer;
    use sui::tx_context::{sender, TxContext};

    public struct Oliverxl_Nft has key, store {
        id: UID,
        name: String,
        image_url: String
    }

    fun init(ctx: &mut TxContext) {
        let my_nft = Oliverxl_Nft {
            id: object::new(ctx),
            name: string::utf8(b"oliverxl nft"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/20931572?v=4"),
        };
        public_transfer(my_nft, sender(ctx));
    }


    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let my_nft = Oliverxl_Nft {
            id: object::new(ctx),
            name,
            image_url
        };
        public_transfer(my_nft, sender(ctx));
    }

    public entry fun mint_and_transfer(name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
        let my_nft = Oliverxl_Nft {
            id: object::new(ctx),
            name,
            image_url
        };
        let sender = tx_context::sender(ctx);

        public_transfer(my_nft, recipient);
    }
}
