module task4::task4 {

    use sui::balance::{Self,Balance, zero};
    use sui::coin::{Self};
    use sui::random::{Self,Random};
    use sui::transfer::{share_object, transfer};
    use sui::tx_context::sender;
    use faucet_coin::faucet_coin::{FAUCET_COIN};

    const EUserInsufficientBalance :u64 =1;
    public struct Game  has key {
        id: UID,
        val: Balance<FAUCET_COIN>
    }

    public struct AdaminCap has key {
        id: UID
    }


    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            val: zero()
        };

        share_object(game);

        let admin = AdaminCap {
            id: object::new(ctx)
        };

        transfer(admin, sender(ctx));
    }
    #[allow(lint(public_random))]
    public entry fun play(
        game: &mut Game,
        flip_value: bool,
        in: &mut coin::Coin<FAUCET_COIN>,
        rand: &Random,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let mut gen = random::new_generator(rand, ctx);
    let flag = random::generate_bool(&mut gen);

    // 如果获胜
    if (flag == flip_value) {
        // 投入的代币不变，另外奖励等额的代币
        let reward = coin::take(&mut game.val, amount, ctx);
        coin::join(in, reward);
    }
    // 猜错了就损失投入的代币
    else {
        Self::public_deposit(game, in, amount)
    }
    }

    fun deposit(game: &mut Game, in: &mut coin::Coin<FAUCET_COIN>, amount: u64) {
        let split_balance = balance::split(coin::balance_mut(in), amount);
    balance::join(&mut game.val, split_balance);
         assert!(
        coin::value(in) >= amount,
        EUserInsufficientBalance
    );
    }

    public entry fun public_deposit(
        game: &mut Game,
        in: &mut coin::Coin<FAUCET_COIN>,
        amount: u64
    ) {
        deposit(game, in, amount);
    }

    public entry fun Withdraw(
    game: &mut Game,
    _: &AdaminCap,
    amount: u64,
    ctx: &mut TxContext
) {
    let cash = coin::take(&mut game.val, amount, ctx);
    transfer::public_transfer(cash, ctx.sender());
}
}