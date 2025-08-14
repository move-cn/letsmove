module my_nft::my_nft {

    use std::string;
    use std::string::String;
    use sui::transfer;
    use sui::tx_context;

    public struct MY_NFT has key, store {
        id:UID,
        name:String,
        image_url:String
    }

    fun init(ctx:&mut TxContext){
        let  my_nft = MY_NFT{
            id: object::new(ctx),
            name: string::utf8(b"xianglispider"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/85993688?v=4"),
        };
        transfer::public_transfer(my_nft, tx_context::sender(ctx));
    }


    public entry  fun mint(name:String, image_url:String, recipient: address, ctx:&mut TxContext){
        let  my_nft = MY_NFT{
            id:object::new(ctx),
            name,
            image_url
        };
        transfer::public_transfer(my_nft, recipient);
    }
}