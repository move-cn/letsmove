/*
/// Module: mynft
module mynft::mynft {

}
*/
module mynft::zzf222nft{
    use std::string;
    use sui::tx_context::{Self,TxContext};
    use sui::url::{Self,Url};
    use sui::transfer;
    use sui::object;
//铸造Zzfnft这样的对象
    public struct Zzfnft has key,store{
        id:UID,name:string::String,description:string::String,url:url::Url
    }
//获取nft的名字：
    public fun name(nft:&Zzfnft):&string::String{
        &nft.name
    }
//获取nft的描述：
    public fun description(nft:&Zzfnft):&string::String{
        &nft.description
    }
//获取nft的链接：
    public fun url(nft:&Zzfnft):&url::Url{
        &nft.url
    }
//更新nft:
    public entry fun rename(nft:&mut Zzfnft,name:vector<u8>,description:vector<u8>){
        nft.name=string::utf8(name);
        nft.description=string::utf8(description);
    }
//铸造nft给自己：
    public entry fun mint(name:vector<u8>,description:vector<u8>,url:vector<u8>,ctx:&mut TxContext){
        let nft=Zzfnft{id:object::new(ctx),name:string::utf8(name),
        description:string::utf8(description),url:url::new_unsafe_from_bytes(url)};
        transfer::transfer(nft,tx_context::sender(ctx));
    }
//转移nft:
    public entry fun transfer(nft:Zzfnft,recipient:address){
        transfer::transfer(nft,recipient);
    }
//删除nft:
    public entry fun burn(nft:Zzfnft){
        let Zzfnft{id,name:_,description:_,url:_}=nft;
        object::delete(id);
    }

}