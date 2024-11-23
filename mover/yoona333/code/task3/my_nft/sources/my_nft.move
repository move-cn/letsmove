module my_nft::display_nft {
    // 引入标准库和 Sui 框架中的模块
    use std::string; // 提供字符串相关功能
    use std::string::{utf8, String}; // 提供 utf8 转换和 String 类型
    use sui::tx_context::{sender}; // 获取交易的发送者
    use sui::package; // 提供对象声明相关功能
    use sui::display; // 提供对象展示功能

    // 定义一个具有 key 和 store 能力的结构体，用于表示 NFT
    public struct MyNFT has key, store {
        id: UID,               // 唯一标识符，标记 NFT 对象
        name: String,          // NFT 的名称
        image_url: String,     // NFT 的图片 URL
    }

    // 定义一个仅具有 drop 能力的空结构体，用于初始化 NFT 展示信息
    public struct DISPLAY_NFT has drop {}

    // 初始化函数，用于设置 NFT 的展示属性
    fun init(otw: DISPLAY_NFT, ctx: &mut TxContext) {
        // 定义展示信息的键（字段名）
        let keys = vector[
            utf8(b"name"),            // 名称字段
            utf8(b"link"),            // 详情链接字段
            utf8(b"image_url"),       // 图片链接字段
            utf8(b"description"),     // 描述字段
            utf8(b"project_url"),     // 项目链接字段
            utf8(b"creator"),         // 创建者字段
        ];

        // 定义展示信息的值（字段内容）
        let values = vector[
            utf8(b"{name}"),          // NFT 的名称占位符
            utf8(b"https://sui-heroes.io/hero/{id}"), // NFT 详情链接
            utf8(b"{image_url}"),     // 图片链接占位符
            utf8(b"A true Hero of the Sui ecosystem!"), // 描述信息
            utf8(b"https://sui-heroes.io"),           // 项目官网
            utf8(b"Unknown Sui Fan"), // 创建者信息
        ];

        // 声明一个包对象，用于发布展示数据
        let publisher = package::claim(otw, ctx); 

        // 创建并初始化展示信息对象
        let mut display = display::new_with_fields<MyNFT>(
            &publisher, keys, values, ctx
        ); 

        // 更新展示对象的版本信息
        display::update_version(&mut display); 

        // 将发布者和展示对象转移到交易发送者名下
        transfer::public_transfer(publisher, sender(ctx)); 
        transfer::public_transfer(display, sender(ctx));   

        // 创建一个 MyNFT 对象，表示 NFT
        let nft = MyNFT {
            id: object::new(ctx), // 创建 NFT 的唯一 ID
            name: string::utf8(b"yoona333 display nft"), // 设置 NFT 名称
            image_url: string::utf8(b"https://avatars.githubusercontent.com/u/167958904?v=4"), // 设置图片 URL
        };

        // 将 NFT 对象转移到交易发送者名下
        transfer::public_transfer(nft, sender(ctx)); 
    }

    // 铸造 NFT 的入口函数
    public entry fun mint(name: String, image_url: String, ctx: &mut TxContext) {
        // 创建新的唯一 ID
        let id = object::new(ctx); 
        // 初始化 MyNFT 对象
        let nft = MyNFT { id, name, image_url }; 
        // 将 NFT 对象转移到交易发送者名下
        transfer::public_transfer(nft, sender(ctx)); 
    }
}
