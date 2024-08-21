/// Module: chenyanxun_swap
module chenyanxun_swap::chenyanxun_swap {
    // 引入依赖
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use share_coin::share_coin::{SHARE_COIN};
    use my_coin::my_coin::{MY_COIN};

    // 错误码--兑换者用来兑换的COIN余额不足
    const ECOINENOUGH: u64 = 1;
    // 错误码--bank
    const EBANKENOUGH: u64 = 2;

    // bank结构体--使用者、my_coin余额、share_coin余额、兑换比例 1个my_coin兑换2个share_coin、每次兑换手续费消耗1个my_coin或者2个share_coin
    public struct Bank has copy, drop {
        user: address,
        my_coin_balance: Balance<MY_COIN>,
        share_coin_balance: Balance<SHARE_COIN>,
        rate: u8,
        fee: u64
    }
    // 兑换结果结构体
    public struct Result has copy, drop {
        user: address,
        from_coin: String,
        to_coin: String,
        amount: u64
    }

    // 管理员
    public struct Admin has key {
        id: UID
    }

    // 初始化
    public fun init(otw: Admin, ctx: &mut TxContext) {
        // 初始化一个银行
        let bank = Bank {
            user: ctx.sender(),
            my_coin_balance: balance::zero<MY_COIN>(),
            share_coin_balance: balance::zero<MY_COIN>(),
            rate: 2,
            fee: 1
        };

        // 分享
        transfer::share_object(bank);
        let admin = Admin {
            id: object::new(ctx)
        };
        // 转移
        transfer::transfer(admin_cap, ctx.sender());
    }

    // 方法 my_coin兑换share_coin 1个兑换2个，手续费兑换一次1个my_coin 参数：bank、MY_COIN、用来兑换的MY_COIN数量
    public entry fun mycoin_swap_sharecoin(bank:&mut Bank, my_coin: Coin<MY_COIN>, amount: u64, ctx: &mut TxContext) {
        // 判断用来兑换的MY_COIN数量是否足够，需要包含手续费
        let mut my_coin_balance = my_coin.value();
        assert!(my_coin_balance >= (amount+1), ECOINENOUGH);
        // 判断bank是否有足够可兑换的SHARE_COIN
        let bank_share_coin_balance = bank.share_coin_balance.value();
        assert!(bank_share_coin_balance >= amount*2,EBANKENOUGH);

        // 把需要兑换的MY_COIN数量拆分出来，bank合并MY_COIN和手续费,剩余的MY_COIN还回去
        let join_coin = coin.split(my_coin, (amount+1));
        bank.my_coin_balance.join(join_coin.value());
        let refund_coin = coin::from_balance(coin, ctx);
        transfer::public_transfer(refund_coin, ctx.sender());

        // bank把兑换的SHARE_COIN拆出来，兑换者合并
        let share_coin = coin::take(&mut bank.share_coin_balance, amount*2, ctx);
        transfer::public_transfer(share_coin, ctx.sender());

        // 广播
        event::emit(Result{
            user: ctx.sender(),
            from_coin: utf::String(b"MY_COIN"),
            to_coin: utf::String(b"SHARE_COIN"),
            amount
        })
    }

    // 方法 share_coin兑换my_coin 2个兑换1个，手续费兑换一次2个share_coin 参数：bank、SHARE_COIN、用来兑换的SHARE_COIN数量
    public entry fun sharecoin_swap_mycoin (bank: &mut Bank, share_coin: Coin<SHARE_COIN>, amount: u64, ctx: &mut TxContext) {
        // 判断用来兑换的代币数量是否足够
        let mut share_coin_balance = coin::balance(share_coin);
        assert!(share_coin_balance.value() > (amount+2), ECOINENOUGH);
        // 判断bank中的代币是否足够
        let mut bank_my_coin_balance = bank.my_coin_balance.value();
        assert!(bank_my_coin_balance >= (amount/2), EBANKENOUGH);
    }
}

