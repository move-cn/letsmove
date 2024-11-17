
/// Module: fantasy_move_nft
module fantasy_move_nft::fantasy_move_nft {
    use std::string::{ String, utf8 };
    use sui::package;
    use sui::display;
    use sui::table::{ Self, Table };
    use sui::event;

    // 最大供应量为10
    const MAX_SUPPLY: u64 = 15;
    // 当尝试创建超过 MAX_SUPPLY 数量的nft , 将触发此错误代码。 这个常量用于确保合约不会违法供应限制规则。
    const EOutOfSupply: u64 = 0;
    // 当挪个用户尝试多次 mint nft 时， 触发此错误代码。 确保你的nft只会被一个地址拥有一次。
    const EDumplicatedMint: u64 = 1;

    public struct FANTASY_MOVE_NFT has drop {}

    public struct Fantasy_Move_NFT has key, store{
        id: UID,
        nft_id: u64, // 表示铸造NFT的编号， 第几个
        name: String, // 名称
        image_url: String,
        creator: address, // 表示铸造nft的地址
        recipient: address // 表示接受nft的地址
    }

    public struct MintRecord has key {
        id: UID,
        record: Table<address, u64> // 用来记录用户铸造NFT的映射。
    }

    // NFTMinted 结构体用户发送用户铸造 nft 事件需要传递给连下的数据
    public struct NFTMinted has copy, drop {
        id: ID, // 记录铸造NFT 的UID,
        creator: address,
        name: String
    }

    fun init(otw: FANTASY_MOVE_NFT, ctx: &mut TxContext){
        // 该方法返回一个publisher 对象， 代表发布者权限来防止恶意合约和资源滥用， 这里需要OTW设计模式来提供支持
        let publisher = package::claim(otw, ctx);

        // 在sui move 中，display 标准可以将链下展示内容进行链上管理，可以用来定义每个NFT对象展示的关键元数据(例如名称，描述，图片URL)
        // 先创建第一个字符串数据fields, 用来创建需要展示的 NFT 的元数据的key值， 因为可能需要用到中文字符
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),
        ];

        // 其中类型utf8(b"{name}")的模版语法来表示需要我们mint NFT时传递，通过链上节点识别展示
        let values = vector[
            utf8(b"{name} #{nft_id}"),
            utf8(b"A NFT for your Github avator"),
            utf8(b"{image_url}"),
            utf8(b"{creator}")
        ];

        // table 模版是一个用来实现兼职对存储的数据结构，他类似于传统变成语言中的哈希表或字典
        let mint_record = MintRecord{
            id: object::new(ctx),
            record: table::new<address, u64>(ctx),
        };

        // 创建 Display 对象时需要传递对应的泛型
        let mut display = display::new_with_fields<Fantasy_Move_NFT>(
            &publisher,
            keys,
            values,
            ctx
        );
        // 设置display的版本号
        display::update_version(&mut display);
        // transfer 适用于没有store ability 的对象， 只能定义它的模块内转移所有权，
        // 而public_transfer则只能用于拥有 store ability 的对象，可以在模块内外转移所有权
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
        // MintRecord 对象需要共享所有权，因为所有用户都可以在mint NFT时修改 MintRecord 对象
        transfer::share_object(mint_record);

    }

    public entry fun mint(
        mint_record: &mut MintRecord,
        name: String,
        image_url: String,
        recipient: address,
        ctx: &mut TxContext
    ){
        // 使用table 模块的contains 方法判断mint_record中的record映射是否已经有了传递进来的recipient 这个地址，
        // 如果有的话，执行EDumplicatedMint
        assert!(!table::contains(&mint_record.record, recipient), EDumplicatedMint);
        // 通过 table::length 方法自增 1 的方式设置NFT的id编号
        let nft_id: u64 = table::length(&mint_record.record) + 1;
        // 超过容量就执行错误码
        assert!(nft_id <= MAX_SUPPLY , EOutOfSupply);
        //  新增当前NFT接受者与id的关系
        table::add(&mut mint_record.record, recipient, nft_id);

        // 铸造NFT
        let nft = Fantasy_Move_NFT {
            id: object::new(ctx),
            nft_id,
            name,
            image_url,
            creator: ctx.sender(),
            recipient,
        };

        // 发送事件通知
        event::emit(NFTMinted{
            // id: object::id(&nft),
            id: object::id(&nft),
            creator: ctx.sender(),
            name: nft.name,
        });

        // 将铸造的 NFT转移给recipient
        transfer::public_transfer(nft, recipient);
    }


    // 实现销毁这个nft功能，
    public entry fun burn(mint_record: &mut MintRecord, nft: Fantasy_Move_NFT){
        table::remove(&mut mint_record.record, nft.recipient);
        let Fantasy_Move_NFT{id, nft_id: _, name:_, image_url:_, creator:_, recipient:_} = nft;

        object::delete(id);
    }
}

