#[allow(unused_use, lint(public_random))]
module game_coin::game_coin {

    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::random;
    use sui::random::{RandomGenerator, Random, new_generator};
    use sui::transfer::{share_object, public_transfer, transfer};
    use my_coin_faucet::yunfaucet::YUNFAUCET;
    use sui::balance;

    public struct Game has key, store {
        id: UID,
        // 合约存钱都要用Balance
        amt: Balance<YUNFAUCET>
    }

    public struct ADMIN has key {
        id: UID,
    }

    fun init(
        ctx: &mut TxContext
    ) {
        let game = Game {
            id: object::new(ctx),
            amt: balance::zero(),
        };

        //所有权，共享
        share_object(game);

        let admin = ADMIN {
            id: object::new(ctx)
        };
        transfer(admin, ctx.sender());
    }

    // 存款
    public entry fun Deposit(
        game: &mut Game,
        in: &mut Coin<YUNFAUCET>,
        amount: u64
    ) {
        // 0x1 means insufficient balance
        assert!(coin::value(in) >= amount, 0x1);
        let in_balance = balance::split(coin::balance_mut(in), amount);
        balance::join(&mut game.amt, in_balance);
    }

    // 取款
    public entry fun Withdraw(
        _: &mut ADMIN,
        game: &mut Game,
        amount: u64,
        ctx: &mut TxContext
    ) {
        // 0x2 means persion pool insufficient balance
        assert!(game.amt.value() >= amount, 0x2);
        let out_balance = coin::take(&mut game.amt, amount, ctx);
        public_transfer(out_balance, ctx.sender());
    }

    // game logic
    public entry fun game(game: &mut Game,coin: &mut Coin<YUNFAUCET>,amount: u64,guess: bool,rand: &Random,ctx: &mut TxContext){
        //判断用户余额是否大于押注余额
        assert!(coin::value(coin) >= amount,0x3);

        let mut generator = new_generator(rand, ctx);
        let result = random::generate_u8_in_range(&mut generator, 0, 1);

        let flag: bool = result == 1;
        //如果猜测正确
        if (flag == guess) {
            let game = coin::take(&mut game.amt, amount, ctx);
            coin::join(coin, game);
        }
        else{
            Deposit(game, coin, amount);
        }
    }
}