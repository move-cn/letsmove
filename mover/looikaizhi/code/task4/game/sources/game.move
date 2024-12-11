module game::game{

    use std::ascii::{string, String};
    use std::option;
    use sui::balance::{Balance, zero};
    use sui::coin;
    use sui::coin::Coin;
    use sui::object;
    use sui::object::UID;
    use sui::random;
    use sui::random::{Random};
    use sui::transfer::{share_object, public_transfer, transfer};
    use sui::tx_context::{TxContext, sender};
    use sui::linked_table;
    use game::gameFaucet::GAMEFAUCET;

    public struct GAME has key{
        id: UID,
        name: String,
        balance: Balance<GAMEFAUCET>,
        provider: linked_table::LinkedTable<address, u64>,
    }

    public struct Admin has key{
        id: UID,
    }

    fun init(ctx: &mut TxContext){
        let game = GAME{
            id: object::new(ctx),
            name: string(b"looikaizhi"),
            balance: zero(),
            provider: linked_table::new(ctx),
        };

        share_object(game);

        let admin = Admin{ id: object::new(ctx)};
        transfer(admin, ctx.sender());
    }

    public fun game_rule(r: &Random,ctx: &mut TxContext):bool{
        let mut gen = random::new_generator(r, ctx);
        let value = random::generate_u8_in_range(&mut gen,1, 4);
        if(value == 1) { return true }
        else { return false }
    }


    entry fun play(game: &mut GAME, in_coin: Coin<GAMEFAUCET>, r: &Random, ctx: &mut TxContext){

        let player_in = in_coin.value();
        let pool_balance = game.balance.value();

        assert!(player_in <= pool_balance/10);

        let win_or_lose: bool = game_rule(r, ctx);
        if(win_or_lose){
            // win
            let out_balance_pool = game.balance.split(player_in);
            let out_coin = coin::from_balance(out_balance_pool, ctx);
            public_transfer(out_coin, ctx.sender());
            public_transfer(in_coin, ctx.sender());

        }else{
            // lose,
            let in_balance = coin::into_balance(in_coin);
            game.balance.join(in_balance);
        };

        provider_result(game, player_in, !win_or_lose);
    }

    public entry fun deposit_pool(game: &mut GAME, provider: Coin<GAMEFAUCET>, ctx: &mut TxContext){
        let sender = ctx.sender();
        let amount =  provider.value();

        if(!linked_table::contains(&mut game.provider, sender)){
            linked_table::push_back(&mut game.provider, sender, 0);
        };

        // 凭证
        let provider_balance = linked_table::borrow_mut(&mut game.provider, sender);
        *provider_balance = *provider_balance + amount;

        // 存入pool
        let in_balance = coin::into_balance(provider);
        game.balance.join(in_balance);

    }

    public entry fun withdraw_pool(game: &mut GAME, amount: u64, ctx: &mut TxContext){
        let sender = ctx.sender();

        // check
        assert!(linked_table::contains(&game.provider, sender));
        let provider_balance = linked_table::borrow_mut(&mut game.provider, sender);
        assert!(*provider_balance >= amount);

        *provider_balance = *provider_balance - amount;

        let out_balance_pool = game.balance.split(amount);
        let out_coin = coin::from_balance(out_balance_pool, ctx);
        public_transfer(out_coin, sender);
    }

    public fun provider_result(game: &mut GAME, amount: u64, result: bool){
        let pool_all_balance = game.balance.value();
        assert!(pool_all_balance > 0);

        let mut current_key: Option<address> = *linked_table::front(&mut game.provider);
        while(option::is_some(&mut current_key)){
            let key = option::extract(&mut current_key);
            let provider_balance = linked_table::borrow_mut(&mut game.provider, key);

            if(result){*provider_balance = *provider_balance + *provider_balance * amount / pool_all_balance}
            else{ *provider_balance = *provider_balance - *provider_balance * amount / pool_all_balance};

            current_key = *linked_table::next(&mut game.provider, key);
        }
    }

}