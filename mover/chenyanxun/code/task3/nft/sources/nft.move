module nft::nft {
    // 引入依赖
    use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;

    // 最大供应量
    const MAX_SUPPLY: u64 = 10;
    // 超过供应量
    const ENotEnoughSupply: u64 = 0;
    // 重复铸造
    const EDontMintAgain: u64 = 1;

    // 定义结构体，表示nft的各种信息
    public struct GithubNFT has key, store {
        id: UID,
        nft_id: u64,
        name: String,
        image_url: String,
        creator: address,
        recipient: address,
    }
    // 定义铸造记录结构体，记录nft铸造的地址和编号的映射
    public struct MintRecord has key {
        id: UID,
        record: Table<address, u64>,
    }
    // 定义nft铸造结构体，发送用户铸造nft事件时需要传递给链下的数据
    public struct NFTMinted has copy, drop {
        object_id: ID,
        creator: address,
        name: String,
    }
    public struct NFT has drop {}
    // 初始化函数，一次性见证
    fun init(otw: NFT, ctx: &mut TxContext) {
        // 发布者权限
        let publisher = package::claim(otw, ctx);
        // nft元数据key:value
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
        // 初始化MintRecord，追踪铸造记录
        let mint_record = MintRecord {
            id: object::new(ctx),
            record: table::new<address, u64>(ctx),
        };
        // 创建display对象
        let mut display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);
        // 设置display对象版本号
        display::update_version(&mut display);
        // 把publisher和display权限转移给发布合约者
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
        // 共享铸造记录，共享所有权
        transfer::share_object(mint_record);
    }
    // 铸造
    public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);
        // 定义nft的id
        let nft_id: u64 = table::length(&mint_record.record) + 1;

        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);
        // 映射铸造记录
        table::add(&mut mint_record.record, recipient, nft_id);
        // 铸造nft
        let nft = GithubNFT {
            id: object::new(ctx),
            nft_id,
            name,
            image_url,
            creator: ctx.sender(),
            recipient,
        };
        // 铸造记录
        let nft_minted = NFTMinted {
            object_id: object::id(&nft),
            creator: ctx.sender(),
            name,
        };
        // 转移nft
        transfer::public_transfer(nft, recipient);
        // 发送铸造记录
        event::emit(nft_minted);
    }
    // 燃烧nft
    public entry fun burn(mint_record: &mut MintRecord, nft: GithubNFT) {
        table::remove(&mut mint_record.record, nft.recipient);
        let GithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
        object::delete(id);
    }
}

//本地调用合约函数 记得将以下参数地址修改为自己的地址
// export PACKAGE="0xd9c563831cfd7bbd58336da6aba73359b37fedbd24f32ebc5ecc619331f15512"
// export MODULE="github_nft"
// export MINTRECORD="0xca28c8d82f4e401aa47de7ea57ccea32d82287248658024b5f565f66ec018f8b"
// export RECIPIENT="0xaf0e50c4619f5bdbcda69b33807b32088d53c8bcc928e5ee3fb343bb3f37492e"
// sui client call --package 0x9a9b278b08a15d9c7892d91e7625018c1f68ababf3517523c2bd224657d714b0 --module nft --function mint --args 0xd9df44fb63528908b2b29c5943005cb6e5d6548106d72d5140a0789429e1f6d4 "chenyanxun NFT" "https://avatars.githubusercontent.com/u/19866732?v=4" 0x3433e27dbe077c5679e941c8099fadceabf2b05e5e0ee03d573014ecb987b7e1