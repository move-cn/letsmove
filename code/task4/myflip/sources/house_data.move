module myflip::house_data {

    use sui::balance::{Self, Balance};
    use sui::sui::SUI;
    use sui::coin::{Self, Coin};
    use sui::package::{Self};

    // Error codes
    const ECallerNotHouse: u64 = 0;
    const EInsufficientBalance: u64 = 1;

        /// Configuration and Treasury object, managed by the house.
    public struct HouseData has key {
        id: UID,
        balance: Balance<SUI>,
        house: address,
        public_key: vector<u8>,
        max_stake: u64,
        min_stake: u64,
        fees: Balance<SUI>,
        base_fee_in_bp: u16 
    }

    /// A one-time use capability to initialize the house data; created and sent
    /// to sender in the initializer.
    public struct HouseCap has key {
        id: UID
    }

    /// Used as a one time witness to generate the publisher.
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

    public fun initialize_house_data(house_cap: HouseCap, coin: Coin<SUI>, public_key: vector<u8>, ctx: &mut TxContext) {
        assert!(coin.value() > 0, EInsufficientBalance);

        let house_data = HouseData {
            id: object::new(ctx),
            balance: coin.into_balance(),
            house: ctx.sender(),
            public_key,
            max_stake: 50_000_000_000, // 50 SUI, 1 SUI = 10^9.
            min_stake: 1_000_000_000, // 1 SUI.
            fees: balance::zero(),
            base_fee_in_bp: 100 // 1% in basis points.
        };

        let HouseCap { id } = house_cap;
        object::delete(id);

        transfer::share_object(house_data);
    }

        public fun top_up(house_data: &mut HouseData, coin: Coin<SUI>, _: &mut TxContext) {
        coin::put(&mut house_data.balance, coin)
    }

    public fun withdraw(house_data: &mut HouseData, ctx: &mut TxContext) {
        // Only the house address can withdraw funds.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        let total_balance = balance(house_data);
        let coin = coin::take(&mut house_data.balance, total_balance, ctx);
        transfer::public_transfer(coin, house_data.house());
    }

    public fun claim_fees(house_data: &mut HouseData, ctx: &mut TxContext) {
        // Only the house address can withdraw fee funds.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        let total_fees = fees(house_data);
        let coin = coin::take(&mut house_data.fees, total_fees, ctx);
        transfer::public_transfer(coin, house_data.house());
    }

    public fun update_max_stake(house_data: &mut HouseData, max_stake: u64, ctx: &mut TxContext) {
        // Only the house address can update the base fee.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        house_data.max_stake = max_stake;
    }

    public fun update_min_stake(house_data: &mut HouseData, min_stake: u64, ctx: &mut TxContext) {
        // Only the house address can update the min stake.
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        house_data.min_stake = min_stake;
    }

        // --------------- Mutable References ---------------

    public(package) fun borrow_balance_mut(house_data: &mut HouseData): &mut Balance<SUI> {
        &mut house_data.balance
    }

    public(package) fun borrow_fees_mut(house_data: &mut HouseData): &mut Balance<SUI> {
        &mut house_data.fees
    }

    public(package) fun borrow_mut(house_data: &mut HouseData): &mut UID {
        &mut house_data.id
    }

    // --------------- Read-only References ---------------

    /// Returns a reference to the house id.
    public(package) fun borrow(house_data: &HouseData): &UID {
        &house_data.id
    }

    /// Returns the balance of the house.
    public fun balance(house_data: &HouseData): u64 {
        house_data.balance.value()
    }

    /// Returns the address of the house.
    public fun house(house_data: &HouseData): address {
        house_data.house
    }

    /// Returns the public key of the house.
    public fun public_key(house_data: &HouseData): vector<u8> {
        house_data.public_key
    }

    /// Returns the max stake of the house.
    public fun max_stake(house_data: &HouseData): u64 {
        house_data.max_stake
    }

    /// Returns the min stake of the house.
    public fun min_stake(house_data: &HouseData): u64 {
        house_data.min_stake
    }

    /// Returns the fees of the house.
    public fun fees(house_data: &HouseData): u64 {
        house_data.fees.value()
    }

    /// Returns the base fee.
    public fun base_fee_in_bp(house_data: &HouseData): u16 {
        house_data.base_fee_in_bp
    }

    // --------------- Test-only Functions ---------------

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(HOUSE_DATA {}, ctx);
    }
}