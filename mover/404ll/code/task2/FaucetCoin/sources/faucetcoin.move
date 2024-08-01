module faucetcoin::FaucetCoin {
    use std::option;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct FAUCETCOIN has drop {}

   fun init( witness:FAUCETCOIN,ctx: &mut TxContext) {
     let (treasury, metadata) = coin::create_currency(witness, 7, b"404ll_FaucetCoin", b"404ll_FaucetCoin", b"FaucetCoin", option::none(), ctx);
      transfer::public_freeze_object(metadata);
      transfer::public_share_object(treasury)
 }
    public entry fun mint_and_transfer(
         treasury: &mut TreasuryCap<FAUCETCOIN>, 
         amount: u64, 
         recipient: address, 
         ctx: &mut TxContext,
         ) {
            let faucet = coin::mint(treasury, amount, ctx);
            transfer::public_transfer(faucet, tx_context::sender(ctx) )

}
}