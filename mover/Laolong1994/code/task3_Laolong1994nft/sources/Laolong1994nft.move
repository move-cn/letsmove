
/// Module: task3
module task3_Laolong1994nft::Laolong1994nft {
    use std::string;
    use std::string::String;
    use sui::object;
    use sui::transfer::transfer;
    use sui::tx_context::sender;



    public struct MyNFT has key {
        id: UID,
        name: String,
        image_url: String,
    }

    fun init(ctx: &mut TxContext) {
        let my_nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(b"Laolong1994"),
            image_url: string::utf8(b"https://q2.itc.cn/images01/20240223/cd0cd2f403d944fea1826a3df2f8d60d.png")
        };

        transfer(my_nft,sender(ctx));
    }

    public entry fun mint(url:String,ctx:&mut TxContext){
        let my_nft = MyNFT{
            id:object::new(ctx),
            name:string::utf8(b"Laolong1994"),
            image_url:url,
        };
        transfer(my_nft,sender(ctx));
    }

}