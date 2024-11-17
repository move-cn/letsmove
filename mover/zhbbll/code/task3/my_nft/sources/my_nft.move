module my_nft::nft {
    use std::string;
    use std::string::String;
    use sui::transfer::transfer;
    use sui::tx_context::sender;

    public struct NFT has key{
        id: UID,
        name: String,
        image_url: String,
    }
    fun init(ctx: &mut TxContext){
        let nft = NFT{
            id:object::new(ctx),
            name:string::utf8(b"zhbbll NFT"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/117818070?v=4"),
        };
        transfer(nft, sender(ctx));
    }
    public entry fun mint_nft(url: String, ctx: &mut TxContext){
        let my_nft = NFT{
            id:object::new(ctx),
            name:string::utf8(b"zhbbll NFT"),
            image_url: url,
        };
        transfer(my_nft, sender(ctx));
    }
    public entry fun transfer_nft(nft: NFT, to: address){
        transfer(nft, to);
    }
}
