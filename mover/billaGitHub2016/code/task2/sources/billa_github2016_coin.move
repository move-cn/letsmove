module task2::billa_github2016_coin {
    use std::ascii::string;
    use sui::coin::{ Self, TreasuryCap };
    use sui::url;

    public struct BILLA_GITHUB2016_COIN has drop {}

    fun init(witness: BILLA_GITHUB2016_COIN, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness,
            9,
            b"BG",
            b"BILLA_GITHUB2016_COIN",
            b"this is a coin minted by billa",
            option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/9780825?v=4"))),
            ctx);
        transfer::public_freeze_object(metaData);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<BILLA_GITHUB2016_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}