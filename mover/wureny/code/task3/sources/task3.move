module my_nft::wureny_nft {
    use sui::object;
    use std::string;
    use std::string::String;
    use sui::coin;
    use sui::transfer::{freeze_object, public_freeze_object, public_transfer, public_share_object};
    use sui::tx_context::sender;
    use sui::url::Url;
    //use std::string;

    public struct Wureny_NFT has key, store {
        id: UID,
        name: String,
        image_url: String
    }

    //默认规范： 要有name和image_url字段，才能在浏览器正常显示
    //此外，还有creator等可display的字段，可用于json展示
    fun init(ctx: &mut TxContext) {
        let my_nft = Wureny_NFT {
            id: object::new(ctx),
            name: string::utf8(b"wureny_nft"),
            image_url: string::utf8(b"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG2eRI5caKXuweLhTLOKhChJLbbj-SB4Q-Aw&usqp=CAU")
        };

        public_transfer(my_nft, sender(ctx));
    }

    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let my_nft = Wureny_NFT {
            id: object::new(ctx),
            name,
            image_url
        };

        public_transfer(my_nft, sender(ctx));
    }
}