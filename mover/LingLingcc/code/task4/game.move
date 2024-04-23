module game::mygame {
    use sui::coin;
    use sui::balance::{Self, Balance};
    use std::string::{Self, String};
    use sui::bcs;

    public struct Mora has drop {
        num: u8,
        symbol: String
    }

    public struct MYGAME has drop {}

    public struct GamePool has key, store {
        id: UID,
        balance: Balance<MYGAME>
    }

    fun init(witness: MYGAME, ctx: &mut TxContext) {
        let (mut treasury, metadata) = coin::create_currency(
            witness,
            6,
            b"LingLingcc",
            b"LingLingcc Coin",
            b"Game award coin",
            option::none(),
            ctx
        );
        transfer::public_freeze_object(metadata);
        let gamepool = GamePool {
            id: object::new(ctx),
            balance: coin::mint_balance(&mut treasury, 10000000)
        };
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::share_object(gamepool);
    }

    public entry fun battle(pool: &mut GamePool, num: u8, ctx: &mut TxContext) {
        let mut s1 = string::utf8(b"");
        let num = num % 3;
        if (num == 0) {
            s1 = string::utf8(b"Rock");
        } else if (num == 1) {
            s1 = string::utf8(b"Scissors");
        } else if (num == 2) {
            s1 = string::utf8(b"Paper");
        };
        let user_mora = Mora {
            num: num,
            symbol: s1
        };
        let mut s2 = string::utf8(b"");
        let tx_digest = tx_context::digest(ctx);
        let num2 = (bcs::peel_u64(&mut bcs::new(*tx_digest)) % 3) as u8;
        if (num2 == 0) {
            s2 = string::utf8(b"Rock");
        } else if (num2 == 1) {
            s2 = string::utf8(b"Scissors");
        } else if (num2 == 2) {
            s2 = string::utf8(b"Paper");
        };
        let admin_mora = Mora {
            num: num2,
            symbol: s2
        };
        if ((admin_mora.num - user_mora.num) % 3 == 1) {
            let award = balance::split(&mut pool.balance, 1000000);
            let c = coin::from_balance(award, ctx);
            transfer::public_transfer(c, tx_context::sender(ctx));
        }
    }
}