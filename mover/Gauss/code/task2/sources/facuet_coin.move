module task2::SHALLWEKISSFOREVERFAUCETCOIN {

  use sui::coin::{Self, TreasuryCap};

  public struct SHALLWEKISSFOREVERFAUCETCOIN has drop {}

  fun init(witness: SHALLWEKISSFOREVERFAUCETCOIN, ctx: &mut TxContext) {

    let (treasuryCap, coinMetadata) = coin::create_currency<SHALLWEKISSFOREVERFAUCETCOIN>(
        witness,
        1,
        b"SWKFFC",           
        b"ShallWeKissForeve Faucet Coin",       
        b"SUI Move task 2 faucet coin", 
        option::none(),
        ctx
    );

    transfer::public_freeze_object(coinMetadata);
    transfer::public_share_object(treasuryCap);

  }

  entry public fun mint(
    treasuryCap: &mut TreasuryCap<SHALLWEKISSFOREVERFAUCETCOIN>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext
  ) {
    let coin = coin::mint(treasuryCap, amount, ctx);
    transfer::public_transfer(coin, recipient);
  }

}