module github_nft::github_nft {
	use std::string::{String, utf8};
    use sui::package;
    use sui::display;
    use sui::table::{Self, Table};
    use sui::event;
    
    public struct GITHUB_NFT has drop{}

    public struct GithubNFT has key, store {
    id: UID, //NFT 对象的唯一标识符
//UID（唯一标识符）是一个通用的标识符，用于唯一标识区块链上的对象
//它确保每个 GithubNFT 实例在区块链上都是唯一的，不会与其他对象混

    nft_id: u64, //铸造 NFT 的编号,表示这是铸造的第几个NFT
    name: String, 
    image_url: String,
    creator: address,
    recipient: address,
}

    //记录 NFT 铸造的地址和编号的映射
    public struct MintRecord has key {
    id: UID,
    record: Table<address, u64>,
}

   //发送用户铸造 NFT 事件时需要传递给链下的数据
   public struct NFTMinted has copy, drop {
    object_id: ID,
    creator: address,
    name: String,
}
    
    //定义在任意时间点，系统中允许存在的最大 NFT 数量。限制了最多只能存在 10 个  NFT
    const MAX_SUPPLY: u64 = 10;
    //当尝试创建超过 MAX_SUPPLY 数量的 NFT 时，将触发此错误代码。这个常量用于确保合约不会违反供应限制规则。
    const ENotEnoughSupply: u64 = 0;
    //当某个用户尝试多次 mint NFT 时，将触发此错误代码。这个常量用于确保你的 NFT 不会被某个用户大量拥有，一个地址只能 mint 一次。
    const EDontMintAgain: u64 = 1;


    //获取发布权限
    fun init(otw:GITHUB_NFT,ctx: &mut TxContext){
       
       //Display 标准可以将链下展示内容进行链上管理
       //定义每个 NFT 对象展示的关键元数据（例如名称、描述、图片URL）
       let keys = vector[
        utf8(b"name"),
        utf8(b"dsecription"),
        utf8(b"image_url"),
        utf8(b"creator"),
       ];

       let values = vector[
         utf8(b"GINAYY NFT #{nft_id}"),
         utf8(b"a nft for GINAYY Github avatar"),
         utf8(b"https://avatars.githubusercontent.com/u/111634195?s=400&u=09891269f1901b3d3b25701ccf92dca9cc2165c4&v=4"),
         utf8(b"GINAYY"),
       ];
        
        
       //追踪记录用户 mint NFT 的情况
       //创建 MintRecord 对象 mint_record ，传入 id 值 object::new(ctx)，
       //和 record 值 table::new<address, u64>(ctx)
       let mint_record = MintRecord{
        id:object::new(ctx),
        record:table::new<address,u64>(ctx),
       };

        //调用方法，参数
       let publisher = package::claim(otw, ctx);

       //Display 对象所需要的键值对字符串 vector 创建完成后，直接调用 display::new_with_fields 方法创建Display对象
       let mut display = display::new_with_fields<GithubNFT>(&publisher,keys,values,ctx);

       
       //共享对象是使用 share_object 或者 public_share_object 函数的对象，
       //它属于所有人，所有人都可以访问、修改、删除和转移它
       transfer::share_object(mint_record);

       //需要修改 display 的内容，我们需要传递 display 对象的可变引用 &mut display
       //出版书籍时候标这是第几版  s对象版本号
       display::update_version(&mut display); 

       //转移所有权
       //将 Publisher 和 Display 对象转移给合约发布地址，
       //而 MintRecord 对象需要共享所有权，因为所有用户都可以在 mint NFT 时修改 MintRecord 对象
       //共享对象就像将房子作为共享财产，允许多个合法所有者共同使用
       transfer::public_transfer(publisher, ctx.sender());
       transfer::public_transfer(display, ctx.sender());

    }

    public entry fun mint(mint_record:&mut MintRecord, name:String, image_url:String, recipient:address, ctx:&mut TxContext){
        //断言 assert!(<bool expression>, <code>)
        //限制用户铸造次数
        //使用 table 模块的 contains 方法判断 mint_record 中的 record 映射是否已经有了传递进来的 recipient 这个地址，
        //如果没有的话，执行 EDontMintAgain 错误码
        assert!(!table::contains(&mint_record.record,recipient),EDontMintAgain);

        //自增 1 的方式设置 NFT 的 id 编号
        let nft_id:u64 = table::length(&mint_record.record)+1;
 
        //将生成的 NFT id 编号传入 MintRecord 中的映射，
        //表示当前铸造 NFT 的所有者和 NFT id 编号的关系
        table::add(&mut mint_record.record,recipient,nft_id);

        //限制nft不超过最大供应，如果超过了，需要执行 ENotEnoughSupply 错误码
        assert!(nft_id <= MAX_SUPPLY,ENotEnoughSupply);


        let nft = GithubNFT{
            id:object::new(ctx),
            nft_id,
            name,
            image_url,
            creator:ctx.sender(),
            recipient,
        };

        event::emit(NFTMinted{
            object_id:object::id(&nft),
            creator:ctx.sender(),
            name:nft.name,
        });

        transfer::public_transfer(nft,recipient);
    }


    public entry fun burn(mint_record:&mut MintRecord,nft:GithubNFT){
        table::remove(&mut mint_record.record,nft.recipient);
        let GithubNFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _, } = nft;
        object::delete(id);
    }    
}
