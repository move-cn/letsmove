/// Module: mygame
module mygame::game_data {

    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::package::{Self};
    use faucet_coin::AYOUNG_FAUCET_COIN::AYOUNG_FAUCET_COIN;

    const ECallerNotCreator: u64 = 0;
    const EInsufficientBalance: u64 = 1;

    public struct GameData has key{
        id: UID,
        balance: Balance<AYOUNG_FAUCET_COIN>,
        creator: address,
        max_stake: u64,
        min_stake: u64,
        fees: Balance<AYOUNG_FAUCET_COIN>
    }

    public struct GameCap has key{
        id: UID
    }

    public struct GAME_DATA has drop {}

    public(package) fun borrow_balance_mut(game_data: &mut GameData): &mut Balance<AYOUNG_FAUCET_COIN> {
        &mut game_data.balance
    }

    public(package) fun borrow_fees_mut(game_data: &mut GameData): &mut Balance<AYOUNG_FAUCET_COIN> {
        &mut game_data.fees
    }

    public(package) fun borrow_mut(game_data: &mut GameData): &mut UID {
        &mut game_data.id
    }

    public fun balance(game_data: &GameData): u64 {
        balance::value(&game_data.balance)
    }

    public fun creator(game_data: &GameData): address {
        game_data.creator
    }

    public fun max_stake(game_data: &GameData): u64 {
        game_data.max_stake
    }

    public fun min_stake(game_data: &GameData): u64 {
        game_data.min_stake
    }

    public fun fees(game_data: &GameData): u64 {
        balance::value(&game_data.fees)
    }

    public(package) fun borrow(game_data: &GameData): &UID {
        &game_data.id
    }

    fun init(otw: GAME_DATA, ctx: &mut TxContext){
        package::claim_and_keep(otw, ctx);

        let game_cap = GameCap {
            id: object::new(ctx)
        };

        transfer::transfer(game_cap, tx_context::sender(ctx));
    }

    public fun initialize_game_data(game_cap: GameCap, coin: Coin<AYOUNG_FAUCET_COIN>, ctx: &mut TxContext){
        assert!(coin::value(&coin) > 0, EInsufficientBalance);
        let game_data = GameData {
            id: object::new(ctx),
            balance: coin::into_balance(coin),
            creator: tx_context::sender(ctx),
            fees: balance::zero(),
            max_stake: 50_000_000_000,
            min_stake: 100_000_000
        };
        
        let GameCap { id } = game_cap;
        object::delete(id);

        transfer::share_object(game_data);
    }

    public fun top_up(game_data: &mut GameData, coin: Coin<AYOUNG_FAUCET_COIN>, _: &mut TxContext) {
        coin::put(&mut game_data.balance, coin)
    }

    public fun withdraw(game_data: &mut GameData, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == creator(game_data), ECallerNotCreator);
        let total_balance = balance(game_data);
        let coin = coin::take(&mut game_data.balance, total_balance, ctx);
        transfer::public_transfer(coin, creator(game_data));
    }

    public fun claim_fees(game_data: &mut GameData, ctx: &mut TxContext) {
        assert!(tx_context::sender(ctx) == creator(game_data), ECallerNotCreator);
        let total_fees = fees(game_data);
        let coin = coin::take(&mut game_data.fees, total_fees, ctx);
        transfer::public_transfer(coin, creator(game_data));
    }




}
