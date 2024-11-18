module my_coin::usd;
use std::option::some;
use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};
use sui::url::Url;

public struct USD has drop{}

fun init(usd:USD,ctx: &mut TxContext){
    let url = sui::url::new_unsafe_from_bytes(b"https://bkimg.cdn.bcebos.com/pic/503d269759ee3d6d55fbb529575d7a224f4a21a470b4?x-bce-process=image/format,f_auto/watermark,image_d2F0ZXIvYmFpa2UyNzI,g_7,xp_5,yp_5,P_20/resize,m_lfit,limit_1,h_1080");
    let usd_img = some<Url>(url);
    let (treasury,metadata) = create_currency(usd,8,b"USD",b"USD",b"world currency",usd_img,ctx);
    public_freeze_object(metadata);
    public_transfer(treasury,ctx.sender());
}
