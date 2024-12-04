module task4::rock_paper_scissors {

    // === Imports ===
    use sui::event::{Self};
    use sui::coin::{Self, Coin};
    use sui::random::{Self, Random};
    use sui::balance::{Self};
    use task4::place::{Self, Place};

    // === Errors ===
    const EGesture: u64 = 0;

    // === Constants ===
    const HeemaleRock: u8 = 0;
    const HeemalePaper: u8 = 1;
    const HeemaleScissors: u8 = 2;
    const Wins: u8 = 0;
    const Draws: u8 = 1;
    const Losses: u8 = 2;

    // === Event ===
    public struct PlayEvent has copy, drop {
        place: ID,
        player_gesture: u8,
        machine_gesture: u8,
        result: u8,
        odds: u64,
        fee: u64,
        pay: u64,
        award: u64,
    }

    entry fun play<T>(
        place: &mut Place<T>,
        mut pay: Coin<T>,
        player_gesture: u8,
        random: &Random,
        ctx: &mut TxContext
    ) {
        assert!(
            player_gesture == HeemaleRock || player_gesture == HeemalePaper || player_gesture == HeemaleScissors,
            EGesture
        );

        // 机器手势
        let machine_gesture = random_gesture(random, ctx);

        // 判断是否胜利
        let result = is_win(player_gesture, machine_gesture);

        // 赔率
        let odds = place::odds(place);
        // 手续费
        let fee = place::fee(place);
        // 手续费接收人
        let receiver = place::receiver(place);
        // 奖池
        let prize_pool_mut = place::prize_pool_mut(place);

        // 入金数量
        let pay_value = coin::value(&pay);

        // 计算奖金
        if (result == Wins) {
            // 计算奖金
            let total_award_value = pay_value * odds / 10000;

            // 检查奖池是否足够支付奖金
            let balance = balance::value(prize_pool_mut);

            // 实际奖金
            let (actual_award_value, fee_value) = if (balance >= total_award_value) {
                // 计算手续费
                let fee_value = total_award_value * fee / 10000;
                (total_award_value - fee_value, fee_value)
            } else {
                // 计算手续费
                let fee_value = balance * fee / 10000;
                (balance - fee_value, fee_value)
            };

            // 到手奖金比支付的多
            if (actual_award_value > pay_value) {
                coin::join(
                    &mut pay,
                    coin::from_balance(balance::split(prize_pool_mut, actual_award_value - pay_value), ctx)
                );
            };

            // 到手奖金比支付的少
            if (actual_award_value < pay_value) {
                balance::join(prize_pool_mut,
                    coin::into_balance(coin::split(&mut pay, pay_value - actual_award_value, ctx))
                );
            };

            if (fee_value != 0) {
                // 收取手续费
                transfer::public_transfer(coin::from_balance(balance::split(prize_pool_mut, fee_value), ctx), receiver);
            };

            // 发放奖金
            transfer::public_transfer(pay, tx_context::sender(ctx));

            event::emit(PlayEvent {
                place: object::id(place),
                player_gesture,
                machine_gesture,
                result,
                odds,
                fee: fee_value,
                pay: pay_value,
                award: actual_award_value,
            });
        } else {
            // 计算手续费
            let fee_value = pay_value * fee / 10000;

            if (fee != 0) {
                // 收取手续费
                transfer::public_transfer(coin::split(&mut pay, fee_value, ctx), receiver);
            };

            // 剩余的入金并入奖池
            balance::join(prize_pool_mut, coin::into_balance(pay));

            event::emit(PlayEvent {
                place: object::id(place),
                player_gesture,
                machine_gesture,
                result,
                odds,
                fee: fee_value,
                pay: pay_value,
                award: 0,
            });
        };
    }

    fun random_gesture(random: &Random, ctx: &mut TxContext): u8 {
        let mut generator = random::new_generator(random, ctx);
        let random = random::generate_u8_in_range(&mut generator, 0, 2);
        random
    }

    fun is_win(player_gesture: u8, machine_gesture: u8): u8 {
        if (player_gesture == machine_gesture) {
            return Draws
        } else if (
            (player_gesture == HeemaleRock && machine_gesture == HeemaleScissors) ||
                (player_gesture == HeemalePaper && machine_gesture == HeemaleRock) ||
                (player_gesture == HeemaleScissors && machine_gesture == HeemalePaper)) {
            return Wins
        } else {
            return Losses
        }
    }
}