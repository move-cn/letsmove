
/// Module: task2
module task2::kael777_coin {
    use sui::tx_context::{sender};
    use sui::coin::{Self,TreasuryCap,Coin};

    // witness
    public struct KAEL777_COIN has drop {}

    fun init(other:KAEL777_COIN,ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(other,6,
            b"KAEL777",b"Kael777Coin",b"Kael777 Coin is so cool",option::none(),ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<KAEL777_COIN>, 
        amount: u64, recipient: address, ctx: &mut TxContext){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<KAEL777_COIN>, coin: Coin<KAEL777_COIN>){
        coin::burn(treasury_cap,coin);
    }
}

