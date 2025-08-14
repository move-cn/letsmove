
/// Module: my_coin
module my_coin::my_coin {

    use sui::coin::{Self, TreasuryCap, create_currency};

    public struct MY_COIN has drop {}

    public struct TreasuryCapHolder has key {
        id:UID,
        treasury_cap: TreasuryCap<MY_COIN>
    }

    fun init(otw: MY_COIN, ctx: &mut TxContext) {
      
      let (treasury_cap, metadata) = create_currency(
        otw,
        18,
        b"MY COIN",
        b"MY COIN",
        b"This is my first deployed coin on sui",
        option::none(),
        ctx
      );

      transfer::public_transfer(metadata, tx_context::sender(ctx));
      transfer::transfer(
        TreasuryCapHolder {
          id: object::new(ctx),
          treasury_cap
          },
        tx_context::sender(ctx)
      );
    }

    // only owner can mint
    entry fun mint(treasury_cap_holder: &mut TreasuryCapHolder,receiver:address, amount: u64, ctx: &mut TxContext) {
      let treasury_cap = &mut treasury_cap_holder.treasury_cap;
      coin::mint_and_transfer(treasury_cap, amount, receiver, ctx);
    }
}

