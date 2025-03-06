module my_nft::my_nft {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use std::string::{Self, String};
    use sui::tx_context::sender;

    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        image_url: String,
    }

    fun init(ctx: &mut TxContext){
        let my_nft = MyNFT{
            id:object::new(ctx),
            name:string::utf8(b"SINGMIN NFT"),
            description: string::utf8(b"This is a SINGMIN NFT"),
            image_url: string::utf8(b"https://i0.hdslb.com/bfs/archive/62311ed57e6a0c8ca9610684deb4c34607ee7f95.jpg"),
        };
        // 转移所有权
        transfer::public_transfer(my_nft, sender(ctx));
    }

    public fun mint_nft(ctx: &mut TxContext) {
        let my_nft = MyNFT{
            id: object::new(ctx),
            name: string::utf8(b"Z Gundam"),
            description: string::utf8(b"This is a SINMIN NFT"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/74779427?v=4"),
        };
        
        transfer::public_transfer(my_nft, tx_context::sender(ctx));
    }

    public entry fun mint_to(url: String, recipient: address, ctx: &mut TxContext) {
        let my_nft = MyNFT{
            id: object::new(ctx),
            name: string::utf8(b"Z Gundam"),
            description: string::utf8(b"This is a Z Gundam NFT"),
            image_url: url,
        };
        transfer::public_transfer(my_nft, recipient);
    }
}
