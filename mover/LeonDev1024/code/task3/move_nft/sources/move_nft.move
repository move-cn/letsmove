module move_nft::leondev1024_nft {
    use std::ascii::String;
    use std::string::utf8;
    use sui::display;
    use sui::object;
    use sui::object::{UID, ID};
    use sui::package;
    use sui::transfer;
    use sui::transfer::public_transfer;
    use sui::tx_context;
    use sui::tx_context::{TxContext};
    use sui::event;

    /// 一个没有实际数据的结构体，用于合约的初始化
    public struct LEONDEV1024_NFT has drop {}

    /// NFT 结构体
    public struct NFT has key, store {
        id: UID,
        name: String,
    }

    /// 事件结构体，用于记录 NFT 被铸造的信息
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
        recipient: address,
    }

    /// 初始化合约
    /// NFT 必须是自己的 GitHub 头像作为图片
    fun init(otw: LEONDEV1024_NFT, ctx: &mut sui::tx_context::TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"image_url"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://avatars.githubusercontent.com/u/16557117?v=4"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<NFT>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    /// 铸造 NFT 并转移到指定的接收者地址
    public entry fun mint_to(name: String, recipient: address, ctx: &mut TxContext) {
        assert!(name.length() > 0, 0x1); // 确保名称不为空

        let nft = NFT {
            id: object::new(ctx),
            name: name, // 直接使用 name
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: ctx.sender(),
            name: nft.name, // 直接使用 name
            recipient,
        });

        public_transfer(nft, recipient);
    }
}