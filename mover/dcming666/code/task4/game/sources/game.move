module game::game;
    use sui::coin::{Self, Coin};
    use dcm_faucet_coin::dcm_faucet_coin::DCM_FAUCET_COIN;
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};

    const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    public struct Game has key {
        id: UID,
        balance: Balance<DCM_FAUCET_COIN>,
    }

    public struct Admin has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(game);

        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, tx_context::sender(ctx));
    }

    public entry fun Deposit(
        game: &mut Game,
        coin: &mut Coin<DCM_FAUCET_COIN>,
        amount: u64,
    ) {
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );
        let split_balance = balance::split(coin::balance_mut(coin), amount);
        balance::join(&mut game.balance, split_balance);
    }

    public entry fun Withdraw(
        game: &mut Game,
        _: &Admin,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, tx_context::sender(ctx));
    }

    public entry fun Play(
        game: &mut Game,
        rnd: &Random,
        guess: bool,
        coin: &mut Coin<DCM_FAUCET_COIN>,
        amount: u64,
        ctx: &mut TxContext
    ) {

        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );

        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );

        let mut gen = random::new_generator(rnd, ctx);
        let flag = random::generate_bool(&mut gen);

        if (flag == guess) {
            let reward = coin::take(&mut game.balance, amount, ctx);
            coin::join(coin, reward);
        } else {
            Self::Deposit(game, coin, amount)
        }
    }