module flip_coin::flip_coin {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::random;
    use sui::random::Random;
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use FaucetCoin::FaucetCoin::FAUCETCOIN;

    const EOverBalance: u64 = 0;

   public struct Pool has key{
        id: UID,
        balance:Balance<FAUCETCOIN>,
   }

    public struct AdminCap has key {
        id: UID
    }

    fun init(ctx: &mut TxContext){
        let admincap = AdminCap {id: object::new(ctx)};
        let pool_vault = Pool {id: object::new(ctx), balance: balance::zero<FAUCETCOIN>()};

        share_object(pool_vault);

        transfer::transfer(admincap, sender(ctx));
    }

    public entry fun deposit(pool_vault:&mut Pool,coin:Coin<FAUCETCOIN>,ctx: &mut TxContext){
        let inCoin_balance = into_balance(coin);
        balance::join(&mut pool_vault.balance, inCoin_balance);
    }

    public entry fun withdral(_: &AdminCap,pool_vault:&mut Pool,amount: u64, ctx: &mut TxContext){
        assert!(amount <= balance::value(&pool_vault.balance), EOverBalance );
        let withdral_amount = balance::split(&mut pool_vault.balance, amount);

        public_transfer(coin::from_balance(withdral_amount, ctx), sender(ctx));
    }
    entry fun gameplay( pool_vault:&mut Pool, guess:bool, random: &Random, inCoin:Coin<FAUCETCOIN>,ctx: &mut TxContext) {
        let inCoin_value = coin::value(&inCoin);
        let play_address = sender(ctx);
        let pool_balance = balance::value(&pool_vault.balance);

        if(inCoin_value > pool_balance/10){
            abort 100u64;
        };

        let mut gen = random::new_generator(random, ctx);
        let mut flag = random::generate_bool(&mut gen);

        if(guess == flag){
            let win_back = balance::split(&mut pool_vault.balance, inCoin_value );
            public_transfer(coin::from_balance(win_back, ctx), play_address);
            public_transfer(inCoin, play_address);
        }else{
            let in_balance = into_balance(inCoin);
            balance::join(&mut pool_vault.balance, in_balance);
        }

    }
}