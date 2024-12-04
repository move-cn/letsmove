module swaptoken::swaptoken{

    use sui::balance::{Balance, zero};
    use sui::coin::{Coin, into_balance, from_balance};
    use sui::linked_table;
    use sui::transfer::{share_object, public_transfer, transfer};
    use swaptoken::swapFaucetB::SWAPFAUCETB;
    use swaptoken::swapFaucetA::SWAPFAUCETA;

    public struct Pool_A_B has key, store{
        id: UID,
        coin_A: Balance<SWAPFAUCETA>,
        coin_B: Balance<SWAPFAUCETB>,
        stakers: linked_table::LinkedTable<address, u64>,
    }

    public struct AdminCap has key{
        id: UID,
    }

    fun init(ctx: &mut TxContext){
        let admin = AdminCap{ id: object::new(ctx) };

        let pool = Pool_A_B{
            id: object::new(ctx),
            coin_A: zero<SWAPFAUCETA>(),
            coin_B: zero<SWAPFAUCETB>(),
            stakers: linked_table::new<address, u64>(ctx),
        };

        transfer(admin, ctx.sender());
        share_object(pool);
    }

    public entry fun deposit(pool: &mut Pool_A_B, coin_A: Coin<SWAPFAUCETA>, coin_B: Coin<SWAPFAUCETB>, ctx: &mut TxContext){
        let sender = ctx.sender();
        let coinA_value = coin_A.value();
        let coinB_value = coin_B.value();

        assert!(coinA_value == coinB_value);

        if(!linked_table::contains(&pool.stakers, sender)){
            linked_table::push_back(&mut pool.stakers, sender, 0)
        };

        let staker_balance = linked_table::borrow_mut(&mut pool.stakers, sender);
        *staker_balance = *staker_balance + coinA_value;

        let coinA_into_balance = into_balance(coin_A);
        let coinB_into_balance = into_balance(coin_B);

        pool.coin_A.join(coinA_into_balance);
        pool.coin_B.join(coinB_into_balance);
    }

    public entry fun withdraw(pool: &mut Pool_A_B, ctx: &mut TxContext){
        let sender = ctx.sender();

        assert!(linked_table::contains(&pool.stakers, sender));

        let staker_balance = *linked_table::borrow_mut(&mut pool.stakers, sender);

        let poolA_balance = pool.coin_A.split(staker_balance);
        let poolB_balance = pool.coin_B.split(staker_balance);
        let coinA_from_balance = from_balance(poolA_balance, ctx);
        let coinB_from_balance = from_balance(poolB_balance, ctx);

        public_transfer(coinA_from_balance, sender);
        public_transfer(coinB_from_balance, sender);

        linked_table::remove(&mut pool.stakers, sender);
    }


    public entry fun swap_A_to_B(pool: &mut Pool_A_B, in_coin: Coin<SWAPFAUCETA>, ctx: &mut TxContext){
        let in_amount = in_coin.value();
        assert!(pool.coin_B.value() >= in_amount && in_amount > 100000);

        let input_balance = into_balance(in_coin);
        pool.coin_A.join(input_balance);

        let output_balance = pool.coin_B.split(in_amount);
        let output_from_balance = from_balance(output_balance, ctx);

        public_transfer(output_from_balance, ctx.sender());
    }

    public entry fun swap_B_to_A(pool: &mut Pool_A_B, in_coin: Coin<SWAPFAUCETB>, ctx: &mut TxContext){
        let in_amount = in_coin.value();
        assert!(pool.coin_A.value() >= in_amount && in_amount > 100000);

        let input_balance = into_balance(in_coin);
        pool.coin_B.join(input_balance);

        let output_balance = pool.coin_A.split(in_amount);
        let output_from_balance = from_balance(output_balance, ctx);

        public_transfer(output_from_balance, ctx.sender());
    }
}

