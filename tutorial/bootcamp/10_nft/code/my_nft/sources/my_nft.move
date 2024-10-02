
module my_nft::my_nft {

    use std::string;
    use std::string::String;
    use sui::object;
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;

    public struct My_NFT has key, store{
        id:UID,
        name: String,
        image_url: String
    }

    fun init(ctx:&mut TxContext){
        let  my_nft = My_NFT{
            id: object::new(ctx),
            name: string::utf8(b"uvd nft"),
            image_url: string::utf8(b"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimage109.360doc.com%2FDownloadImg%2F2024%2F05%2F1018%2F283462633_4_20240510061136195&refer=http%3A%2F%2Fimage109.360doc.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1722945331&t=3e9089c452b394660c39b0b88bd8871a"),
        };
        public_transfer(my_nft, sender(ctx));
    }


    public entry  fun mint(name:String, image_url:String, ctx:&mut TxContext){
        let  my_nft = My_NFT{
            id:object::new(ctx),
            name,
            image_url
        };
        public_transfer(my_nft, sender(ctx));
    }


    public entry fun edit_url(my_nft:&mut My_NFT, url:String, ctx:&mut TxContext){
        my_nft.image_url  = url ;
    }


}
