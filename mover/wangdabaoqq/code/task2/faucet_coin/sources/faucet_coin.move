module faucet_coin::faucet_coin {
    use sui::coin::{Self, TreasuryCap };

    public struct FAUCET_COIN has drop {}

    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 8, b"FAUCET_COIN", b"FAUCET_COIN", b"Move coin by FAUCET_COIN", option::none(), ctx);
        transfer::public_share_object(metadata);
        transfer::public_transfer(treasury, ctx.sender())
    }
    
    public entry fun mint(treasury: &mut TreasuryCap<FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
      let minted_coin = coin::mint(treasury, amount, ctx);
      transfer::public_transfer(minted_coin,  recipient);
    }
}