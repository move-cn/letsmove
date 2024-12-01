
/// Module: my_nft
module my_nft::my_nft {
    use std::string;
    use std::string::String;
    use sui::transfer::public_transfer;
    use sui::tx_context::sender;

    public struct MYNFT has key,store {
        id: UID,
        name: String,
        image_url: String,
    }

    fun init(ctx: &mut TxContext){
        let my_nft = MYNFT{
            id:object::new(ctx),
            name:string::utf8(b"CreatorYuan NFT"),
            image_url:string::utf8(b"https://avatars.githubusercontent.com/u/15226478?v=4"),
        };
        public_transfer(my_nft, sender(ctx));
    }

    public entry fun mint(nft_name:String, url:String,ctx: &mut TxContext){
        let my_nft = MYNFT{
            id:object::new(ctx),
            name:nft_name,
            image_url:url,
        };
        public_transfer(my_nft, sender(ctx));

    }
}
