module task2::my_coin {

    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"Muen",
            b"MUSS",
            b"MuyeC s Coin",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);

        transfer::public_transfer(treasury, ctx.sender());
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    public fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(MY_COIN {}, ctx)
    }
}