module hello_faucet::my_faucet {
  use sui::coin::{Self, TreasuryCap};

  public struct MY_FAUCET has drop {}

  fun init(witness: MY_FAUCET, ctx: &mut TxContext){
    let (treasury_cap, metadata) = coin::create_currency(witness, 6, b"Ni1L", b"Ni1L", b"", option::none(), ctx);
    transfer::public_freeze_object(metadata);
    transfer::public_share_object(treasury_cap)
  }

  public fun mint(treasury_cap: &mut TreasuryCap<MY_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext){
    let coin = coin::mint(treasury_cap, amount, ctx);
    transfer::public_transfer(coin, recipient)
  }
}