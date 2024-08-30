/// Module: coin_naux
module coin_naux::my_token {
  use sui::coin::{Self, TreasuryCap};
  use sui::url::{Self,Url};

  public struct MY_TOKEN has drop {}  

  fun init(witness: MY_TOKEN, ctx: &mut TxContext) {
    let (treasury, metadata) = coin::create_currency(witness, 6, b"Naux", b"Naux Coin", b"This is a token issued by naux", option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/13010589")), ctx);
    // all the token information is stored in the metadata, so we must freeze it to prevent any changes
    transfer::public_freeze_object(metadata);
    // treasury is the special object that can mint and burn coins, so we must let only the creator or manager to own it
    transfer::public_transfer(treasury, tx_context::sender(ctx));
  }

   public fun mint_in_my_module(treasury_cap: &mut TreasuryCap<MY_TOKEN>, amount: u64, recipient: address, ctx: &mut TxContext) {
      let coin_minted = coin::mint(treasury_cap, amount, ctx);
      transfer::public_transfer(coin_minted, recipient);
   }
}