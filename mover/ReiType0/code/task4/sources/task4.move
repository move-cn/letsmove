module task4::reitype0_slot_machine_game {
    use std::string::{Self, String};
    use sui::tx_context::{sender};
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::balance::{Self, Balance};
    use sui::event;
    use sui::clock::{Self, Clock};

    const SymbolRange: u8 = 5;  // 每个轮盘的符号范围，假设有0-4共5个符号

    public struct JACKPOT_POOL<phantom T> has key, store {
        id: UID,
        balance: Balance<T>,
    }

    public struct SpinResult has copy, drop, store {
        spin1: u8,
        spin2: u8,
        spin3: u8,
    }

    public struct SlotMachineResultEvent has copy, drop {
        is_win: bool,
        player_spins: SpinResult,
        winning_combination: SpinResult,
        result: String,
    }

    fun init(ctx: &mut TxContext) {
    }

    entry fun create_pool<T> (ctx: &mut TxContext) {
        let pool = JACKPOT_POOL<T> {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(pool)
    }

    fun get_spin_result(clock: &Clock) : SpinResult {
        let timestamp = clock::timestamp_ms(clock);
        let spin1 = ((timestamp % (SymbolRange as u64 + 1)) as u8);
        let spin2 = (((timestamp / 100) % (SymbolRange as u64 + 1)) as u8);
        let spin3 = (((timestamp / 10000) % (SymbolRange as u64 + 1)) as u8);
        SpinResult { spin1, spin2, spin3 }
    }

    entry fun play<T>(clock: &Clock, pool: &mut JACKPOT_POOL<T>, treasury_cap: &mut TreasuryCap<T>, ctx: &mut TxContext) {
        let player_spins = get_spin_result(clock);
        let winning_combination = SpinResult { spin1: 2, spin2: 2, spin3: 2 };  // 设置一个中奖组合

        let (result, is_win) = if (player_spins.spin1 == winning_combination.spin1 && player_spins.spin2 == winning_combination.spin2 && player_spins.spin3 == winning_combination.spin3) {
            (b"Congratulations, you hit the jackpot! Collect your coins😄", true)
        } else {
            (b"Try again, better luck next time!💔", false)
        };

        event::emit(SlotMachineResultEvent {
            result: string::utf8(result),
            is_win,
            player_spins: player_spins,
            winning_combination: winning_combination,
        });

        if (is_win) {
            let all_bouns = balance::withdraw_all(&mut pool.balance);
            let coin = coin::from_balance(all_bouns, ctx);

            transfer::public_transfer(coin, sender(ctx));
        } else {
            let coin = coin::mint(treasury_cap, 1, ctx);
            balance::join(&mut pool.balance, coin::into_balance(coin));
        }
    }
}
