/**
*/
module hello_nft::windynanzi_nft {
  use std::string::{ String, utf8 };
  use sui::package;
  use sui::display;
  use sui::table::{ Self, Table };
  use sui::event;

  // 最大供应量为10
  const MAX_SUPPLY: u64 = 10;
  // 当尝试创建超过 MAX_SUPPLY 数量的 Github NFT 时，将触发此错误代码。这个常量用于确保合约不会违反供应限制规则。
  const ENotEnoughSupply:u64 = 0;
  // 当某个用户尝试多次 mint Github NFT 时，将触发此错误代码。这个常量用于确保你的 NFT 不会被某个用户大量拥有，一个地址只能 mint 一次。
  const EDontMintAgain:u64 = 1;

  public struct WINDYNANZI_NFT has drop {}

  public struct Windynanzi_NFT has key, store {
    id: UID,
    nft_id: u64, // 表示铸造 NFT 的编号,表示这是铸造的第几个NFT。
    name: String, // 表示铸造 NFT 的名称
    image_url: String,
    creator: address, // 表示铸造 NFT 的地址
    recipient: address, // 表示接收 NFT 的地址
  }

  // MintRecord 结构体用于记录 NFT 铸造的地址和编号的映射
  public struct MintRecord has key {
    id: UID,
    record: Table<address, u64>, //用来维护用户铸造NFT的映射。
  }

  // NFTMinted 结构体用于发送用户铸造 NFT 事件时需要传递给链下的数据
  public struct NFTMinted has copy, drop {
    id: ID, // 记录铸造 NFT GithubNFT的 UID
    creator: address, // 记录铸造 NFT 的地址
    name: String, // 记录铸造 NFT 的名称
  }

  fun init(otw: WINDYNANZI_NFT, ctx: &mut TxContext) {

    // 该方法返回一个 Publisher 对象，代表发布者权限来防止恶意合约和资源滥用，这里需要 OTW 设计模式来提供支持
    let publisher = package::claim(otw, ctx);

    // 在 Sui Move 中，Display 标准可以将链下展示内容进行链上管理，可以用来定义每个 NFT 对象展示的关键元数据（例如名称、描述、图片URL）
    // 先创建第一个字符串数组 fields , 用来创建需要展示的 NFT 的元数据的 key 值，因为可能需要用到中文字符
    let keys = vector[
      utf8(b"name"),
      utf8(b"description"),
      utf8(b"image_url"),
      utf8(b"creator"),
    ];

    // 其中类似utf8(b”{name}”)的模版语法表示需要我们mint NFT时传递，通过链上节点识别展示
    let values = vector[
      utf8(b"{name} #{nft_id}"),
      utf8(b"A NFT for your Github avatar"),
      utf8(b"{image_url}"),
      utf8(b"{creator}"),
    ];

    // table 模块是一个用来实现键值对存储的数据结构，它类似于传统编程语言中的哈希表或字典
    let mint_record = MintRecord {
      id: object::new(ctx),
      record: table::new<address, u64>(ctx),
    };

    // 创建 Display 对象时需要传递对应的泛型
    let mut display = display::new_with_fields<Windynanzi_NFT>(
      &publisher, 
      keys,
      values, 
      ctx
    );

    // 设置 Display 的版本号
    display::update_version(&mut display);

    // transfer 适用于没有 store ability 的对象，只能在定义它的模块内转移所有权，而 public_transfer 则只能用于拥有 store ability 的对象，可以在模块内外转移所有权
    transfer::public_transfer(publisher, ctx.sender());
    transfer::public_transfer(display, ctx.sender());
    // MintRecord 对象需要共享所有权，因为所有用户都可以在 mint NFT 时修改 MintRecord 对象
    transfer::share_object(mint_record);
  }

  public entry fun mint(
    mint_record: &mut MintRecord, 
    name: String,
    image_url: String, 
    recipient: address, 
    ctx: &mut TxContext
  ) {
    // 使用 table 模块的 contains 方法判断 mint_record 中的 record 映射是否已经有了传递进来的 recipient 这个地址，如果没有的话，执行 EDontMintAgain 错误码。
    assert!(!table::contains(&mint_record.record, recipient), EDontMintAgain);
    // 通过 table::length 方法自增 1 的方式设置 NFT 的 id 编号
    let nft_id:u64 = table::length(&mint_record.record) + 1;
    // 判断下编号是否超过我们之前章节中设置的最大供应常量 MAX_SUPPLY ,如果超过了，需要执行 ENotEnoughSupply 错误码
    assert!(nft_id <= MAX_SUPPLY, ENotEnoughSupply);
    // 当前铸造 NFT 的所有者和 NFT id 编号的关系
    table::add(&mut mint_record.record, recipient, nft_id);


    // 铸造 nft
    let nft = Windynanzi_NFT {
      id: object::new(ctx),
      nft_id, 
      name,
      image_url,
      creator: ctx.sender(),
      recipient,
    };


    // 发送事件通知
    event::emit(NFTMinted {
      id: object::id(&nft),
      creator: ctx.sender(),
      name: nft.name,
    });

    // 将铸造的 NFT 转移给recipient
    transfer::public_transfer(nft, recipient);
  }

  // 实现燃烧功能
  // 用户想要 burn 自己拥有的 NFT 时，我们需要将记录 NFT 编号和地址的映射 table 中的数据删除
  public entry fun burn(mint_record: &mut MintRecord, nft: Windynanzi_NFT) {
    table::remove(&mut mint_record.record, nft.recipient);
    let Windynanzi_NFT { id, nft_id: _, name: _, image_url: _, creator: _, recipient: _,  } = nft;
    object::delete(id);
  }
}

// mint 函数调用，铸造NTF给指定的接收者，3个地址分别为
// PackageID
// 共享对象 MontRecord 对象地址
// 接收者地址
// sui client call --package 0x9d41f76683a517e518c72e28146cd00b51e6ad09788ebcde6aa524009208f317 --module windynanzi_nft  --function mint --args  0xd211072d6211e1ed78933ca8091633c7841e8c7ddf03487c636f42788f606177 "windynanzi_ntf" "https://avatars.githubusercontent.com/u/39194294?v=4" 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2