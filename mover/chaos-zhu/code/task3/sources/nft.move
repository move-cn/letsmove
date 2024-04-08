module task3::chaosnft {
  use std::ascii::String; // 用于处理ASCII字符串
  use std::string::utf8; // 用于处理UTF-8编码的字符串
  use sui::display; // 显示操作模块
  use sui::object;
  use sui::object::{UID};
  use sui::package; // 包操作模块
  use sui::transfer; // 转移操作模块
  use sui::transfer::public_transfer; // 公共转移函数声明
  use sui::tx_context; // 交易上下文模块
  use sui::tx_context::{TxContext}; // 交易上下文对象声明

  // 对象声明
  struct CHAOSNFT has drop {}

  // NFT结构体声明
  struct NFT has key,store {
    id: UID,
    name: String,
  }

  // 初始化函数
  fun init(otw: CHAOSNFT, ctx: &mut sui::tx_context::TxContext) {
    // 定义键值对
    let keys = vector[
        utf8(b"name"),
        utf8(b"image_url"),
    ];

    let values = vector[
        utf8(b"{name}"), // 使用Github.name属性作为名称
        utf8(b"https://img.zhulijun.club/app/thumb.php?img=/i/2024/04/03/{name}.png"), // 使用name属性生成图片特定URL
    ];

    // 声明发布者
    let publisher = package::claim(otw, ctx);
    // 创建显示对象
    let display = display::new_with_fields<NFT>(&publisher, keys, values, ctx);

    // 更新版本号为1
    display::update_version(&mut display);

    // 将发布者和显示对象转移给发送者
    transfer::public_transfer(publisher, tx_context::sender(ctx));
    transfer::public_transfer(display, tx_context::sender(ctx));
  }

  // 公共入口函数，用于铸造NFT
  public entry fun mint(name: String, recipient: address, ctx: &mut TxContext) {
    // 创建NFT对象
    let nft = NFT{
        id: object::new(ctx),
        name,
    };

    // 将NFT对象转移给接收者
    public_transfer(nft, recipient);
  }
}
