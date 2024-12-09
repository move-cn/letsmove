/// Module: flip_coin
module flip_coin::flip_coin {

    use sui::balance;
    use sui::balance::Balance;
    use sui::sui::SUI;
    use sui::coin;
    use sui::coin::Coin;
    use sui::transfer::{share_object,public_transfer,transfer};
    use sui::random;
    use sui::random::Random;

    public struct Game has key {
        id:UID,
        // Balance struct is required to store funds in smart contracts
        balance: Balance<SUI>,
    }

    public struct AdminCap has key {
        id: UID,
    }


    fun init(ctx: &mut TxContext) {
        let game = Game{
            id: object::new(ctx),
            balance: balance::zero<SUI>(),
        };
        let admin_cap = AdminCap{
            id: object::new(ctx),
        };
        share_object(game);
        transfer(admin_cap,ctx.sender());
    }

    entry fun play(game: &mut Game, rand: &Random, in: bool, in_coin: Coin<SUI>, ctx: &mut TxContext) {
        // Check if the game has enough balance to play
        assert!(game.balance.value() >= in_coin.value(), 0x0001);

        // Random number generator
        let mut gen = random::new_generator(rand, ctx);
        let random_result = random::generate_bool(&mut gen);

        // If the random number is true, the player wins
        if (random_result == in) {
            // Transfer the winnings to the player
            let winnings = game.balance.split(in_coin.value());
            public_transfer(coin::from_balance(winnings, ctx), ctx.sender());

            // Return the coin to the player
            public_transfer(in_coin, ctx.sender());
        } else {
            // Deposit the coin into the game when the player loses
            game.balance.join(coin::into_balance(in_coin));
        }
    }

    public fun admin_withdraw(admin_cap: &mut AdminCap, amount: u64, game: &mut Game, ctx: &mut TxContext) {
        let withdraw_balance = balance::split(&mut game.balance, amount);
        let withdraw_coin = coin::from_balance(withdraw_balance, ctx);
        public_transfer(withdraw_coin, ctx.sender());
    }

    public fun admin_deposit(game: &mut Game, in_coin: Coin<SUI>, _: &mut TxContext) {
        game.balance.join(coin::into_balance(in_coin));
    }

}
