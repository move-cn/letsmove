/// Module: github_nft
module github_nft::github_nft {
    use std::string::{String, utf8};
    use sui::display;
    use sui::event;
    use sui::package;
    use sui::table::{Self, Table};

    // 描述：定义在任意时间点，系统中允许存在的最大 Github NFT 数量。这个常量确保了 Github NFT 的稀缺性，限制了最多只能存在 10 个 Github NFT。
    const MAX_SUPPLY: u64 = 10;
    // 描述：当尝试创建超过 MAX_SUPPLY 数量的 Github NFT 时，将触发此错误代码。这个常量用于确保合约不会违反供应限制规则。
    const ENotEnoughSupply: u64 = 0;
    // 描述：当某个用户尝试多次 mint Github NFT 时，将触发此错误代码。这个常量用于确保你的 NFT 不会被某个用户大量拥有，一个地址只能 mint 一次。
    const EDontMintAgain: u64 = 1;

    public struct GithubNFT has key, store {
        // UID（唯一标识符）是一个通用的标识符，用于唯一标识区块链上的对象。它确保每个 GithubNFT 实例在区块链上都是唯一的，不会与其他对象混淆。
        id: UID,
        // 表示铸造 NFT 的编号,表示这是铸造的第几个NFT。
        nft_id: u64,
        name: String,
        image_url: String,
        // 表示铸造 NFT 的地址。
        creator: address,
        // 表示接收 NFT 的地址。
        recipient: address,
    }
    // MintRecord 结构体用于记录 NFT 铸造的地址和编号的映射。
    public struct MintRecord has key {
        //  UID（唯一标识符）是一个通用的标识符，用于唯一标识区块链上的对象。它确保每个 GithubNFT 实例在区块链上都是唯一的，不会与其他对象混淆。
        id: UID,
        // 用来维护用户铸造NFT的映射。
        // Table 是一种映射集合，其中所有键值对的类型必须一致。它将铸造用户的地址（address）映射到铸造的NFT编号（u64）。
        // 既可以用来检查地址是否 mint，也可以通过其length 方法检查 mint 次数。
        record: Table<address, u64>,
    }
    // NFTMinted 结构体用于发送用户铸造 NFT 事件时需要传递给链下的数据。
    public struct NFTMinted has copy, drop {
        // 记录铸造 NFT GithubNFT的 UID。
        // UID（唯一标识符）是一个通用的标识符，用于唯一标识区块链上的对象。它确保每个 GithubNFT 实例在区块链上都是唯一的，不会与其他对象混淆。
        object_id: ID,
        // 记录铸造 NFT 的地址。
        creator: address,
        // 记录铸造 NFT 的名称。
        name: String,
    }

    public struct GITHUB_NFT has drop {}

