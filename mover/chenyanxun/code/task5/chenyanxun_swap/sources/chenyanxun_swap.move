/// Module: chenyanxun_swap
module chenyanxun_swap::chenyanxun_swap {
    // 引入依赖
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use share_coin::share_coin::{SHARE_COIN};
    use my_coin::my_coin::{MY_COIN};
    use std::string::{String, utf8};
    use sui::event;

    // 错误码--兑换者用来兑换的COIN余额不足
    const ECOINENOUGH: u64 = 1;
    // 错误码--bank
    const EBANKENOUGH: u64 = 2;

    // bank结构体--使用者、my_coin余额、share_coin余额、兑换比例 1个my_coin兑换2个share_coin、每次兑换手续费消耗1个my_coin或者2个share_coin
    public struct Bank has key {
        id: UID,
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
    fun init( ctx: &mut TxContext) {
        // 初始化一个银行
        let bank = Bank {
            id: object::new(ctx),
            my_coin_balance: balance::zero(),
            share_coin_balance: balance::zero(),
            rate: 2,
            fee: 1
        };

        // 分享
        transfer::share_object(bank);
        let admin = Admin {
            id: object::new(ctx)
        };
        // 转移
        transfer::transfer(admin, ctx.sender());
    }

    // 存my_coin
    public entry fun deposit_mycoin(bank: &mut Bank, coin: Coin<MY_COIN>, amount:u64, ctx: &mut TxContext) {
        // 发布者余额
        let mut balance_coin = coin::into_balance(coin);
        // 拆分代币存储到bank
        bank.my_coin_balance.join(balance_coin.split(amount));
        // 剩余代币返回发布者
        let refund_coin = coin::from_balance(balance_coin, ctx);
        transfer::public_transfer(refund_coin, ctx.sender());
    }

    // 方法 my_coin兑换share_coin 1个兑换2个，手续费兑换一次1个my_coin 参数：bank、MY_COIN、用来兑换的MY_COIN数量
    public entry fun mycoin_swap_sharecoin(bank:&mut Bank, my_coin: Coin<MY_COIN>, amount: u64, ctx: &mut TxContext) {
        // 判断用来兑换的MY_COIN数量是否足够，需要包含手续费
        let my_coin_value = my_coin.value();
        assert!(my_coin_value >= (amount+1), ECOINENOUGH);
        // 判断bank是否有足够可兑换的SHARE_COIN
        let bank_share_coin_value = bank.share_coin_balance.value();
        assert!(bank_share_coin_value >= amount*2,EBANKENOUGH);

        // 把需要兑换的MY_COIN数量拆分出来，bank合并MY_COIN和手续费,剩余的MY_COIN还回去
        let mut my_coin_balance = coin::into_balance(my_coin);
        bank.my_coin_balance.join(my_coin_balance.split(amount+1));

        let refund_coin = coin::from_balance(my_coin_balance, ctx);
        transfer::public_transfer(refund_coin, ctx.sender());

        // bank把兑换的SHARE_COIN拆出来，兑换者合并
        let share_coin = coin::take(&mut bank.share_coin_balance, amount*2, ctx);
        transfer::public_transfer(share_coin, ctx.sender());

        // 广播
        event::emit(Result{
            user: ctx.sender(),
            from_coin: utf8(b"MY_COIN"),
            to_coin: utf8(b"SHARE_COIN"),
            amount
        })
    }

    // 方法 share_coin兑换my_coin 2个兑换1个，手续费兑换一次2个share_coin 参数：bank、SHARE_COIN、用来兑换的SHARE_COIN数量
    public entry fun sharecoin_swap_mycoin (bank: &mut Bank, share_coin: Coin<SHARE_COIN>, amount: u64, ctx: &mut TxContext) {
        // 判断用来兑换的代币数量是否足够
        let share_coin_value = share_coin.value();
        assert!(share_coin_value > (amount+2), ECOINENOUGH);
        // 判断bank中的代币是否足够
        let bank_my_coin_value = bank.my_coin_balance.value();
        assert!(bank_my_coin_value >= (amount/2), EBANKENOUGH);

        // 兑换者把需要兑换的SHARE_COIN数量拆分出来，bank合并SHARE_COIN和手续费,剩余的SHARE_COIN还回去
        let mut share_coin_balance = coin::into_balance(share_coin);
        bank.share_coin_balance.join(share_coin_balance.split(amount));
        let refund_coin = coin::from_balance(share_coin_balance, ctx);
        transfer::public_transfer(refund_coin, ctx.sender());

        // bank把兑换的MY_COIN拆出来，兑换者合并
        let my_coin = coin::take(&mut bank.my_coin_balance, amount*2, ctx);
        transfer::public_transfer(my_coin, ctx.sender());

        // 广播
        event::emit(Result{
            user: ctx.sender(),
            from_coin: utf8(b"SHARE_COIN"),
            to_coin: utf8(b"MY_COIN"),
            amount
        })
    }
}
// package id: 0xfca79ed9b1cc25c9015754625b019beed0c468c50f2ad85bafb06cf8c52f0fe9
// bank id: 0xd3ccf32abe7dd65ebe0fbfaba99924abb26edab191bf138c173285626f27ebf6
// 存my_coin
// sui client call --package 0xfca79ed9b1cc25c9015754625b019beed0c468c50f2ad85bafb06cf8c52f0fe9 --module chenyanxun_swap --function deposit_mycoin --args 0xd3ccf32abe7dd65ebe0fbfaba99924abb26edab191bf138c173285626f27ebf6 0x706e119cb68beaf237d07fe1bd2b1e51f705f503cde9f6789cbfc7493dd0a2b1 6

// my_coin 兑换 share_coin
// sui client call --package 0xfca79ed9b1cc25c9015754625b019beed0c468c50f2ad85bafb06cf8c52f0fe9 --module chenyanxun_swap --function mycoin_swap_sharecoin --args 0xd3ccf32abe7dd65ebe0fbfaba99924abb26edab191bf138c173285626f27ebf6 0x178fff703d8ddb6b9c622a64606eda1dffdd32e3134840f5d27ab4ba4bd9b8c5 1
// share_coin 兑换 my_coin
// sui client call --package 0xfca79ed9b1cc25c9015754625b019beed0c468c50f2ad85bafb06cf8c52f0fe9 --module chenyanxun_swap --function sharecoin_swap_mycoin --args 0xd3ccf32abe7dd65ebe0fbfaba99924abb26edab191bf138c173285626f27ebf6 0x6d94da3bb4c3c18a910cf5cd82912ecbefa3f12988042eea18d9d04996f20f52 2
