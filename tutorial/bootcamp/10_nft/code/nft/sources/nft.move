module nft::nft {
    use std::string;
    use std::string::String;
    use sui::object;
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;


    public struct NFT has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    fun init(ctx:&mut TxContext){
        let my_nft = NFT{
            id:object::new(ctx),
            name:string::utf8(b"my name"),
            image_url: string::utf8(b"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0511%2F99689e37j00sdb7l20021d000hs00lzg.jpg&thumbnail=660x2147483647&quality=80&type=jpg"),
        };

        public_transfer(my_nft, sender(ctx))

    }



    public entry fun mint(name:String,url:String,ctx:&mut TxContext){
        let my_nft = NFT{
            id:object::new(ctx),
            name,
            image_url:url
        };

        public_transfer(my_nft, sender(ctx))
    }

}

