module marktranet_game::marktranet_game {
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::event;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::tx_context::sender;
    use sui::random::{Self, Random};

    const EInvalidChoice: u64 = 0;
    const ENotEnoughGold: u64 = 1;
    const ENotEnoughHealth: u64 = 2;
    const EInvalidNumber: u64 = 0;
    const EPoolNotEnough: u64 = 1;
    const EInputNotEnough: u64 = 2;

    public struct GameResult has copy, drop {
        player_health: u64,
        monster_health: u64,
        result: String,
        reward_gold: u64,
        reward_exp: u64,
    }

    public struct Game<phantom T> has key {
        id: UID,
        pool: Balance<T>,
        ticket: u64,
        reward: u64,
        player_health: u64,
        player_attack: u64,
        player_defense: u64,
        player_gold: u64,
        player_exp: u64,
    }

    public struct Monster has copy, drop {
        health: u64,
        attack: u64,
        defense: u64,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
    }
    
    entry fun create_game<T>(ctx: &mut TxContext) {
        let game = Game<T> {
            id: object::new(ctx),
            pool: balance::zero<T>(),
            ticket: 1000,
            reward: 2000,
            player_health: 100,
            player_attack: 10,
            player_defense: 5,
            player_gold: 50,
            player_exp: 0,
        };
        transfer::share_object(game);

        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, sender(ctx));
    }

    fun get_random_monster(clock: &Clock) : Monster {
        let rand = (clock::timestamp_ms(clock) as u64);
        let health = (rand % 50) + 50;
        let attack = (rand % 10) + 5;
        let defense = (rand % 5) + 2;
        Monster { health, attack, defense }
    }

    fun calculate_damage(attack: u64, defense: u64) : u64 {
        if (attack > defense) {
            attack - defense
        } else {
            1
        }
    }

    public entry fun explore<T>(game: &mut Game<T>, input: Coin<T>, clock: &Clock, ctx: &mut TxContext) {
        assert!(balance::value(&game.pool) >= game.reward - game.ticket, EPoolNotEnough);

        let input_value = coin::value(&input);
        assert!(input_value >= game.ticket, EInputNotEnough);

        let mut input_balance = coin::into_balance(input);
        if (input_value > game.ticket) {
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, game.ticket)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else {
            balance::join(&mut game.pool, input_balance);
        };

        let monster = get_random_monster(clock);
        let mut player_health = game.player_health;
        let mut monster_health = monster.health;

        while (player_health > 0 && monster_health > 0) {
            let player_damage = calculate_damage(game.player_attack, monster.defense);
            let monster_damage = calculate_damage(monster.attack, game.player_defense);

            if (player_damage >= monster_health) {
                monster_health = 0;
            } else {
                monster_health = monster_health - player_damage;
            };

            if (monster_damage >= player_health) {
                player_health = 0;
            } else {
                player_health = player_health - monster_damage;
            }
        };

        let (result, reward_gold, reward_exp) = if (player_health > 0) {
            let reward_balance = balance::split(&mut game.pool, game.reward);
            let reward = coin::from_balance(reward_balance, ctx);
            transfer::public_transfer(reward, sender(ctx));
            let gold = game.player_gold + 20;
            let exp = game.player_exp + 10;
            game.player_gold = gold;
            game.player_exp = exp;
            (string::utf8(b"Victory"), 20, 10)
        } else {
            (string::utf8(b"Defeat"), 0, 0)
        };

        game.player_health = player_health;

        event::emit(GameResult {
            player_health,
            monster_health,
            result,
            reward_gold,
            reward_exp,
        });
    }

    public entry fun buy_potion<T>(game: &mut Game<T>, cost: u64, health_gain: u64, ctx: &mut TxContext) {
        assert!(game.player_gold >= cost, ENotEnoughGold);
        let new_player_gold = game.player_gold - cost;
        let new_player_health = game.player_health + health_gain;
        game.player_gold = new_player_gold;
        game.player_health = new_player_health;
    }

    public entry fun deposit<T>(game: &mut Game<T>, input: Coin<T>, amount: u64, ctx: &mut TxContext) {
        let input_value = coin::value(&input);
        assert!(input_value >= amount, ENotEnoughGold);

        let mut input_balance = coin::into_balance(input);
        if (input_value > amount) {
            balance::join(
                &mut game.pool,
                balance::split(&mut input_balance, amount)
            );
            let change = coin::from_balance(input_balance, ctx);
            transfer::public_transfer(change, sender(ctx));
        } else {
            balance::join(&mut game.pool, input_balance);
        }
    }

    public entry fun withdraw<T>(_: &AdminCap, game: &mut Game<T>, amount: u64, ctx: &mut TxContext) {
        let output_balance = balance::split(&mut game.pool, amount);
        let output = coin::from_balance(output_balance, ctx);
        transfer::public_transfer(output, sender(ctx));
    }
}
