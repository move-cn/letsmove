#[test_only]
module task2::supply_coin_test {
    use sui::balance;
    use sui::balance::Supply;
    use sui::tx_context::{TxContext, sender};
    use sui::coin;
    use sui::coin::Coin;
    use sui::transfer::{public_freeze_object, share_object, public_transfer};
    use sui::url::Url;

    public struct SUPPLY_COIN has drop {}

    public struct SupplyHold<phantom T> has key {
        id: UID,
        supply:Supply<T>
    }

    fun init(witness: SUPPLY_COIN, ctx: &mut TxContext) {

        let icon_url = option::none<Url>();

        let  (treasury_cap,coin_meta_data) =  coin::create_currency(witness, 6,b"EAS",b"EAS币",b"this is a EAS SUPPLY_COIN",icon_url, ctx);

        // 所有权共享  不可变共享
        public_freeze_object(coin_meta_data);

        let supply = coin::treasury_into_supply(treasury_cap);

        let supply_hold = SupplyHold {
            id: object::new(ctx),
            supply
        };

        share_object(supply_hold);
    }


    public fun mint(supply_hold: &mut SupplyHold<SUPPLY_COIN>, amt: u64, ctx: &mut TxContext):Coin<SUPPLY_COIN> {
        let call_address = sender(ctx);

        if (amt < 1000) abort 0;

        let supply_balance = balance::increase_supply(&mut supply_hold.supply, amt);

        let supply_coin = coin::from_balance(supply_balance, ctx);

        supply_coin
    }

    public entry fun mint_and_transfer(supply_hold: &mut SupplyHold<SUPPLY_COIN>, amt: u64, to: address, ctx: &mut TxContext) {
        let supply_coin = mint(supply_hold, amt, ctx);
        public_transfer(supply_coin, to);
    }
}