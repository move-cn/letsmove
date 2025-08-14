module mycoin::LittleMoreInterestingFAUCET {
    use sui::coin::{Self, TreasuryCap, Coin};

    public struct LittleMoreInterestingFAUCET has drop {}

    fun init(witness: LittleMoreInterestingFAUCET, ctx: &mut TxContext) {

        let (treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"LFAUCET",
            b"LittleMoreInterestingFAUCET",
            b"LittleMoreInterestingFAUCET Task 2",
            option::none(),
            ctx
        );

        transfer::public_share_object(treasury);

        transfer::public_freeze_object(metadata);
    }
}