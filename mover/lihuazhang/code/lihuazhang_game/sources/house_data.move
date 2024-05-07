/// Module: lihuazhang_game
module lihuazhang_game::house_data {
    use sui::balance::{Balance};
    use sui::coin::{Self, TreasuryCap};
    use sui::package::{Self};
    use lihuazhang_coin::lihuazhang_faucet_coin::{LIHUAZHANG_FAUCET_COIN};

    public struct HouseData has key {
        id: UID,
        balance: Balance<LIHUAZHANG_FAUCET_COIN>, 
        house: address,
    }

    public struct HouseCap has key {
        id: UID
    }
    public struct HOUSE_DATA has drop {}

    fun init(otw: HOUSE_DATA, ctx: &mut TxContext) {
        // Creating and sending the Publisher object to the sender.
        package::claim_and_keep(otw, ctx);

        // Creating and sending the HouseCap object to the sender.
        let house_cap = HouseCap {
            id: object::new(ctx)
        };

        transfer::transfer(house_cap, ctx.sender());
    }

    public fun initialize_house_data(house_cap: HouseCap, treasury_cap: &mut TreasuryCap<LIHUAZHANG_FAUCET_COIN>, amount: u64, ctx: &mut TxContext) {

        let fault_coin = coin::mint(treasury_cap, amount, ctx);

        let house_data = HouseData {
            id: object::new(ctx),
            balance: fault_coin.into_balance(),
            house: ctx.sender(),
        };
 
        let HouseCap { id } = house_cap;
        object::delete(id);

        transfer::share_object(house_data);
    }

    public fun balance(house_data: &HouseData): u64 {
        house_data.balance.value()
    }

    public(package) fun borrow_balance_mut(house_data: &mut HouseData): &mut Balance<LIHUAZHANG_FAUCET_COIN> {
        &mut house_data.balance
    }
    
    /// Returns a mutable reference to the house id.
    public(package) fun borrow_mut(house_data: &mut HouseData): &mut UID {
        &mut house_data.id
    }
        /// Returns a reference to the house id.
    public(package) fun borrow(house_data: &HouseData): &UID {
        &house_data.id
    }

}
