module move_game::flip_coin {
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, public_transfer, transfer};
    use faucet_coin::faucet_coin::FAUCET_COIN as CUIDAQUAN_FAUCET;

    // 游戏回顾
    // 第一 你必须掌握怎么存钱   Balance    Coin -> Balance
    // 第二 你必须掌握怎么取钱    from_balance  Balance -> Coin
    // 第三 就是你要学会怎么交换

    public struct Game  has key {
        id: UID,
        // 在合约存钱 都要用 Balance 来存
        amt: Balance<CUIDAQUAN_FAUCET>
    }

    public struct AdminCap  has key {
        id: UID,
    }


    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            amt: balance::zero(),
        };

        // 选择所有权的时候 所以人都可以玩
        share_object(game);
        let admin = AdminCap { id: object::new(ctx) };
        transfer(admin, ctx.sender());
    }

    /// const SUI_RANDOM_ID: address = @0x8;
    /// 0x8
    entry fun play(game: &mut Game, rand: &Random, in: bool, in_coin: Coin<CUIDAQUAN_FAUCET>, ctx: &mut TxContext) {
        // 正面  反面   -> bool    true false

        let amt_value = in_coin.value();
        let game_amt = game.amt.value();
        // 用户输入的值必须小于池子里面的钱
        // 1SUI  连续玩10次  true  输入每次都是池子的钱  all in
        // 每次最多只能输入池子的 10分之一
        assert!(game_amt >= amt_value * 10, 0x111);

        let mut gen = random::new_generator(rand, ctx);
        let flip_value = random::generate_bool(&mut gen);

        if (in == flip_value) {
            // 赢了加倍
            let out_balance = game.amt.split(amt_value);
            let out_coin = coin::from_balance(out_balance, ctx);

            public_transfer(out_coin, ctx.sender());

            public_transfer(in_coin, ctx.sender());
        }else {
            // 输了就没了
            let in_amt_balance = coin::into_balance(in_coin);
            game.amt.join(in_amt_balance);
        }
    }


    public entry fun deposit(game: &mut Game, in: Coin<CUIDAQUAN_FAUCET>, _: &mut TxContext) {
        let in_amt_balance = coin::into_balance(in);
        game.amt.join(in_amt_balance);
    }

    public entry fun withdraw(_: &AdminCap, game: &mut Game, amt: u64, ctx: &mut TxContext) {
        let out_balance = game.amt.split(amt);
        let out_coin = coin::from_balance(out_balance, ctx);
        public_transfer(out_coin, ctx.sender());
    }
}