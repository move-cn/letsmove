/// Module: task3
module task3::TuYv_NFT {
    use std::string::{utf8, String};
    use sui::package;
    use sui::display;

    //定义一个叫TuYv的结构体包含该类型nft的属性
    public struct TuYv has key, store {
        id: UID,
        name: String
    }

    //OTW 是一个与模块名相同（字母大写）并只含有`drop`的结构体
    //在另一个资料中找到了我的答案
    public struct TUYV_NFT has drop {}

    fun init(otw: TUYV_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url")];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/22782479")];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<TuYv>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    public entry fun mint_to_sender(name: String, ctx: &mut TxContext) {
        let sender = tx_context::sender(ctx);
        let nft = TuYv{
            id: object::new(ctx),
            name,
        };
        transfer::public_transfer(nft, sender);
    }

    public entry fun transfer(nft: TuYv, recipient: address, _: &mut TxContext) {
        transfer::public_transfer(nft, recipient)
    }
}
