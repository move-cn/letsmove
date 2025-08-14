module my_swap::coin_a {

    use sui::balance::Supply;
    use sui::balance::{Self};
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct COIN_A has drop {}

    fun init(witness: COIN_A, ctx: &mut TxContext){

        let (treasury_cap, metadata) =
            coin::create_currency<COIN_A>(witness, 8, b"ac", b"ACoin", b"new coin name ac", option::none(),ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<COIN_A>, amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<COIN_A>, c: Coin<COIN_A>){
        coin::burn(treasury_cap, c);
    }

}