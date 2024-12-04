module task2::fauetcoin {
    use std::option;
    use sui::transfer;
    use sui::tx_context::{TxContext};
    use sui::coin::{Self, Coin, TreasuryCap};

    // SUI410COIN要大写，不然报错
    struct FAUETCOIN has drop {}

    fun init(witness: FAUETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"FAUETCOIN", b"FAUETCOIN1", b"build coin", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        #[allow(lint(share_owned))]
        transfer::public_share_object(treasury); 
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<FAUETCOIN>, amount:u64, recipient:address, ctx: &mut TxContext) {
        // let coinObject = coin::mint(treasury_cap, amount, ctx);
        // transfer::public_transfer(coinObject, recipient);
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<FAUETCOIN>, coin: Coin<FAUETCOIN>, _ctx: &mut TxContext) {
        coin::burn(treasury_cap, coin);
    }
}