module my_swap::coin_b {

    use sui::balance::Supply;
    use sui::balance::{Self};
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct COIN_B has drop {}

    fun init(witness: COIN_B, ctx: &mut TxContext){

        let (treasury_cap, metadata) =
            coin::create_currency<COIN_B>(witness, 8, b"bc", b"BCoin", b"new coin name bc", option::none(),ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<COIN_B>, amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<COIN_B>, c: Coin<COIN_B>){
        coin::burn(treasury_cap, c);
    }

}