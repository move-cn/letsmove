module task2::jeasonnow_coin {
    use sui::tx_context::{sender};
    use sui::coin::{Self, TreasuryCap, Coin};

    // witness
    public struct JEASONNOW_COIN has drop {} 

    fun init(otw:JEASONNOW_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            8,
            b"JC",
            b"JeasonnowCoin",
            b"Jeasonnow Coin",
            option::none(),
            ctx
        );


        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx))
    }

     /// Manager can mint new coins
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JEASONNOW_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<JEASONNOW_COIN>, coin: Coin<JEASONNOW_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}