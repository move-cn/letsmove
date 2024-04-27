/// Module: task2
module task2::liushuyu6666_faucet {
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::url::{Url, Self};

    public struct LIUSHUYU6666_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: LIUSHUYU6666_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"LSYFAUCET",
            b"LIUSHUYU6666_FAUCET",
            b"faucet from liushuyu6666",
            option::some<Url>(
                url::new_unsafe_from_bytes(b"https://static.wikia.nocookie.net/civilization/images/f/ff/Gilgamesh_%28Civ6%29.png/revision/latest?cb=20200930124313")
            ), 
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury)
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<LIUSHUYU6666_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<LIUSHUYU6666_FAUCET>, coin: Coin<LIUSHUYU6666_FAUCET>) {
        coin::burn(treasury_cap, coin);
    }
}

