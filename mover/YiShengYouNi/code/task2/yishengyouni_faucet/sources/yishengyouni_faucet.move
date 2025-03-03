
/// Module: yishengyouni_faucet
module yishengyouni_faucet::yishengyouni_faucet;

use sui::coin::{create_currency,mint, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object,public_share_object};

public struct YISHENGYOUNI_FAUCET has drop {}

fun init(witness: YISHENGYOUNI_FAUCET, ctx: &mut TxContext) {

  let (treasury  , metadata)= create_currency(witness, 6, b"YISHEGNYOUNI FAUCET", b"YISHEGNYOUNI FAUCET", b"my faucet", option::none(), ctx);

  public_freeze_object(metadata);
  public_share_object(treasury);
}

public entry fun claim(treasury_cap: &mut TreasuryCap<YISHENGYOUNI_FAUCET>, amount: u64, ctx: &mut TxContext) {

  let coin = mint(treasury_cap, amount, ctx);

  public_transfer(coin, ctx.sender());
}


// packageId: 0x1932fe99395ddc191b03144fc9d373936d26c15d07195a6796943113cf3147d5