
/// Module: task5
module task5::kael777_swap {
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::math;

    // data struct
    const EZeroAmount: u64 = 0;
    // const EWrongFee: u64 = 1;
    const EReservesEmpty: u64 = 2;
    const EPoolFull: u64 = 4;

    const FEE_SCALING: u128 = 10000;
    const FEE_PERCENT: u128 = 30;
    const MAX_POOL_VALUE: u64 = {
        18446744073709551615 / 10000
    };

    public struct LSP<phantom TA, phantom TB> has drop {}

    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        lsp_supply: Supply<LSP<TA, TB>>,
        /// Fee Percent is denominated in basis points.
        fee_percent: u64
    }

    // init
    fun init(_: &mut TxContext) {
    }

    // lp
    entry fun create_pool<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            create_pool_inner(token_a, token_b, ctx),
            tx_context::sender(ctx)
        );
    }

    fun create_pool_inner<TA, TB> (
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {
        let fee_percent = (FEE_PERCENT as u64);

        let token_a_amt = coin::value(&token_a);
        let token_b_amt = coin::value(&token_b);

        assert!(token_a_amt > 0 && token_b_amt > 0, EZeroAmount);
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);

        let share = math::sqrt(token_a_amt) * math::sqrt(token_b_amt);
        let mut lsp_supply = balance::create_supply(LSP<TA, TB> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);

        transfer::share_object(Pool {
            id: object::new(ctx),
            token_a: coin::into_balance(token_a),
            token_b: coin::into_balance(token_b),
            lsp_supply,
            fee_percent,
        });

        coin::from_balance(lsp, ctx)
    }

    entry fun add_liquidity<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            add_liquidity_inner(pool, token_a, token_b, ctx),
            tx_context::sender(ctx)
        )
    }

    fun add_liquidity_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<LSP<TA, TB>> {
        assert!(coin::value(&token_a) > 0 && coin::value(&token_b) > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, lsp_supply) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);

        let token_a_balance = coin::into_balance(token_a);
        let token_b_balance = coin::into_balance(token_b);

        let token_a_added = balance::value(&token_a_balance);
        let token_b_added = balance::value(&token_b_balance);

        // XXX - 可以对新增的流动性进行计算，查看比值是否和原来的比值一致
        // assert!(token_a_added * token_b_amt == token_b_added * token_a_amt, EWrongFee);
        // assert!(math::abs_diff(token_a_added * token_b_amt, token_b_added * token_a_amt) < 100, EWrongFee);

        let share_minted = math::min(
            (token_a_added * lsp_supply) / token_a_amt,
            (token_b_added * lsp_supply) / token_b_amt
        );

        let token_a_amt = balance::join(&mut pool.token_a, token_a_balance);
        let token_b_amt = balance::join(&mut pool.token_b, token_b_balance);

        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, EPoolFull);

        let balance = balance::increase_supply(&mut pool.lsp_supply, share_minted);

        coin::from_balance(balance, ctx)
    }

    entry fun remove_liquidity<TA, TB> (
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ) {
        let (token_a, token_b) = remove_liquidity_inner(pool, lsp, ctx);
        let sender = tx_context::sender(ctx);

        transfer::public_transfer(token_a, sender);
        transfer::public_transfer(token_b, sender);
    }

    fun remove_liquidity_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ): (Coin<TA>, Coin<TB>) {
        let lsp_amount = coin::value(&lsp);
        assert!(lsp_amount > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, total_supply) = get_amounts(pool);

        let token_a = (token_a_amt * lsp_amount) / total_supply;
        let token_b = (token_b_amt * lsp_amount) / total_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        (
            coin::take(&mut pool.token_a, token_a, ctx),
            coin::take(&mut pool.token_b, token_b, ctx),
        )
    }

    // helper function
    entry fun swap_a_to_b<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_a_to_b_inner(pool, token_a, ctx),
            tx_context::sender(ctx)
        )
    }

    fun swap_a_to_b_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ): Coin<TB> {
        let token_a_amt = coin::value(&token_a);
        assert!(token_a_amt > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);

        let token_b_amt = sell_token_a(pool, token_a_amt);

        balance::join(&mut pool.token_a, coin::into_balance(token_a));

        coin::take(&mut pool.token_b, token_b_amt, ctx)
    }

    entry fun swap_b_to_a<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        transfer::public_transfer(
            swap_b_to_a_inner(pool, token_b, ctx),
            tx_context::sender(ctx)
        )
    }

    fun swap_b_to_a_inner<TA, TB> (
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ): Coin<TA> {
        let token_b_amt = coin::value(&token_b);
        assert!(token_b_amt > 0, EZeroAmount);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, EReservesEmpty);

        let token_a_amt = sell_token_b(pool, token_b_amt);

        balance::join(&mut pool.token_b, coin::into_balance(token_b));

        coin::take(&mut pool.token_a, token_a_amt, ctx)
    }

    /// 计算售出指定数量的 Token A，会得到多少数量的 Token B
    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_a_amt,
            token_b_amt,
            pool.fee_percent
        )
    }

    /// 计算售出指定数量的 Token B，会得到多少数量的 Token A
    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_b_amt,
            token_a_amt,
            pool.fee_percent
        )
    }

    /// Get most used values in a handy way:
    /// - amount of token a
    /// - amount of token b
    /// - total supply of LSP
    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    /// Calculate the output amount minus the fee
    /// x, y 分别表示池中两个资产的数量
    /// k 表示常数，代表池中资产的总价值，使用 x * y = k
    /// 当交易发生时，池中资产的总价值应该保持不变
    /// dx, dy  分别表示池中两个资产的变化值
    /// (x + dx) * (y - dy) = k
    public fun calc_output_amount(
        input_amount: u64,
        input_reserve: u64,
        output_reserve: u64,
        fee_percent: u64
    ): u64 {
        let (
            input_amount,
            input_reserve,
            output_reserve,
            fee_percent
        ) = (
            (input_amount as u128),
            (input_reserve as u128),
            (output_reserve as u128),
            (fee_percent as u128),
        );

        // 计算手续费后的输入数量
        let input_with_fee = input_amount * FEE_SCALING / (FEE_SCALING - fee_percent);

        // 根据公式 (x + dx) * (y - dy) = k
        // 得到 dy = y - k / (x + dx)
        let total = input_reserve * output_reserve;
        let output_amount = output_reserve - total / (input_reserve + input_with_fee);

        (output_amount as u64)
    }
}

