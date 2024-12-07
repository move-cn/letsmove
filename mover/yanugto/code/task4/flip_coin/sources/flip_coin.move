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

    /*
    entry fun play(game: &mut Game,in: bool, in_coin: Coin<SUI>, _: &mut TxContext) {
        // win
        //let in_balance = coin::into_balance(in_coin);

        let out_balance = game.balance.split(in_coin.value());
        let out_coin = coin::from_balance(out_balance,_);
        public_transfer(out_coin,_.sender());
        public_transfer(in_coin,_.sender());

        // not win
        //let in_balance = coin::into_balance(in_amount);
        //game.balance.join(in_balance);

    }
    */
    entry fun play(game: &mut Game,rand: &Random,in: bool, in_coin: Coin<SUI>, ctx: &mut TxContext) {
        let in_balance = coin::into_balance(in_coin);
        game.balance.join(in_balance);
        let gen = random::new_generator(rand,ctx);
        if random::gen_u64(&mut gen) % 2 == 0 {
            public_transfer(in_coin,_.sender());
        } else {
            public_transfer(game.balance.split(in_coin.value()),_.sender());
        }

    }

    public fun admin_withdraw(game: &mut Game, admin_cap: &mut AdminCap, _: &mut TxContext) {
        transfer(game,_.sender());
        transfer(admin_cap,_.sender());
    }

    public fun admin_deposit(game: &mut Game, in_coin: Coin<SUI>, _: &mut TxContext) {
        game.balance.join(coin::into_balance(in_coin));
        public_transfer(in_coin,_.sender());
    }

}
