module my_nft::my_nft{
    use std::string;
    use std::string::String;
    use sui::transfer::transfer;
    use sui::tx_context::sender;


    public struct MyNFT has key{
        id:UID,
        name:String,
        image_url:String,
    }

    fun init(ctx:&mut TxContext){

        let my_nft= MyNFT{
            id:object::new(ctx),
            name:string::utf8(b"Azhan NFT"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/144402853?v=4"),
        };
        transfer(my_nft,sender(ctx));
    }

    public entry fun mint (name:String,image_url:String,recipient:address,ctx: &mut TxContext) {

        let my_nft= MyNFT{
            id:object::new(ctx),
            name:name,
            image_url:image_url,
        };
        transfer(my_nft,recipient);

    }
}