// test net steps
// coin_a_treasuryCap:0x6a9a9cb43d5e24423bf80e73c09a3a292b78496430bb983f703e14f3f831e9fe
// coin_a_meta:0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A
// coin_b_treasuryCap:0xbfd7f7e1db3e54061f0677b7a7663e2d0a1b0df8bdb060b0c20d9620e23d1a11
// coin_b_meta:0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B
// package_id:0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420

// 1.mint some coins
// # mint COIN_A
// sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_a --function mint --args $COIN_A_TREASURY_CAP_ID 1000 $ADDRESS
// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module coin_a --function mint --args 0x6a9a9cb43d5e24423bf80e73c09a3a292b78496430bb983f703e14f3f831e9fe 1000 0x7dbb2dd54b525b291c4319d0811a8b914f05b7e3d877110fcebd948eede2664c

// # mint COIN_B
// sui client call --gas-budget 7500000 --package $PACKAGE_ID --module coin_b --function mint --args $COIN_B_TREASURY_CAP_ID 10000 $ADDRESS
// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module coin_b --function mint --args 0xbfd7f7e1db3e54061f0677b7a7663e2d0a1b0df8bdb060b0c20d9620e23d1a11 10000 0x7dbb2dd54b525b291c4319d0811a8b914f05b7e3d877110fcebd948eede2664c

// coin_a_id1:0x0ae1f0a7e382a684957365834c47eaa53707721842a26980e438160dd7618181
// coin_a_id2:0x747fa24f30a8ce804d77db268e456e7de4f9738dd4cbe25322eac39a9df86e6b
// coin_a_id3:0x80447baa0ea633fe6d05d88b95049ca216b89e0724ffcb69dff22ff6fffd72b6
// coin_a_id4:0x35e79578983a835c4bb4acfa2573d74cb7fe54b91ac8584bbc7006fd7a21aeb7
// coin_b_id1:0xdaada3b24a1bbb631d35e0a70084c5a984c6cb80d3eda170556a955c34261a58
// coin_b_id2:0x0cef5f86d34efe3d53ecd072a263faf25ca41392d6742e66b7dc2cd84251a6a4
// coin_b_id3:0xaa025ae99b37f8788008cb03d1c86733cb2d7d76277f54f0bad2219ee3aaf93b
// coin_b_id4:0xfcda48b2a00850312f64dd0819e692e825c9e66e72a3c3067584eac646a7c3b8

