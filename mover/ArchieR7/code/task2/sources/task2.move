module task2::faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::balance::{Self, Balance};

    public struct FAUCET_COIN has drop {}
    public struct Faucet has key {
        id: UID,
        coin: Balance<FAUCET_COIN>,
    }
    
    fun init(witness: FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<FAUCET_COIN>(
            witness,
            2,
            b"FC",
            b"Faucet Coin",
            b"Faucet Coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        let faucet = Faucet {
            id: object::new(ctx),
            coin: balance::zero(),
        };
        transfer::share_object(faucet);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, amount: u64, faucet: &mut Faucet, ctx: &mut TxContext) {
        let faucet_coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut faucet.coin, coin::into_balance(faucet_coin));   
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCET_COIN>, coin: Coin<FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    public entry fun claim(faucet: &mut Faucet, ctx: &mut TxContext) {
        let faucet_coin = coin::take(&mut faucet.coin, 1, ctx);
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        let witness = FAUCET_COIN {};
        init(witness, ctx);
    }
}


module task2::my_coin {
    use sui::coin::{Self, Coin, TreasuryCap};

    public struct MY_COIN has drop {}

    fun init(witness: MY_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<MY_COIN>(
            witness,
            2,
            b"MC",
            b"My Coin",
            b"My Coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<MY_COIN>, coin: Coin<MY_COIN>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        let witness = MY_COIN {};
        init(witness, ctx);
    }
}