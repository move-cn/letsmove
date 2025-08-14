
module task3::task3{
    use std::string;
    use std::string::String;
    use sui::object;
    use sui::object::UID;
    use sui::transfer::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct XddNFT has key{
        id: UID,
        name: String,
        image_url: String,
    }


    fun init(ctx: &mut TxContext) {
        let nft = XddNFT{
            id:object::new(ctx),
            name: string::utf8(b"XDD NFT"),
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/24604365"),
        };
        // 初始化时给自己一个nft
        transfer(nft, ctx.sender() )
    }

    //提供方法给外部调用， 给指定用户发送一个nft
    public entry fun mint(url: String, add: address, ctx: &mut TxContext) {
        let nft = XddNFT{
            id:object::new(ctx),
            name: string::utf8(b"XDD NFT"),
            image_url: url,
        };
        transfer(nft, add)
    }

}



