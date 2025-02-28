module my_nft::my_nft;
use sui::transfer::transfer;
use std::string::String;
use sui::tx_context::sender;

public struct MyFT has key{
    id:UID,
    name:String,
    description:String,
    image_url:String,
}

fun init(ctx: &mut TxContext){
    let my_nft = MyNFT{
        id:object::new(ctx)
        name:string:utf8(b"SINGMIN NFT")
        image_url:string::utf8(b"https://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=Z%E9%AB%98%E8%BE%BE&step_word=&lid=12180166205428821376&ie=utf-8&in=&cl=2&lm=-1&st=undefined&hd=undefined&latest=undefined&copyright=undefined&cs=2041544672,1063218789&os=2132991379,290157605&simid=3454569150,242169578&pn=3&rn=1&di=7466852183703552001&ln=1791&fr=&fmq=1740729941560_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&is=0,0&istype=0&ist=&jit=&bdtype=0&spn=0&pi=0&gsm=1e&objurl=https%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farchive%2F62311ed57e6a0c8ca9610684deb4c34607ee7f95.jpg&rpstart=0&rpnum=0&adpicid=0&nojc=undefined&dyTabStr=MCwxMiwzLDEsMiwxMyw3LDYsNSw5")
    };
    transfer(my_nft,sender(ctx));
}
