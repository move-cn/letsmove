/*
/// Module: faucetcoin
module faucetcoin::faucetcoin;
*/
module faucetcoin::djytwy {
    use sui::coin;
    use sui::url;

    public struct DJYTWY has drop {}

    fun init (witness: DJYTWY, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness, 
            6, 
            b"FTWY", 
            b"FaucetDJYTWY", 
            b"lets move task2 faucet token",
            option::some(url::new_unsafe_from_bytes(b"https://s2.coinmarketcap.com/static/img/coins/64x64/28933.png")),
            ctx
        );
        transfer::public_freeze_object(metaData);
        transfer::public_share_object(treasury)
    }

    public entry fun mint (
        treasury: &mut coin::TreasuryCap<DJYTWY>, 
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }
}