/// Module: coin_naux
module coin_naux::my_faucet_token {
  use sui::coin::{Self, TreasuryCap, Coin};
  use sui::url::{Self, Url};

  public struct MY_FAUCET_TOKEN has drop {}  

  #[allow(lint(share_owned))]
  fun init(witness: MY_FAUCET_TOKEN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(witness, 6, b"NauxFaucet", b"Naux Faucet Coin", b"This is a faucet token issued by naux", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/13010589")), ctx);
    // all the token information is stored in the metadata, so we must freeze it to prevent any changes
    transfer::public_freeze_object(metadata);
    // to make all user can mint and burn, we share the treasury_cap
    transfer::public_share_object(treasury)
  }

   public fun mint_and_transfer(treasury_cap: &mut TreasuryCap<MY_FAUCET_TOKEN>, amount: u64, recipient: address, ctx: &mut TxContext) {
      coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
   }

   public fun burn(treasury_cap: &mut TreasuryCap<MY_FAUCET_TOKEN>, coin: Coin<MY_FAUCET_TOKEN>) {
      coin::burn(treasury_cap, coin);
   }
}