module task4::flip_coin{
    use std::string;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::transfer::public_transfer;
    use std::string::{String, from_ascii};
    use std::type_name;
    use sui::event;
    use sui::random;

    const EOverBalance: u64 = 0x1;
    const EVaultIsEmpty: u64 = 0x2;


    public struct Vault<phantom T> has key {
        id: UID,
        amount: Balance<T>,
    }

    public struct AdminCap has key {
        id: UID,
    }

    public struct TransEvent has copy, drop {
        caller: address,
        amount_change: u64,
        direction: String,
        pool_balance: u64,
        coin_type: String,
    }

    fun init(ctx: &mut TxContext) {
        let admin = AdminCap{id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun new_vault<T>(coin_in: Coin<T>, ctx: &mut TxContext) {
        let balance = coin::into_balance(coin_in);

        let vault = Vault {
            id: object::new(ctx),
            amount: balance,
        };

        transfer::share_object(vault);
    }

    public entry fun deposit<T>(vault: &mut Vault<T>, mut coin_in: Coin<T>, amount: u64, ctx: &mut TxContext) {
        let delta_amount: u64;
        if (coin_in.value() <= amount) {
            delta_amount = coin_in.value();
            vault.amount.join(coin::into_balance(coin_in));
        } else {
            let split_coin = coin_in.split(amount, ctx);
            vault.amount.join(coin::into_balance(split_coin));
            public_transfer(coin_in, ctx.sender());
            delta_amount = amount;
        };

        event::emit(TransEvent{
            caller: ctx.sender(),
            amount_change: delta_amount,
            direction: string::utf8(b"in"),
            pool_balance: vault.amount.value(),
            coin_type: from_ascii(type_name::get<T>().into_string()),
        })
    }

    public entry fun batch_deposit<T>(vault: &mut Vault<T>, amount: u64, mut chips: vector<Coin<T>>, ctx:&mut TxContext) {
        let mut merged_coin = vector::pop_back(&mut chips);
        while (!vector::is_empty(&chips)) {
            let coin_to_merge = vector::pop_back(&mut chips);
            merged_coin.join(coin_to_merge);
        };
        vector::destroy_empty(chips);
        let split_coin = merged_coin.split(amount, ctx);
        vault.amount.join(coin::into_balance(split_coin));
        if (merged_coin.value() > 0) {
            transfer::public_transfer(merged_coin, tx_context::sender(ctx));
        } else {
            coin::destroy_zero(merged_coin);
        };

        event::emit(TransEvent{
            caller: ctx.sender(),
            amount_change: amount,
            direction: string::utf8(b"in"),
            pool_balance: vault.amount.value(),
            coin_type: from_ascii(type_name::get<T>().into_string()),
        });
    }

    public entry fun withdraw<T>(_: &AdminCap, vault: &mut Vault<T>, amount: u64, ctx: &mut TxContext) {
        assert!(vault.amount.value() > amount, EOverBalance);
        let withdraw_balance = vault.amount.split(amount);
        let withdraw_coin = coin::from_balance(withdraw_balance, ctx);
        public_transfer(withdraw_coin, ctx.sender());
        event::emit(TransEvent{
            caller: ctx.sender(),
            amount_change: amount,
            direction: string::utf8(b"out"),
            pool_balance: vault.amount.value(),
            coin_type: from_ascii(type_name::get<T>().into_string()),
        });
    }

    entry fun play<T>(rand: &random::Random, vault: &mut Vault<T>, res:bool, mut coin_in: Coin<T>, amount: u64, ctx: &mut TxContext) {
        let chip: Coin<T>;
        if (coin_in.value() > amount) {
            // need split
            chip = coin_in.split(amount, ctx);
            transfer::public_transfer(coin_in, ctx.sender());
        } else {
            chip = coin_in;
        };

        let mut gen = random::new_generator(rand, ctx);
        let fliped_res:bool = random::generate_bool(&mut gen);
        let bet_amount_val = chip.value();
        assert!(vault.amount.value() >= bet_amount_val * 10, EOverBalance);
        let direction: vector<u8>;

        if (res == fliped_res) {
            // double
            let reward_balance = vault.amount.split(bet_amount_val);
            let reward_coin = coin::from_balance(reward_balance, ctx);
            public_transfer(reward_coin, ctx.sender());
            public_transfer(chip, ctx.sender());
            direction = b"out";
        } else {
            // broken
            let bet_balance = coin::into_balance(chip);
            vault.amount.join(bet_balance);
            direction = b"in";
        };

        event::emit(TransEvent{
            caller: ctx.sender(),
            amount_change: bet_amount_val,
            direction: string::utf8(direction),
            pool_balance: vault.amount.value(),
            coin_type: from_ascii(type_name::get<T>().into_string()),
        });
    }

}