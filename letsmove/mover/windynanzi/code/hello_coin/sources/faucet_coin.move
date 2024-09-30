module hello_coin::faucet_coin {
  // 代币模块
  use sui::coin::{ Self, Coin, TreasuryCap };
  // 交易上下文
  use sui::tx_context::{ Self, TxContext };
  // 转账模块
  use sui::transfer;
  use sui::object::{ UID };
  use std::ascii::{ Self, String };
  use sui::url;

  // 一次性见证
  public struct FAUCET_COIN has drop {}



  // TreasuryCap 定义中含有 store 能力，即这个权限可以被转让
  public struct TreasuryCapHolder has key {
    id: UID,
    treasury_cap: TreasuryCap<FAUCET_COIN>,
    describe: String,
  }

  // 初始化函数
  fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
    
    // 创建代币
    let (treasury_cap, metadata) = coin::create_currency (
      witness,
      6,
      b"windynanzi",
      b"Windy",
      b"test2",
      option::some(url::new_unsafe(ascii::string(b"https://cdn.icon-icons.com/icons2/1865/PNG/96/dogbaby_119594.png"))),
      ctx
    );
    
    // 冻结 metadata 对象，阻止后续的修改
    transfer::public_freeze_object(metadata); 


    // treasury 是一个特殊的对象，它控制着代币的铸造权限。
    // 将铸币的权限凭证转移到合约部署者
    // public_transfer 这个函数用于将某个资源或代币从一个账户转移到另一个账户
    // 在这里转移的是铸币权限
    // transfer::public_transfer(treasury, tx_context::sender(ctx)); 


    // 接持住这个权限
    let treasury_cap_holder = TreasuryCapHolder {
        id: object::new(ctx),
        treasury_cap,
        describe: ascii::string(b"ablion"),
    };
    // 将这个对象变得所有人都可以访问
    transfer::share_object(treasury_cap_holder);
  }

  // 转移代币
  // 这里将mint函数传入的第一个参数是  &mut TreasuryCapHolder 对象而不是凭证
  public fun mint(treasury_cap_holder: &mut TreasuryCapHolder, amount: u64, recipient: address, ctx: &mut TxContext) {
    // 取出凭证
    let treasury_cap = &mut treasury_cap_holder.treasury_cap;
    // 铸币
    let coin = coin::mint(treasury_cap, amount, ctx);
    // public_transfer 在这将铸造的代币转移给指定的接收者
    transfer::public_transfer(coin, recipient);
  }
}

// 调用指令 ,三个地址参数分别对应着 
// PackageID, 
// Object Changes 中 Created Objects 的 ObjectType 中为 TreasuryCap 的 ObjectID
// 接收者的地址，就是test2中的地址 
// sui client call --package 0xcbc39bb062538a46a514da444c0eec130de005bdf1a7bc15b398ea20fb0fb52b --module my_coin  --function mint_in_my_module --args  0xdb4f64219f708f3222e42b217860ad9b026929176532be6e80ef76ca9d4b11bb  100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2  --gas-budget=100000000 