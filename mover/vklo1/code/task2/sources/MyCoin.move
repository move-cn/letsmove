module VKLO1::VKLO1 {
    use std::option;
    use sui::coin::{Self,Coin};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self,Supply};
    use sui::object;


    public struct VKLO1 has drop {}

    public struct SupplyHold has store , key{
        id:object::UID,
        supply:Supply<VKLO1>
    }
    public fun mint(sup: &mut SupplyHold, amount: u64, ctx: &mut TxContext):Coin<VKLO1>{
        let coinbalance=balance::increase_supply(&mut sup.supply,amount);
        coin::from_balance(coinbalance,ctx)
    }

    fun init(witness: VKLO1, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 6, b"VKLO1", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        let supply=coin::treasury_into_supply(treasury);
        let supply_hold=SupplyHold{
            id:object::new(ctx),
            supply
        };

        transfer::transfer(supply_hold, tx_context::sender(ctx))
    }

    public entry fun mint_to(sup: &mut SupplyHold, amount: u64, to: address, ctx: &mut TxContext){
        let mycoin=mint(sup,amount,ctx);
        transfer::public_transfer(mycoin,to);
    }
}
