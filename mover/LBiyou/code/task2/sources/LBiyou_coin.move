/// Module: LBiyou_coin
module task2::LBiyou_coin {
    use sui::tx_context::{sender};
    use sui::coin::{Self,TreasuryCap,Coin};

    // witness
    public struct LBIYOU_COIN has drop {}

    fun init(other:LBIYOU_COIN, ctx:&mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency(other,6,
            b"LBIYOU", b"LBIYOUCOIN", b"LBIYOU Coin is so precious", option::none(), ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);

        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<LBIYOU_COIN>, amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<LBIYOU_COIN>, coin: Coin<LBIYOU_COIN>){
        coin::burn(treasury_cap, coin);
    }
}
