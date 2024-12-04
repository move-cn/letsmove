module my_nft::my_nft {
    use std::string::{String,utf8};
    
    public struct MY_NFT has key, store {
        id: UID,
        name: String,
        image_url: String,
    }

    fun init(ctx: &mut TxContext) {
        let my_nft = MY_NFT{
            id: object::new(ctx),
            name: utf8(b"Ch1hiro"),
            image_url: utf8(b"https://zhu-yuan.oss-cn-beijing.aliyuncs.com/img/Ch1hiro.jpg"),
        };

        transfer::public_transfer(my_nft,tx_context::sender(ctx))
    }

    public entry fun mint(name:String,image_url:String,recipient: address,ctx: &mut TxContext) {
                let my_nft = MY_NFT{
            id: object::new(ctx),
            name: name,
            image_url: image_url,
        };
        // 这里将铸造好的 my_nft 转移给其他人
        transfer::public_transfer(my_nft, recipient)
    }
}

