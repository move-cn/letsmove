/*
/// Module: whn_nft
module whn_nft::whn_nft;
*/
module whn_nft::whn_nft{
    use std::string::{utf8, String};
    use sui::tx_context::{sender};

    public struct WhnNft has key, store{
        id:UID,
        name:String,
        image_url:String,
    }

    fun init(ctx:&mut TxContext){
        let firstNft = WhnNft{
            id: object::new(ctx),
            name:utf8(b"Pebbler"),
            image_url:utf8(b"https://avatars.githubusercontent.com/u/10150276?v=4&size=64"),
        };
        transfer::public_transfer(firstNft, sender(ctx))
    }
    public entry fun mint(addr: address, name:String,image_url:String,ctx: &mut TxContext){
        let id = object::new(ctx);
        let nft = WhnNft{id,name,image_url};
        transfer::public_transfer(nft, addr);
    }
}