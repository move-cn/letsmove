
/// Module: silver_nft
#[allow(duplicate_alias)]
module silver_nft::silver_nft {
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;
    use sui::object;
    use sui::object::{UID, ID};
    use sui::transfer;
    use sui::tx_context::TxContext;

    // 系统中允许存在的最大 NFT 数量
    const MAX_SUPPLY: u64 = 20;
    // 当尝试创建超过 MAX_SUPPLY 数量的 NFT 时，将触发此错误代码
    const ENotEnoughSupply: u64 = 0;
    // 当某个用户尝试多次 mint NFT 时，将触发此错误代码。这个常量用于确保你的 NFT 不会被某个用户大量拥有，一个地址只能 mint 一次。
    const EDontMintAgain: u64 = 1;

    public struct SILVER_NFT has drop {}

    public struct SilverNft has key, store {
        id: UID,
        nft_id: u64,
        name: String,
        image_url: String,
        creator: address,
        recipient: address,
    }

    // 记录 NFT 铸造的地址和编号的映射
    public struct MintRecord has key {
        id: UID,
        // 用来维护用户铸造NFT的映射
        record: Table<address, u64>,
    }

    // 用于发送用户铸造 NFT 事件时需要传递给链下的数据
    public struct NFTMinted has copy, drop {
        object_id: ID,
        // 记录铸造 NFT 的地址
        creator: address,
        // 记录铸造 NFT 的名称
        name: String,
    }

    fun init(witness: SILVER_NFT, ctx: &mut TxContext) {
        // 获取发布者权限
        let publisher = package::claim(witness, ctx);

        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name} #{nft_id}"),
            utf8(b"A NFT for your Github avatar"),
            utf8(b"{image_url}"),
            utf8(b"{creator}"),
        ];

        // 用来追踪记录用户 mint NFT 的情况
        let mint_record = MintRecord {
            id: object::new(ctx),
            record: table::new<address, u64>(ctx),
        };

        let mut display = display::new_with_fields<SilverNft>(&publisher, keys, values, ctx);
        display::update_version(&mut display);
        // 转移所有权
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
        transfer::share_object(mint_record);
    }

    // 铸造
    public entry fun mint(mint_record: &mut MintRecord, name: String,
                          image_url: String, recipient: address, ctx: &mut TxContext) {
        // 限制用户铸造次数
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);
        // 定义 NFT id 编号
        let nft_id: u64 = table::length(&mint_record.record) + 1;
        // 限制 NFT 不超过最大供应
        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);
        // 铸造记录
        table::add(&mut mint_record.record, recipient, nft_id);

        let nft = SilverNft {
            id: object::new(ctx),
            nft_id,
            name,
            image_url,
            creator: ctx.sender(),
            recipient,
        };

        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: ctx.sender(),
            name: nft.name,
        });

        transfer::public_transfer(nft, recipient);
    }

    // 燃烧
    public entry fun burn(mint_record: &mut MintRecord, nft: SilverNft) {
        // 将记录 NFT 编号和地址的映射 table 中的数据删除
        table::remove(&mut mint_record.record, nft.recipient);
        // 解包 NFT 对象
        let SilverNft { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
        object::delete(id);
    }

}

