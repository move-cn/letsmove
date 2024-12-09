module helen2022a::coin_swap {

    use sui::balance::{Self, zero, Balance};
    use sui::coin::{Self, Coin};     
    use sui::transfer::{public_transfer, transfer, share_object};
    use std::debug;
    use std::ascii::string;

    // 1 coinA = 5 coinB
    const SWAP_RATE_A_2_B: u64 = 5;

    //银行金额不足
    const EBankInsufficientBalance: u64 = 1001;

    //取款权限
    public struct AdminCap has key {
        id: UID
    }

    //  简单版
    public struct Bank<phantom COIN_A, phantom COIN_B> has key {
        id: UID,
        coin_a: Balance<COIN_A>,
        coin_b: Balance<COIN_B>
    }

    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap { id: object::new(ctx) };
        transfer(adminCap, tx_context::sender(ctx));
    }

    public entry fun createBank<COIN_A, COIN_B>(ctx: &mut TxContext) {
        let bank = Bank {
            id: object::new(ctx),
            coin_a: zero<COIN_A>(),
            coin_b: zero<COIN_B>()
        };
        share_object(bank);
    }

    // 存 coin A
    public entry fun deposit_coin_A<COIN_A, COIN_B>(bank: &mut Bank<COIN_A, COIN_B>, coin_a: Coin<COIN_A>) {
        let balance = coin::into_balance<COIN_A>(coin_a);
        balance::join<COIN_A>(&mut bank.coin_a, balance);
    }

    // 取 coin A
    public entry fun withdraw_coin_A<COIN_A, COIN_B>(_: &AdminCap, bank: &mut Bank<COIN_A, COIN_B>, amount_a : u64, ctx: &mut TxContext) {

        assert!(bank.coin_a.value() >= amount_a, EBankInsufficientBalance );
        let a_balance = balance::split<COIN_A>(&mut bank.coin_a, amount_a);
        let coinA = coin::from_balance<COIN_A>(a_balance, ctx);
        public_transfer(coinA, tx_context::sender(ctx));
    }


    // 存 coin B
    public entry fun deposit_coin_B<COIN_A, COIN_B>(bank: &mut Bank<COIN_A, COIN_B>, coin_b: Coin<COIN_B>) {
        let balance = coin::into_balance<COIN_B>(coin_b);
        balance::join<COIN_B>(&mut bank.coin_b, balance);
    }

    // 取 coin B
    public entry fun withdraw_coin_B<COIN_A, COIN_B>(_: &AdminCap, bank: &mut Bank<COIN_A, COIN_B>, amount_b: u64, ctx: &mut TxContext) {
        assert!(bank.coin_b.value() >= amount_b, EBankInsufficientBalance );
        let b_balance = balance::split<COIN_B>(&mut bank.coin_b, amount_b);
        let coinB = coin::from_balance<COIN_B>(b_balance, ctx);
        public_transfer(coinB, tx_context::sender(ctx));
    }

    // coin A 兑换 coinB
    public entry fun swap_A_to_B<COIN_A, COIN_B>(bank: &mut Bank<COIN_A, COIN_B>, coinA: Coin<COIN_A>, ctx: &mut TxContext) {
        let amount = coin::value<COIN_A>(&coinA);
        let amount_b = amount * SWAP_RATE_A_2_B;
        assert!(bank.coin_b.value() >= amount_b, EBankInsufficientBalance );
        // 减少 b, 发送给兑换人
        let withdraw_b_balance = balance::split<COIN_B>(&mut bank.coin_b, amount_b);
        let coin_b = coin::from_balance<COIN_B>(withdraw_b_balance, ctx);
        public_transfer(coin_b, tx_context::sender(ctx));
        // 增加 a
        let a_balance = coin::into_balance<COIN_A>(coinA);
        balance::join<COIN_A>(&mut bank.coin_a, a_balance);
    }

    public entry fun swap_B_to_A<COIN_A, COIN_B>(bank: &mut Bank<COIN_A, COIN_B>, coinB: Coin<COIN_B>, ctx: &mut TxContext) {
        let amount = coin::value<COIN_B>(&coinB);
        let amount_a = amount / SWAP_RATE_A_2_B;
        assert!(bank.coin_a.value() >= amount_a, EBankInsufficientBalance );
        // 减少 a, 发送给兑换人
        let withdraw_a_balance = balance::split<COIN_A>(&mut bank.coin_a, amount_a);
        let coin_a = coin::from_balance<COIN_A>(withdraw_a_balance, ctx);
        public_transfer(coin_a, tx_context::sender(ctx));
        // 增加 b
        let b_balance = coin::into_balance<COIN_B>(coinB);
        balance::join<COIN_B>(&mut bank.coin_b, b_balance);
        debug::print(&string(b"coinA"));
        debug::print(&balance::value(&bank.coin_a));
        debug::print(&string(b"coinB"));
        debug::print(&balance::value(&bank.coin_b));
    }
}
