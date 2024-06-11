module satoshi_flip::house_data {
    use sui::balance::{Self, Balance};
    use sui::sui::SUI;
    use sui::coin::{Self, Coin};
    use sui::package::{Self};

    const ECallerNotHouse: u64 = 0;
    const EInsufficientBalance: u64 = 1;


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

    // house_cap 如何传参数？？？
    public fun initialize_house_data(house_cap: HouseCap, coin: Coin<SUI>, public_key: vector<u8>, ctx: &mut TxContext) {
        assert!(coin.value() > 0, EInsufficientBalance);

        let house_data = HouseData {
            id: object::new(ctx),
            balance: coin.into_balance(),
            house: ctx.sender(),
            public_key,
            max_stake: 50_000_000_000, // 50 SUI
            min_stake: 1_000_000_000, // 1 SUI
            fees: balance::zero(),
            base_fee_in_bp: 100 // 1% in basis points
        };

        let HouseCap {id} = house_cap;
        // todo syj 这里为什么要删除，保证以后无法再调用 initialize_house_data 函数来创建 house_data，从而保证全局只有 1 个 HouseData 实例？
        object::delete(id);

        transfer::share_object(house_data);
    }

    // 充值
    public fun top_up(house_data: &mut HouseData, coin: Coin<SUI>, _: &mut TxContext) {
        coin::put(&mut house_data.balance, coin)
    }

    public fun withdraw(house_data: &mut HouseData, ctx: &mut TxContext) {
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        let total_balance = balance(house_data);
        let coin = coin::take(&mut house_data.balance, total_balance, ctx);
        transfer::public_transfer(coin, house_data.house());
    }

    public fun claim_fees(house_data: &mut HouseData, ctx: &mut TxContext) {
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        let total_fees = fees(house_data);
        let coin = coin::take(&mut house_data.fees, total_fees, ctx);

        transfer::public_transfer(coin, house_data.house());
    }

    public fun update_max_stake(house_data: &mut HouseData, max_stake: u64, ctx: &mut TxContext) {
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        house_data.max_stake = max_stake;
    }

    public fun update_min_stake(house_data: &mut HouseData, min_stake: u64, ctx: &mut TxContext) {
        assert!(ctx.sender() == house_data.house(), ECallerNotHouse);

        house_data.min_stake = min_stake;
    }

    // -------------- 可变引用 -----------------
    public(package) fun borrow_balance_mut(house_data: &mut HouseData): &mut Balance<SUI> {
        &mut house_data.balance
    }

    public(package) fun borrow_fees_mut(house_data: &mut HouseData): &mut Balance<SUI> {
        &mut house_data.fees
    }

    public(package) fun borrow_mut(house_data: &mut HouseData): &mut UID {
        &mut house_data.id
    }

    // -------------- 不可变引用 ------------
    public(package) fun borrow(house_data: &HouseData): &UID {
        &house_data.id
    }

    public fun balance(house_data: &HouseData): u64 {
        house_data.balance.value()
    }

    public fun house(house_data: &HouseData): address {
        house_data.house
    }

    public fun public_key(house_data: &HouseData): vector<u8> {
        house_data.public_key
    }

    public fun max_stake(house_data: &HouseData): u64 {
        house_data.max_stake
    }

    public fun min_stake(house_data: &HouseData): u64 {
        house_data.min_stake
    }

    public fun fees(house_data: &HouseData): u64 {
        house_data.fees.value()
    }

    public fun base_fee_in_bp(house_data: &HouseData): u16 {
        house_data.base_fee_in_bp
    }

    // ----------- test func -------------
    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(HOUSE_DATA {}, ctx);
    }
}
