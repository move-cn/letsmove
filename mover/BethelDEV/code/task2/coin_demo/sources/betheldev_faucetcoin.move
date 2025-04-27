module coin_demo::betheldev_faucetcoin {
    use std::option;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::transfer;
    use sui::tx_context;

    public struct BETHELDEV_FAUCETCOIN has drop {}

    fun init(witness: BETHELDEV_FAUCETCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(witness,6,b"BETHELDEV_FAUCETCOIN", b"",b"", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury);
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<BETHELDEV_FAUCETCOIN>, amount: u64, recepient: address , ctx: &mut TxContext) {
        let c = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(c, recepient);
    }
}
