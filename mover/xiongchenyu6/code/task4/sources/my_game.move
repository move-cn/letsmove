#[allow(unused_use, duplicate_alias, lint(public_random))]
module my_game::my_game {
    // Use necessary modules and types
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random, new_generator};
    use task2::faucet_coin::{FAUCET_COIN};
    use 0x1::bcs::{};

    // Constants in ALL_CAPS with underscores
    const BALANCE_VALUE_SMALL: u64 = 1000;

    /// Struct representing a reward pool with a unique ID and balance
    public struct RewardPool has key, store {
        id: UID,
        balance: Balance<FAUCET_COIN>,
    }

    /// Struct representing the owner with a unique ID
    public struct Owner has key {
        id: UID,
    }

    /// Initializes the reward pool and assigns ownership
    fun init(ctx: &mut TxContext) {
        // Create a new reward pool with zero balance
        let reward_pool = RewardPool { id: object::new(ctx), balance: balance::zero(), };
        // Share the reward pool object
        transfer::share_object(reward_pool);

        // Create a new owner object
        let owner = Owner { id: object::new(ctx) };
        // Transfer ownership to the sender
        transfer::transfer(owner, tx_context::sender(ctx));
    }

    /// Deposits a specified amount into the reward pool from the given coin
    public entry fun deposit(reward: &mut RewardPool, coin: &mut Coin<FAUCET_COIN>, amount: u64) {
        // Ensure the coin has enough value for the deposit amount
        assert!(coin::value(coin) >= amount, BALANCE_VALUE_SMALL);

        // Split the coin balance to get the deposit amount
        let split_balance = balance::split(coin::balance_mut(coin), amount);
        // Join the split balance into the reward pool's balance
        balance::join(&mut reward.balance, split_balance);
    }

    /// Withdraws a specified amount from the reward pool to the owner
    entry fun withdraw(reward: &mut RewardPool, amount: u64, _: &mut Owner, ctx: &mut TxContext) {
        // Ensure the reward pool has enough balance for the withdrawal
        assert!(reward.balance.value() >= amount, BALANCE_VALUE_SMALL);

        // Take the amount from the reward pool's balance
        let recv_balance = coin::take(&mut reward.balance, amount, ctx);
        // Transfer the withdrawn amount to the sender
        transfer::public_transfer(recv_balance, tx_context::sender(ctx));
    }

    /// Plays a game where the user guesses a boolean value
    public entry fun game(
        reward_pool: &mut RewardPool,
        coin: &mut Coin<FAUCET_COIN>,
        amount: u64,
        guess: bool,
        rand: &Random,
        ctx: &mut TxContext
    ) {
        // Ensure the coin has enough value to place the bet
        assert!(coin::value(coin) >= amount, BALANCE_VALUE_SMALL);

        // Create a new random number generator
        let mut generator = new_generator(rand, ctx);
        // Generate a random number between 0 and 1
        let result = random::generate_u8_in_range(&mut generator, 0, 1);

        // Convert the random result to a boolean
        let flag: bool = result == 1;
        if (flag == guess) {
            // If the guess is correct, reward the player
            let reward = coin::take(&mut reward_pool.balance, amount, ctx);
            coin::join(coin, reward);
        } else {
            // If the guess is incorrect, deposit the amount into the reward pool
            deposit(reward_pool, coin, amount);
        }
    }
}

