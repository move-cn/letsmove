module task2::gzliudan_faucet {
    use sui::coin::{Self, TreasuryCap};

    public struct GZLIUDAN_FAUCET has drop {}

    #[allow(lint(share_owned))]
    fun init(witness: GZLIUDAN_FAUCET, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6,                  // decimals
            b"GZC",             // symbol
            b"gzliuan faucet",  // name
            b"",                // description
            option::none(),     // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
        
    }

    public entry fun mint(treasury: &mut TreasuryCap<GZLIUDAN_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }
}
