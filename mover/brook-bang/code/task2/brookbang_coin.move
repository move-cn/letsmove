module task2::brookbang_coin {

    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    struct BROOKBANG_COIN has drop {}

    fun init(witness: BROOKBANG_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"BROOKBANG",
            b"BROOKBANG",
            b"",
            option::none(),
            ctx,
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap,tx_context::sender(ctx));
    }

    public fun mint(treasury_cap: &mut TreasuryCap<BROOKBANG_COIN>, amount: u64,recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }







}