// 2.将前面铸造的 coin a 1 和 coin b 1 拿来构建流动性池
/*
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module kael777_swap \
    --function create_pool --type-args $COIN_A_META $COIN_B_META \
    --args $COIN_A_ID_1 $COIN_B_ID_1
*/
// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module kael777_swap --function create_pool --type-args 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B --args 0x0ae1f0a7e382a684957365834c47eaa53707721842a26980e438160dd7618181 0xdaada3b24a1bbb631d35e0a70084c5a984c6cb80d3eda170556a955c34261a58

// poolid_1:0xc5ade476343a5dded16d63ce3daf8a54c69767492a1485246e5595c436c8db4e 
// LSP_ID_1:0xea66ecada4384814994ba4e49a6b1dd4d5d7b3c3c2e3d0a98fad4cf93de43b3f

// 3.添加流动性2,3
/*
sui client call --gas-budget 7500000 --package $PACKAGE_ID --module kael777_swap \
    --function add_liquidity --type-args $COIN_A $COIN_B \
    --args $POOL_ID $COIN_A_ID_2 $COIN_B_ID_2
*/

// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module kael777_swap --function add_liquidity --type-args 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B --args 0xc5ade476343a5dded16d63ce3daf8a54c69767492a1485246e5595c436c8db4e 0x747fa24f30a8ce804d77db268e456e7de4f9738dd4cbe25322eac39a9df86e6b 0x0cef5f86d34efe3d53ecd072a263faf25ca41392d6742e66b7dc2cd84251a6a4

// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module kael777_swap --function add_liquidity --type-args 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B --args 0xc5ade476343a5dded16d63ce3daf8a54c69767492a1485246e5595c436c8db4e 0x80447baa0ea633fe6d05d88b95049ca216b89e0724ffcb69dff22ff6fffd72b6 0xaa025ae99b37f8788008cb03d1c86733cb2d7d76277f54f0bad2219ee3aaf93b

// LSP_ID_2:0xb14d56382352d0428f01250e22c157de9c39f29b1503ca622a6e2b50736f7e32

// LSP_ID_3:0x73be97bff52469d6fb71750ad9559125f98a9806796644a232686c130fa1b248

// 4.拿出第三枚 LSP 代币，减少流动性
// sui client call --gas-budget 7500000 --package $PACKAGE_ID --module kael777_swap --function remove_liquidity --type-args $COIN_A $COIN_B --args $POOL_ID $LSP_ID_3
// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module kael777_swap --function remove_liquidity --type-args 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B --args 0x03671c3e9fbd5b385153b4c52a5e1e4e9d81c484a23470ef8bace20e88984887 0x73be97bff52469d6fb71750ad9559125f98a9806796644a232686c130fa1b248

// 减少流动性获得的代币
// coin_a_id5:0xd070e9238ad418778331b8d836dcebcc99e28607d63d4b202568eb828326d6f0 
// coin_b_id5:0x68e585b3a0f3a7756f33d6c7d468a5a7e908cd481fc2b1b4c5c49989a574aea2

// 流动池 coin_a:2,coin_b:20
// 5.交易swap a to b,使用coin_id4
// sui client call --gas-budget 7500000 --package $PACKAGE_ID --module kael777_swap --function swap_a_to_b --type-args $COIN_A $COIN_B --args $POOL_ID $COIN_A_ID_4
// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module kael777_swap --function swap_a_to_b --type-args 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B --args 0xc5ade476343a5dded16d63ce3daf8a54c69767492a1485246e5595c436c8db4e 0x35e79578983a835c4bb4acfa2573d74cb7fe54b91ac8584bbc7006fd7a21aeb7

// swap b to a
// sui client call --gas-budget 7500000 --package 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420 --module kael777_swap --function swap_b_to_a --type-args 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_a::COIN_A 0x5b2b2621a265c0b4e943744dddebd68c13bc77f19059ff8514592c8247b8f420::coin_b::COIN_B --args 0xc5ade476343a5dded16d63ce3daf8a54c69767492a1485246e5595c436c8db4e 0xfcda48b2a00850312f64dd0819e692e825c9e66e72a3c3067584eac646a7c3b8

// mainnet
// coin_a_treasuryCap:0x51c20af45860cf2270960ef581bf2f8c01781f482555b014a63728606aa05c5e
// coin_a_meta:0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A
// coin_b_treasuryCap:0x74fb6a5281881e8f2f9abfebfe2756988f010abd1e65749ec3aaf443ba928bef
// coin_b_meta:0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B
// package_id:0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module coin_a --function mint --args 0x51c20af45860cf2270960ef581bf2f8c01781f482555b014a63728606aa05c5e 1000 0x7dbb2dd54b525b291c4319d0811a8b914f05b7e3d877110fcebd948eede2664c

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module coin_b --function mint --args 0x74fb6a5281881e8f2f9abfebfe2756988f010abd1e65749ec3aaf443ba928bef 10000 0x7dbb2dd54b525b291c4319d0811a8b914f05b7e3d877110fcebd948eede2664c


