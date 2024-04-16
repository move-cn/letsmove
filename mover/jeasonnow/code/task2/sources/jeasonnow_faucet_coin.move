module task2::jeasonnow_faucet_coin {
    use sui::tx_context::{sender};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::event::emit;

    // witness
    public struct JEASONNOW_FAUCET_COIN has drop {} 

    // mint event
    public struct MINT_EVENT has copy, drop {
        amount: u64,
        recipient: address
    }

    fun init(otw:JEASONNOW_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            8,
            b"JFC",
            b"JeasonnowFaucetCoin",
            b"Jeasonnow Faucet Coin",
            option::none(),
            ctx
        );


        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx))
    }

     /// all people can mint new coins
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JEASONNOW_FAUCET_COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
        emit(MINT_EVENT { amount: amount, recipient: recipient });
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<JEASONNOW_FAUCET_COIN>, coin: Coin<JEASONNOW_FAUCET_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}