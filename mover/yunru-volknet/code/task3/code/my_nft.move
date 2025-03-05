/*
/// Module: my_nft
module my_nft::my_nft;
*/
module my_nft::my_nft{
    use std::string;
    use std::string::String;
    use sui::transfer::transfer;
    use sui::tx_context::sender;

    public struct MyNFT has key , store{
        id:UID,
        name:String,
        image_url:String,
    }

    fun init(ctx: &mut TxContext){
        let nft = MyNFT{
            id:object::new(ctx),
            name:string::utf8(b"yunru NFT"),
            image_url: string::utf8(b"https://th.bing.com/th/id/OIP.ttGXVHEedmY51ZM3yCsU_gAAAA?rs=1&pid=ImgDetMain") ,
        };
        transfer(nft, sender(ctx));

    }

    public entry fun mint_and_transfer_nft(
        image_url: String,
        name:String,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);
        let nft = MyNFT {
            id,
            name,
            image_url,
        };
        transfer(nft, sender(ctx));

    }

}