// coin_a_id1:0xa16362f353543c0fa8f12e00d4f2746f7482e60b57067769c198cd06702577a5
// coin_a_id2:0x750c7683af39e4dfe153455b4f1faf578b93800df27cd84e5b54f35b250bc1da
// coin_a_id3:0x1f6670f04afa2a2a0550132db887193acd317b1e1f423edd110cf0b1eec9d39f
// coin_a_id4:0x89518fbd359842cb63c18773dff84cd9a514013913e0c8eb85ef240ea0b11a4e

// coin_b_id1:0xc7b4876476d79112e2eb0c0df8dec2dc0cea72b577d6c8a29d920d2db49c864b
// coin_b_id2:0xdac0a15b8db458463604e02ad7338d5fd85f7eefce3b4291a9565513d3bde45e
// coin_b_id3:0xe54b8265af12b23cdd350bb8264cbdc3c905a36cab794ebf4ef7ee3b23d84776
// coin_b_id4:0x68c9cd1e307bc68469feb214833e142f7e5c33a33c9a94eb0ba720a09ccaa6e9

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module kael777_swap --function create_pool --type-args 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B --args 0xa16362f353543c0fa8f12e00d4f2746f7482e60b57067769c198cd06702577a5 0xc7b4876476d79112e2eb0c0df8dec2dc0cea72b577d6c8a29d920d2db49c864b

// poolid:0x726cf284f2e7b7f585c1207961d4fcb3bd290719e13126c3c1b42d2e7f0e865a 
// LSP_ID_1:0x77a5fcccf2e36370ce63cfacc7678fa8474fccbc2ea84c0ac28018cd22250e4a
 
// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module kael777_swap --function add_liquidity --type-args 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B --args 0x726cf284f2e7b7f585c1207961d4fcb3bd290719e13126c3c1b42d2e7f0e865a 0x750c7683af39e4dfe153455b4f1faf578b93800df27cd84e5b54f35b250bc1da 0xdac0a15b8db458463604e02ad7338d5fd85f7eefce3b4291a9565513d3bde45e

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module kael777_swap --function add_liquidity --type-args 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B --args 0x726cf284f2e7b7f585c1207961d4fcb3bd290719e13126c3c1b42d2e7f0e865a 0x1f6670f04afa2a2a0550132db887193acd317b1e1f423edd110cf0b1eec9d39f 0xe54b8265af12b23cdd350bb8264cbdc3c905a36cab794ebf4ef7ee3b23d84776

// LSP_ID_2:0x1414a11b3df1645c5e879cb90245822e3b6d400828d30c28b9152fe1e28c0e61
// LSP_ID_3:0x843b231997346299dcec6a13c1c6ff208a3c1f12dfa8cc6327355ab89ca5b35f 

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module kael777_swap --function remove_liquidity --type-args 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B --args 0x726cf284f2e7b7f585c1207961d4fcb3bd290719e13126c3c1b42d2e7f0e865a 0x843b231997346299dcec6a13c1c6ff208a3c1f12dfa8cc6327355ab89ca5b35f

// coin_a_id5:0x57ca067ea11e536a9d17975eef5472a3a653c26dc60f101e76e5ed7010eeeb17 
// coin_b_id5:0x9e9137d607be15515041723a2713e127c735172b1621646712bc7e04dd82ce84

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module kael777_swap --function swap_a_to_b --type-args 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B --args 0x726cf284f2e7b7f585c1207961d4fcb3bd290719e13126c3c1b42d2e7f0e865a 0x89518fbd359842cb63c18773dff84cd9a514013913e0c8eb85ef240ea0b11a4e

// sui client call --gas-budget 7500000 --package 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585 --module kael777_swap --function swap_b_to_a --type-args 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_a::COIN_A 0x1fae26fc5732ed57f19e7b238b15ce4485a9f4700dddd1095807d0d484607585::coin_b::COIN_B --args 0x726cf284f2e7b7f585c1207961d4fcb3bd290719e13126c3c1b42d2e7f0e865a 0x68c9cd1e307bc68469feb214833e142f7e5c33a33c9a94eb0ba720a09ccaa6e9
