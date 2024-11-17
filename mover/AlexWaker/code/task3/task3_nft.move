/// Module: github_nft
module task3_nft::alexwaker_nft {
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;

    public struct ALEXWAKER_NFT has drop {}

    public struct AlexwakerNFT has key, store {
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
        record: Table<address, vector<u64>>,
    }

    const MAX_SUPPLY: u64 = 1000; // 最大供应量

    const ENotEnoughSupply: u64 = 0; // 供应量不足时返回的错误码

    const MAX_NFT_PER_WALLET: u64 = 3; // 每个地址最多可以铸造 3 个 NFT

    const EMaxNFTReached: u64 = 2; // 超过最大 NFT 数量时返回的错误码

    fun init(otw: ALEXWAKER_NFT, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];
        let values = vector[
            utf8(b"{name} #{nft_id}"),
            utf8(b"A NFT for AlexWaker's Github avatar"),
            utf8(b"{image_url}"),
            utf8(b"{creator}"),
        ];

        // 追踪记录用户 mint NFT
        let mint_record = MintRecord {
            id: object::new(ctx),
            record: table::new<address, vector<u64>>(ctx),
        };

        //  发布者权限
        let publisher = package::claim(otw, ctx);

        let mut display = display::new_with_fields<AlexwakerNFT>(&publisher, keys, values, ctx);

        // 没有 store 能力，只能在定义它的模块内转移所有权
        transfer::share_object(mint_record);
        display::update_version(&mut display);
        // 转移权限
        transfer::public_transfer(publisher, ctx.sender());

        transfer::public_transfer(display, ctx.sender());
    }

    public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
        let nft_count = if (table::contains(&mint_record.record, recipient)) {
            vector::length(table::borrow(&mint_record.record, recipient))
        } else {
            0
        };
        
        // 检查接收者拥有的 NFT 数量是否达到上限
        assert!(nft_count < MAX_NFT_PER_WALLET, EMaxNFTReached);

        let nft_id = table::length(&mint_record.record) + 1;
        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

        // 更新记录
        if (table::contains(&mint_record.record, recipient)) {
            let recipient_nfts = table::borrow_mut(&mut mint_record.record, recipient);
            vector::push_back(recipient_nfts, nft_id);
        } else {
            let mut recipient_nfts = vector::empty<u64>();
            vector::push_back(&mut recipient_nfts, nft_id);
            table::add(&mut mint_record.record, recipient, recipient_nfts);
        };

        let nft = AlexwakerNFT {
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

    public entry fun burn(mint_record: &mut MintRecord, nft: AlexwakerNFT) {
        let recipient_nfts = table::borrow_mut(&mut mint_record.record, nft.recipient);
        let (exists, index) = vector::index_of(recipient_nfts, &nft.nft_id);
        if (exists) {
            vector::remove(recipient_nfts, index);
        };
        
        // 如果该地址没有 NFT 了，删除记录
        if (vector::is_empty(recipient_nfts)) {
            table::remove(&mut mint_record.record, nft.recipient);
        };
        
        let AlexwakerNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _ } = nft;
        object::delete(id);
    }
}
//address: 0x0fa9d9616f097057358f714f1a80078a1360fd1a954cc86426c62ea2a751eafc

// testnet
// mintrecord：0x01817eb1b718a6b95f05f728bbce6ef9fbaff71bb10074a90414c8cf5486f16d
// packageid: 0x89c8778bb3713d027361500ef58f2c63d3ff9060c620b4e60369a8e0f41671b6

//mainnet
// mintrecord: 0xd8f2f918f395f1adc3d790d51d90a236ad0f03765f24225e1707f2711c079313
// packageid: 0x1702e3dcc6a39597e65d5edda6998e02499c29964a77c850c3e2bdb2ab0c1b2e