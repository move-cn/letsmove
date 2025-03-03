
/// Module: yishengyouni_coin
module yishengyouni_coin::yishengyouni_coin;

use sui::coin::create_currency;
use sui::transfer::{public_freeze_object, public_transfer};

// 在 Sui 的 coin 模块协议（即 sui::coin），One-time witness type 用于确保某些操作只能在特定上下文中执行
// 1. 结构体的名称 必须是所在模块名称的大写形式
// 2. 结构体的字段 必须是 drop
// 3. 不能使用 <T> 这样的类型参数
// 4. 只能是空结构体 或 仅包含一个 bool 字段
public struct YISHENGYOUNI_COIN has drop {}

fun init(witness: YISHENGYOUNI_COIN, ctx: &mut TxContext) {

  let (treasury, metadata) = create_currency(witness, 4, b"YISHENGYOUNI", b"YISHENGYOUNI_COIN", b"This is YISHENGYOUNI COIN", option::none(), ctx);
  public_freeze_object(metadata);
  public_transfer(treasury, ctx.sender());

}



// package ID： 0xaee23c549056b6865c8f00d1da90e70e44e14835650374eb25b6b812680075fa


