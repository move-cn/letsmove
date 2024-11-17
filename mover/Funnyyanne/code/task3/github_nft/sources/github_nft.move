/// Module: github_nft
module github_nft::github_nft {
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;

    public struct GITHUB_NFT has drop {}

    public struct GithubNFT has key, store {
        id: UID,
        nft_id: u64,
        name: String,
        image_url: String,
        creator: address,
        recipient: address,
    }

    // NFTMinted 用于发送用户铸造 NFT 事件时需要传递给链下的数据
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }

    // MintRecord 记录 NFT 铸造的地址和编号的映射
    public struct MintRecord has key {
        id: UID,
        record: Table<address, u64>,
    }

    const MAX_SUPPLY: u64 = 10;

    const ENotEnoughSupply: u64 = 0;

    const EDontMintAgain: u64 = 1;

    fun init(otw: GITHUB_NFT, ctx: &mut TxContext) {
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

        // 追踪记录用户 mint NFT
        let mint_record = MintRecord {
            id: object::new(ctx),
            record: table::new<address, u64>(ctx),
        };

        //  发布者权限
        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);

        // 没有 store 能力，只能在定义它的模块内转移所有权
        transfer::share_object(mint_record);
        display::update_version(&mut display);
        // 转移权限
        transfer::public_transfer(publisher, ctx.sender());

        transfer::public_transfer(display, ctx.sender());
    }

    public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);

        let nft_id: u64 = table::length(&mint_record.record) + 1;
        table::add(&mut mint_record.record, recipient, nft_id);
        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

        let nft = GithubNFT {
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

        // 将铸造的 NFT 转移给recipient
        transfer::public_transfer(nft, recipient);
    }

    public entry fun burn(mint_record: &mut MintRecord, nft: GithubNFT) {
        table::remove(&mut mint_record.record, nft.recipient);
        let GithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
        object::delete(id);
    }
}
// hash 7uqoaEtv3uStsE4GhcdeRocqkeeQPSS8YdKHF3k4xP8C
// PackageID: 0x09f4f33e7c8894c564ee1bc7f31934cc62aacf92691e5296079df3e5552ac01d
// owner 0x4f7deae55c7bc52393269bf7e9ed4be4709b519bd44e902c746ec9b54011328f
