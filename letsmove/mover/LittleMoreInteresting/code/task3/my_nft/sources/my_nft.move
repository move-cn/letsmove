/*
/// Module: my_nft
module my_nft::my_nft {

}
*/
module my_nft::my_nft {

    use std::string::String;
    use std::string;
    use sui::object;
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;

    public struct LittleMoreInterestingNFT has key, store{
        id:UID,
        name:String,
        image_url:String,
    }

    fun init(ctx:&mut TxContext) {
        let my_nft = LittleMoreInterestingNFT{
            id:object::new(ctx),
            name:string::utf8(b"LittleMoreInteresting NFT"),
            image_url:string::utf8(b"https://avatars.githubusercontent.com/u/12570729?v=4")
        };
        public_transfer(my_nft,sender(ctx))
    }

    public entry fun mint_and_transfer(to:address,ctx:&mut TxContext) {
        let my_nft = LittleMoreInterestingNFT{
            id:object::new(ctx),
            name:string::utf8(b"LittleMoreInteresting NFT"),
            image_url:string::utf8(b"https://avatars.githubusercontent.com/u/12570729?v=4")
        };
        public_transfer(my_nft,to)
    }
}
