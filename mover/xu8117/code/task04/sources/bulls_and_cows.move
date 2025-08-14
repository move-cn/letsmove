module task04::bulls_and_cows {
    use std::string::{Self, String};

    use sui::balance;
    use sui::balance::Balance;
    use sui::clock::Clock;
    use sui::coin;
    use sui::coin::{Coin, TreasuryCap};
    use sui::event;
    use sui::object;
    use sui::token::amount;
    use sui::transfer;
    use sui::transfer::share_object;
    use sui::tx_context::{sender, TxContext};
    use mycoin::xu8117faucetcoin::{mint, XU8117FAUCETCOIN};

    const EInvalidGuessNumber: u64 = 1;
    const EPoolNotEnough: u64 = 2;
    const ETicketNotEnough: u64 = 3;

    public struct Game has key {
        id: UID,
        pool: Balance<XU8117FAUCETCOIN>,
        ticket: u64,
        reward: u64,
        faucetNum: u64
    }

    public fun get_pool_amount(game: &Game): u64 {
        balance::value(&game.pool)
    }

    public struct GamingResultEvent has copy, drop {
        is_win: bool,
        your_number: u8,
        computer_number: u8,
        result: String,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            pool: balance::zero<XU8117FAUCETCOIN>(),
            ticket: 100000000,
            reward: 150000000,
            faucetNum: 300000000
        };
        share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_number(clock: &Clock): u8 {
        ((sui::clock::timestamp_ms(clock) % 2) as u8)
    }

    #[test]
    fun test() {
        let guess_number: u8 = 0;
        assert!(guess_number == 0 || guess_number == 1, EInvalidGuessNumber);
    }

    public fun get_faucet_coin(treasury_cap: &mut TreasuryCap<XU8117FAUCETCOIN>, game: &mut Game, ctx: &mut TxContext) {
        let amount = &mut game.faucetNum;
        mint(treasury_cap, *amount, sender(ctx), ctx);
    }

    public fun deposit(game: &mut Game, depositCoin: Coin<XU8117FAUCETCOIN>, amount: u64, ctx: &mut TxContext) {
        let depositCoinValue = coin::value(&depositCoin);
        assert!(depositCoinValue >= amount, EPoolNotEnough);

        let mut depositCoinBalance = coin::into_balance(depositCoin);
        if (depositCoinValue > amount) {
            balance::join(
                &mut game.pool,
                balance::split(&mut depositCoinBalance, amount)
            );
            let change = coin::from_balance(depositCoinBalance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else {
            balance::join(&mut game.pool, depositCoinBalance);
        }
    }

    public fun withdraw(_: &AdminCap, game: &mut Game, amount: u64, ctx: &mut TxContext) {
        assert!(get_pool_amount(game) > amount, EPoolNotEnough);
        let output_balance = balance::split(&mut game.pool, amount);
        let output_coin = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output_coin, sender(ctx));
    }

    public fun play(
        game: &mut Game,
        guess_number: u8,
        money: Coin<XU8117FAUCETCOIN>,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        assert!(get_pool_amount(game) >= game.reward - game.ticket, EPoolNotEnough);
        assert!(guess_number == 0 || guess_number == 1, EInvalidGuessNumber);

        let money_amount = coin::value(&money);
        assert!(money_amount >= game.ticket, ETicketNotEnough);

        let mut money_balance = coin::into_balance(money);
        if (money_amount > game.ticket) {
            balance::join(
                &mut game.pool,
                balance::split(&mut money_balance, game.ticket)
            );
            let change_fund = coin::from_balance(money_balance, ctx);
            transfer::public_transfer(change_fund, sender(ctx));
        } else {
            balance::join(&mut game.pool, money_balance);
        };

        let target_digit = get_random_number(clock);
        let (result, is_win) = if (guess_number == target_digit) {
            (string::utf8(b"congratulation, you are win."), true)
        } else {
            (string::utf8(b"Unfortunately, your guess was not correct."), false)
        };

        if (is_win) {
            let amount = game.reward;
            assert!(get_pool_amount(game) > amount, EPoolNotEnough);
            let output_balance = balance::split(&mut game.pool, amount);
            let output_coin = coin::from_balance(output_balance, ctx);
            transfer::public_transfer(output_coin, sender(ctx));
        };

        event::emit(GamingResultEvent {
            result,
            is_win,
            your_number: guess_number,
            computer_number: target_digit,
        });
    }
}