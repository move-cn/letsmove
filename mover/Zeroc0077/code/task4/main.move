module game::mygame {
    use game::random;
    use sui::tx_context::{Self, TxContext};
    use sui::object::{Self, UID};
    use sui::coin::{Self, Coin};
    use sui::sui::{SUI};
    use sui::transfer::{Self};
    use sui::balance::{Self, Balance};
    use std::string::{String, utf8};

    struct Mora has key, store {
        id: UID,
        num: u64,
        symbol: String
    }

    struct GamePool has key {
        id: UID,
        balance: Balance<SUI>,
        owner: address
    }

    fun init(ctx: &mut TxContext) {
        let gamepool = GamePool {
            id: object::new(ctx),
            balance: balance::zero<SUI>(),
            owner: tx_context::sender(ctx)
        };
        transfer::share_object(gamepool);
    }

    public entry fun participate(gamepool: &mut GamePool, num: u64, pay: &mut Coin<SUI>, ctx: &mut TxContext) {
        if (num > 2) {
            return
        };
        let user_mora = Mora {
            id: object::new(ctx),
            num: num,
            symbol: utf8(b"")
        };
        if (num == 0) {
            user_mora.symbol = utf8(b"Rock");
        }
        else if (num == 1) {
            user_mora.symbol = utf8(b"Scissors");
        }
        else if (num == 2) {
            user_mora.symbol = utf8(b"Paper");
        };
        transfer::public_transfer(user_mora, tx_context::sender(ctx));

        let b = balance::split(coin::balance_mut(pay), 1_000_000);
        let c = coin::from_balance(b, ctx);
        coin::put(&mut gamepool.balance, c);
    }

    public entry fun battle(gamepool: &mut GamePool, mora: &Mora, ctx: &mut TxContext) {
        let admin_num = random::rand_u64_range(0, 3, ctx);
        if ((mora.num - admin_num) % 3 == 2) {
            let reward = balance::value<SUI>(&gamepool.balance);
            let win = coin::take(&mut gamepool.balance, reward, ctx);
            transfer::public_transfer(win, tx_context::sender(ctx));
        }
    }
}