/*
/// Module: my_nft
module my_nft::my_nft;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module my_nft::display_nft {
    use std::string;
    use std::string::{utf8, String};
    use sui::tx_context::{sender};
    use sui::package;
    use sui::display;

    // 定义 NFT 的结构体
    public struct MyNFT has key, store {
        id: UID,              // 唯一标识符，确保每个 NFT 是独一无二的
        name: String,         // NFT 的名称
        image_url: String,    // NFT 的图片链接
    }

    // 定义用于初始化的结构体
    public struct DISPLAY_NFT has drop {}

    // 初始化函数，设置 NFT 的显示字段
    fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),             // 显示字段：名称
            utf8(b"link"),             // 显示字段：链接
            utf8(b"image_url"),        // 显示字段：图片链接
            utf8(b"description"),      // 显示字段：描述
            utf8(b"project_url"),      // 显示字段：项目链接
            utf8(b"creator"),          // 显示字段：创建者
        ];

        let values = vector[
            utf8(b"{name}"),           // 名称的占位符
            utf8(b"https://sui-heroes.io/hero/{id}"),  // 动态链接
            utf8(b"{image_url}"),      // 图片链接占位符
            utf8(b"A true Hero of the Sui ecosystem!"), // 固定描述
            utf8(b"https://sui-heroes.io"),           // 固定项目链接
            utf8(b"Unknown Sui Fan"), // 默认创建者
        ];

        let publisher = package::claim(otw, ctx); // 声明发布者权限

        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        ); // 创建显示对象，并设置字段

        display::update_version(&mut display); // 更新显示版本

        transfer::public_transfer(publisher, sender(ctx)); // 将发布者对象转移给调用者
        transfer::public_transfer(display, sender(ctx));   // 将显示对象转移给调用者

        let nft = MyNFT {
            id: object::new(ctx), // 创建新的唯一 ID
            name: string::utf8(b"cxl0668nft"), // 默认名称
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/30109256?s=400&v=4"), // 默认自己的github头像
        };

        transfer::public_transfer(nft, sender(ctx)); // 将创建的 NFT 转移给调用者
    }

    // 铸造 NFT 的函数
    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        let id = object::new(ctx); // 创建新的唯一 ID
        let nft = MyNFT { id, name, image_url }; // 构造 NFT
        transfer::public_transfer(nft, sender(ctx)); // 将 NFT 转移给调用者
    }
}
