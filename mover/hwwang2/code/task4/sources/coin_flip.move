module task4::coin_game {
    use sui::event;
    use std::debug;
    use sui::tx_context::{Self, TxContext};
    use sui::balance::{Self, Balance};
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::clock::{Self, Clock};

    use sui::sui::SUI;
    use sui::transfer;

    const EInvaildNumber: u64 = 1;

    const STAKE: u64 = 200000000;

    const EInsufficientBalance: u64 = 11;
    const EInvalidPlayerBetAmount: u64 = 20;
    const ECallerNotHouse: u64 = 21;

    struct AdminCap has key {
        id: UID
    }

    struct HouseData has key {
        id: UID,
        balance: Balance<SUI>,
        house: address
    }

    struct GameResult has drop, copy {
        guess: u8,
        system: u8,
        player: address
    }

    fun init(ctx: &mut TxContext) {
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };

        transfer::transfer(admin_cap, tx_context::sender(ctx))
    }

    /**
    * add coin
    */
    public entry fun initialize(
        admin_cap: AdminCap,
        coin: Coin<SUI>,
        ctx: &mut TxContext
    ) {
        assert!(coin::value(&coin) > 0, EInsufficientBalance);

        let house_data = HouseData {
            id: object::new(ctx),
            balance: coin::into_balance(coin),
            house: tx_context::sender(ctx)
        };
        let AdminCap { id } = admin_cap;
        object::delete(id);

        transfer::share_object(house_data);
    }

     /// Function used to top up the house balance. Can be called by anyone.
    /// House can have multiple accounts so giving the treasury balance is not limited.
    /// @param house_data: The HouseData object
    /// @param coin: The coin object that will be used to top up the house balance. The entire coin is consumed
    public entry fun top_up(house_data: &mut HouseData, coin: Coin<SUI>, _: &mut TxContext) {        
        let balance = coin::into_balance(coin);
        balance::join(&mut house_data.balance, balance);
    }

    /// House can withdraw the entire balance of the house object
    /// @param house_data: The HouseData object
    public entry fun withdraw(house_data: &mut HouseData, ctx: &mut TxContext) {
        // only the house address can withdraw funds
        assert!(tx_context::sender(ctx) == house_data.house, ECallerNotHouse);
        let total_balance = balance::value(&house_data.balance);
        assert!(total_balance > STAKE*2, EInsufficientBalance);
        let coin = coin::take(&mut house_data.balance, total_balance-STAKE*2, ctx);
        transfer::public_transfer(coin, house_data.house);
    }

    public entry fun play(number: u8, user_bet: Coin<SUI>, house_data: &mut HouseData, clock: &Clock, ctx: &mut TxContext){
         // input 0 1
        assert!(number < 2, EInvaildNumber);
        assert!(balance::value(&house_data.balance) >= STAKE, EInsufficientBalance);
        // get the user coin and convert it into a balance
        assert!(coin::value(&user_bet) == STAKE, EInvalidPlayerBetAmount);

        // let stake = coin::into_balance(user_bet);
        // balance::join(&mut house_data.balance, stake);

        // let result = get_random(clock);

        // let output = GameResult {
        //     guess: number,
        //     system: result,
        //     player: tx_context::sender(ctx)
        // };
        // event::emit(output);
        // if (result == number){
        //     let coin = coin::take(&mut house_data.balance, 2*STAKE, ctx);
        //     transfer::public_transfer(coin, tx_context::sender(ctx));
        // };
        

        // get the house balance


        let result = get_random(clock);
        let output = GameResult {
            guess: number,
            system: result,
            player: tx_context::sender(ctx)
        };
        event::emit(output);

        if (result == number){
            let coin2 = coin::take(&mut house_data.balance, STAKE, ctx);
            coin::join(&mut user_bet, coin2);
            transfer::public_transfer(user_bet, tx_context::sender(ctx));
        }else{
            let stake = coin::into_balance(user_bet);
            balance::join(&mut house_data.balance, stake);
        };
    }

    public fun get_random(clock: &Clock):u8{
        let random_value = ((clock::timestamp_ms(clock) % 2) as u8);
        debug::print(&random_value);
        random_value
    }

}