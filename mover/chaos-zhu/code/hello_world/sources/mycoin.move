// 导入所需的模块
module task2::chaoscoin {
  use std::option; // 导入标准库中的option模块
  use sui::coin::{Self, TreasuryCap}; // 导入SUI语言中与代币相关的模块
  use sui::transfer; // 导入SUI语言中的转账模块
  use sui::tx_context::{Self, TxContext}; // 导入SUI语言中的交易上下文模块
  use sui::url::{Url, Self}; // 导入SUI语言中的URL模块

  // 定义一个名为MYCOIN的对象，具有drop功能
  struct CHAOSCOIN has drop {}

  // 初始化函数，用于创建代币并分发给调用者
  fun init(waitness: CHAOSCOIN, ctx: &mut sui::tx_context::TxContext) {
      // 创建代币并获取代币信息
      let (treasury_cap, meta) = coin::create_currency(
        waitness,
        0, // 代币总量
        b"CHAOSCOIN", // 代币名称
        b"CHAOSCOIN", // 代币符号
        b"TESTCOIN", // 代币描述
        option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/44160914")),
        ctx
       );
      // 冻结代币
      transfer::public_freeze_object(meta);
      // 转账代币给调用者
      transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
  }

  // 铸造代币并转账给指定地址
  public entry fun mint(treasury_cap: &mut TreasuryCap<CHAOSCOIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
      coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
  }
}