    fun init(otw:GITHUB_NFT, ctx: &mut TxContext) {

        // 创建需要展示的 NFT 的元数据的 key 值，因为可能需要用到中文字符，我们使用 String 模块的 utf8 方法来创建key值字符串：
        // 其中创建的字段分别为 NFT 的名称，描述，图片链接和创造者。
        let keys = vector[
            utf8(b"name"),
            utf8(b"description"),
            utf8(b"image_url"),
            utf8(b"creator"),

        ];
        // 其中类似utf8(b”{name}”)的模版语法表示需要我们mint NFT时传递，通过链上节点识别展示。
        let values = vector[
            utf8(b"{name} #{nft_id}"),
            utf8(b"A NFT for your Github avatar"),
            utf8(b"{image_url}"),
            utf8(b"{creator}"),
        ];

        // 初始化一个 MintRecord 对象，用来追踪记录用户 mint NFT 的情况。
        let mint_record = MintRecord {
            id: object::new(ctx),
            record: table::new<address, u64>(ctx)
        };

        transfer::share_object(mint_record);


        // 获取 Publisher ，通过 package::claim 方法获取即可。
        // 通过 claim 方法获取 Publisher 对象，需要传递 otw 和 ctx 两个参数。
        // OTW: 单次见证，类似于演唱会的单次入场券，用于确保某个操作只能合法执行一次，防止重复和非法操作。
        // TxContext：交易上下文对象，可以简单理解为类似以太坊中 msg 对象，提供了许多交易相关的属性，例如 ctx.sender() 表示合约的调用者。
        let publisher = package::claim(otw,ctx);

        // display::new_with_fields 方法用于创建一个新的展示对象，需要传递 Publisher 对象，key 值，value 值和 ctx 三个参数。
        let mut display = display::new_with_fields<GithubNFT>(&publisher, keys, values, ctx);

        // 通过 display::new_with_fields 创建了 Display 对象后，还需要设置 Display 的版本号，
        // 通过调用 display::update_version(&mut display) 来实现，因为这里需要修改 display 的内容，
        // 需要传递 display 对象的可变引用 &mut display。
        // 可以理解为作家写书后出版时也需要在书的封面或扉页标明目前是这本书的第几版^-^
        display::update_version(&mut display);

        // 转移 Display 对象的所有权，通过 display::public_transfer 方法实现，需要传递 publisher 和 ctx.sender() 两个参数。
        // 第一个参数表示需要转移的 Display 对象，第二个参数表示接收 Display 对象的地址。
        transfer::public_transfer(publisher, ctx.sender());
        transfer::public_transfer(display, ctx.sender());
    }
    // 定义一个名为 mint 的公开函数，该函数需要知道被铸造 NFT 的 name， image_url 和 recipient,
    // 以及 MintRecord 对象和 TxContext交易上下文对象 。因此我们定义五个参数分别为
    // 1.&mut MintRecord 类型的变量 mint_record
    // 2. String 类型的变量 name
    // 3. String 类型的变量 image_url
    // 4. address 类型的变量 recipient
    // 5. mut TxContext 类型的变量 ctx
    public entry fun mint(mint_record: &mut MintRecord, name: String, image_url: String, recipient: address, ctx: &mut TxContext) {
        // 使用 table 模块的 contains 方法判断 mint_record 中的 record 映射是否已经有了传递进来的 recipient 这个地址，
        // 如果没有的话，执行 EDontMintAgain 错误码。
        assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);

        // 定义一下铸造的NFT的id编号
        // 通过 table::length 方法自增 1 的方式设置 NFT 的 id 编号
        let nft_id: u64 = table::length(&mint_record.record) + 1;

        // 使用断言 assert!，判断下编号 nft_id 是否小于等于（<=）最大供应常量 MAX_SUPPLY ，
        // 如果大于超过了，需要执行 ENotEnoughSupply 错误码。
        assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);

        // 使用 table::add 函数将生成的 NFT id 编号（nft_id）传入 MintRecord 中的映射（&mut mint_record.record），
        // 表示当前铸造 NFT 的所有者（recipient）和 NFT id 编号（nft_id）的关系。
        table::add(&mut mint_record.record, recipient, nft_id);

        // 铸造 Github NFT
        // 其中 id 字段传递 object::new(ctx) 方法，保证 NFT 铸造的唯一性，creator 字段传递 ctx.sender() 明确 NFT 的创造者。
        let nft = GithubNFT {
            id: object::new(ctx),
            nft_id,
            name,
            image_url,
            creator: ctx.sender(),
            recipient,
        };

        // 我们在之前定义了 NFTMinted 结构体，event 模块的emit 方法接受一些信息用来追踪链上行为。
        //
        event::emit(NFTMinted {
            object_id: object::id(&nft),
            creator: ctx.sender(),
            name: nft.name
        });

        // 铸造了 Github NFT，最后我们需要将铸造的 NFT 转移给recipient 。
        transfer::public_transfer(nft, recipient);
    }

    public entry fun burn(mint_record: &mut MintRecord, nft: GithubNFT) {
        table::remove(&mut mint_record.record, nft.recipient);
        let GithubNFT {id, nft_id: _, name: _, image_url: _, creator: _, recipient: _} = nft;
        object::delete(id);
    }
}
