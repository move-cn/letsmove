/*
/// Module: mycoin
*/

module mycoin::djytwy {
    use sui::coin;
    use sui::url;

    public struct DJYTWY has drop {}

    fun init (witness: DJYTWY, ctx: &mut TxContext) {
        let (treasury, metaData) = coin::create_currency(
            witness, 
            9, 
            b"TWY", 
            b"DJYTWY", 
            b"lets move task2 my token",
            option::some(url::new_unsafe_from_bytes(b"https://ambrus-asset.s3.amazonaws.com/official_website/USDC.png")),
            ctx
        );
        transfer::public_freeze_object(metaData);
        transfer::public_transfer(treasury, ctx.sender())
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
