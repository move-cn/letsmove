module amazing::house {
    use sui::coin::Coin;
    use sui::sui::SUI;
    use sui::balance::{Self, Balance};
    use std::ascii::String;
    use std::string::{Self};
    use sui::coin::{Self, Coin};
    use sui::balance::Balance;
    use sui::object::{Self, UID, ID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::package;
    use sui::clock::Clock;
    use sui::clock::{Self, Clock};
    use sui::sui::SUI;
    use sui::event;
    use sui::dynamic_object_field::{Self as dof};


    // === Errors ===
    const ECallerNotHouse: u64 = 0;
    const EInsufficientBalance: u64 = 1;

    /// A one-time use capability to initialize the house data;
    /// created and sent to sender in the initializer.
    public struct HouseCap has key {
        id: UID
    }

    /// Used as a one time witness to generate the publisher.
    public struct HOUSE_DATA has drop {}


    public struct AmazingHoseData has key,store {
        id: UID,
        // House's balance which also contains the accrued winnings of the house.
        balance: Balance<SUI>,
        // Address of the house or the game operator.
        house: address,
        lottery_attach: u64,
        lottery_join: u64,
        lottery_amazing: u64,
        // Maximum stake amount a player can bet in a single game.
        max_stake: u64,
        // Minimum stake amount required to play the game.
        min_stake: u64,
        fees: Balance<SUI>,
        // The accrued fees from games played.
        // The default fee in basis points. 1 basis point = 0.01%.
        base_fee_in_bp: u16,
        // Multipliers used to calculate winnings based on the game outcome.
        multiplier: vector<u64>
    }

    fun init(otw: HOUSE_DATA, ctx: &mut TxContext) {
        // Creating and sending the Publisher object to the sender.
        package::claim_and_keep(otw, ctx);

        // Creating and sending the HouseCap object to the sender.
        let house_cap = HouseCap {
            id: object::new(ctx)
        };
        transfer::transfer(house_cap, ctx.sender());
    }

    public fun initialize_house_data(house_cap: HouseCap, coin:Balance<SUI>, multiplier: vector<u64>, ctx: &mut TxContext) {
        assert!(coin.value() > 0, EInsufficientBalance);

        let mut house_data = AmazingHoseData {
            id: object::new(ctx),
            balance: coin.into_balance(),
            house: ctx.sender(),
            lottery_attach:0,
            lottery_join:0,
            lottery_amazing:0,
            max_stake: 10_000_000_000, // 10 SUI = 10^9.
            min_stake: 1_000_000_000, // 1 SUI.
            fees: balance::zero(),
            base_fee_in_bp: 100, // 1% in basis points.
            multiplier: vector[]
        };

        house_data.set_multiplier_vector(multiplier);
        let HouseCap { id } = house_cap;
        object::delete(id);
        transfer::share_object(house_data);
    }


    public fun update_multiplier_vector(house_data: &mut AmazingHoseData, v: vector<u64>, ctx: &mut TxContext) {
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);
        house_data.multiplier = vector[];
        house_data.set_multiplier_vector(v);
    }

    public fun top_up(house_data: &mut AmazingHoseData, coin: Coin<SUI>, _: &mut TxContext) {
        coin::put(&mut house_data.balance, coin)
    }

    public fun withdraw(house_data: &mut AmazingHoseData, ctx: &mut TxContext) {
        // Only the house address can withdraw funds.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        let total_balance = house_data.balance();
        let coin = coin::take(&mut house_data.balance, total_balance, ctx);
        transfer::public_transfer(coin, house_data.house());
    }

    /// House can withdraw the accumulated fees of the house object.
    public fun claim_fees(house_data: &mut AmazingHoseData, ctx: &mut TxContext) {
        // Only the house address can withdraw fee funds.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        let total_fees = house_data.fees();
        let coin = coin::take(&mut house_data.fees, total_fees, ctx);
        transfer::public_transfer(coin, house_data.house());
    }

    /// House can update the max stake. This allows larger stake to be placed.
    public fun update_max_stake(house_data: &mut AmazingHoseData, max_stake: u64, ctx: &mut TxContext) {
        // Only the house address can update the base fee.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        house_data.max_stake = max_stake;
    }

    /// House can update the min stake. This allows smaller stake to be placed.
    public fun update_min_stake(house_data: &mut AmazingHoseData, min_stake: u64, ctx: &mut TxContext) {
        // Only the house address can update the min stake.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        house_data.min_stake = min_stake;
    }

    /// Returns the balance of the house.
    public fun balance(house_data: &AmazingHoseData): u64 {
        house_data.balance.value()
    }


    /// Returns the max stake of the house.
    public fun max_stake(house_data: &AmazingHoseData): u64 {
        house_data.max_stake
    }

    /// Returns the min stake of the house.
    public fun min_stake(house_data: &AmazingHoseData): u64 {
        house_data.min_stake
    }

    /// Returns the fees of the house.
    public fun fees(house_data: &AmazingHoseData): u64 {
        house_data.fees.value()
    }

    /// Returns the base fee.
    public fun base_fee_in_bp(house_data: &AmazingHoseData): u16 {
        house_data.base_fee_in_bp
    }

    /// Returns the multiplier vector
    public fun multiplier(house_data: &AmazingHoseData): vector<u64> {
        house_data.multiplier
    }

    // === Public-Friend Functions ===

    /// Returns a reference to the house id.
    public(package) fun borrow(house_data: &AmazingHoseData): &UID {
        &house_data.id
    }

    /// Returns a mutable reference to the balance of the house.
    public(package) fun borrow_balance_mut(house_data: &mut AmazingHoseData): &mut Balance<SUI> {
        &mut house_data.balance
    }

    /// Returns a mutable reference to the fees of the house.
    public(package) fun borrow_fees_mut(house_data: &mut AmazingHoseData): &mut Balance<SUI> {
        &mut house_data.fees
    }

    /// Returns a mutable reference to the house id.
    public(package) fun borrow_mut(house_data: &mut AmazingHoseData): &mut UID {
        &mut house_data.id
    }

    // === Private Functions ===
    fun set_multiplier_vector(house_data: &mut AmazingHoseData, v: vector<u64>) {
        house_data.multiplier.append(v);
    }

}
