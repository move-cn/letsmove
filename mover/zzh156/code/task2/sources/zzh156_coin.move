module task2::zzh156_coin{
    use sui::coin::{Self, Coin,TreasuryCap};
    use sui::transfer;
    use sui::tx_context::TxContext;
    // use std::option;
    // use sui::tx_context::{Self, TxContext};
    // use sui::transfer::{Self, transfer};


    public struct ZZH156_COIN has drop{

    }

    fun init(witness: ZZH156_COIN, ctx: &mut TxContext){
        let (treasure_cap, metadata) = coin::create_currency(
            witness,
            7,
            b"zzh156_Coin",
            b"zzh156_Coin",
            b"",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasure_cap, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasure_cap:&mut TreasuryCap<ZZH156_COIN>, amount:u64, ctx: &mut TxContext)
        {
            let coin = coin::mint<ZZH156_COIN>(treasure_cap,amount,ctx);
            transfer::public_transfer(coin,tx_context::sender(ctx));

    }

    public fun burn(
        treasure_cap: &mut TreasuryCap<ZZH156_COIN>, 
        coin: Coin<ZZH156_COIN>
    ) {
        coin::burn(treasure_cap, coin);
    }
}