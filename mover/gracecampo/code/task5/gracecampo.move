module gracecampo::gracecampo {
    use std::vector;
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::transfer::{share_object, public_transfer};
    use sui::tx_context::sender;


    /// 金额为0
    const ErrZeroAmount: u64 = 1001;
    ///错误的类型
    const ErrInvalidVecotrType: u64 = 1002;
    ///输入的金额小于0
    const ErrBalanceNotMatch :u64 = 1003;
    ///池子中无足够X代币余额供取出
    const ErrNotEnoughXInPool :u64 = 1004;
    ///池子中无足够Y代币余额供取出
    const ErrNotEnoughYInPool :u64 = 1005;

    ///用户地址无足够数量X/Y代币以供存入
    const ErrNotEnoughBalance :u64 = 1006;
    ///乘积因子
    const PRODUCT_FACTOR :u64 = 10000000;

    ///LP结构体：类型是<phantom X, phantom Y> 拥有drop能力
    public struct LP<phantom X, phantom Y> has drop {
    }

    ///流动性池子结构体
    public struct Pool<phantom X,phantom Y> has key,store{
        id: UID,
        coin_x: Balance<X>,
        coin_y: Balance<Y>,
        lp_supply: Supply<LP<X, Y>>
    }

    ///创建流动性池子
    public entry fun new_pool<X,Y>(ctx: &mut TxContext){
        let pool = Pool<X,Y>{
            id:object::new(ctx),
            coin_x: balance::zero<X>(),
            coin_y: balance::zero<Y>(),
            lp_supply: balance::create_supply(LP{})
        };
        share_object(pool);
    }

    ///添加流动性
    public fun add_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                  coin_x:Coin<X>,
                                  coin_y:Coin<Y>,
                                  ctx: &mut TxContext): Coin<LP<X, Y>>{
        //获取输入的X代币数量
        let coin_x_value = coin_x.value();
        //获取输入的Y代币数量
        let coin_y_value = coin_y.value();
        //判断输入的代币是否为0，需要满足X,Y的代币都大于0
        assert!(coin_x_value > 0 && coin_y_value > 0, ErrZeroAmount);
        //更新流动性池子中X,Y代币的余额
        coin::put(&mut pool.coin_x,coin_x);
        coin::put(&mut pool.coin_y,coin_y);
        //更新lp对象的值
        let lp_bal = pool.lp_supply.increase_supply(coin_x_value+coin_y_value);
        coin::from_balance(lp_bal, ctx)
    }

    ///此函数主用于，验证移除流动性的正确性，以及返回应转移给调用者的代币数量
    public fun remove_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                     lp: &mut Coin<LP<X, Y>>,
                                     vec: vector<u64>,
                                     ctx: &mut TxContext): (Coin<X>, Coin<Y>) {
        assert!(vector::length(&vec)==2,ErrInvalidVecotrType);
        //LP的值
        let lp_balance_value = lp.value();
        //取出X代币的值
        let coin_x_out = vec[0];
        //取出Y代币的值
        let coin_y_out = vec[1];
        //判断池子中代币余额是否满足取出值
        assert!(lp_balance_value == coin_x_out + coin_y_out, ErrBalanceNotMatch);
        assert!(pool.coin_x.value() >= coin_x_out, ErrNotEnoughXInPool);
        assert!(pool.coin_y.value() >= coin_y_out, ErrNotEnoughYInPool);
        //销毁lp取出的供应量
        let lp_split = lp.split( coin_x_out + coin_y_out,ctx);
        pool.lp_supply.decrease_supply(coin::into_balance(lp_split));
        //组装返回值，包含应转移给调用者X,Y代币的数量
        (
            //从池中提取移除数量的X代币
            coin::take(&mut pool.coin_x, coin_x_out, ctx),
            //从池中提取移除数量的Y代币
            coin::take(&mut pool.coin_y, coin_y_out, ctx)
        )
    }
    //供用户调用的存入流动性函数
    public entry fun  deposit_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                             coin_x:&mut Coin<X>,
                                             coin_y:&mut Coin<Y>,
                                             coin_x_amt: u64,
                                             coin_y_amt: u64,
                                             ctx: &mut TxContext){
        //获取调用地址X代币余额
        let  coin_x_balance = coin::balance(coin_x).value();
        //获取调用地址Y代币余额
        let  coin_y_balance = coin::balance(coin_y).value();
        //判断用户输入代币数量是否小于等于地址拥有数量
        assert!(coin_x_balance >= coin_x_amt && coin_y_balance >= coin_y_amt,ErrNotEnoughBalance);
        //调用存入流动性函数
        let coin_x_in = coin_x.split(coin_x_amt, ctx);
        let coin_y_in = coin_y.split(coin_y_amt, ctx);
        let (lp) = add_liquidity(pool,coin_x_in,coin_y_in,ctx);
        //将lp发送给调用者
        transfer::public_transfer(lp, sender(ctx))
    }
    //供用户调用的移除全部流动性函数
    public entry fun  withdraw_liquidity<X,Y>(pool: &mut Pool<X, Y>,
                                              lp: &mut Coin<LP<X, Y>>,
                                              ctx: &mut TxContext){
        //获取流动池LP总供应
        let lp_supply = balance::supply_value(&pool.lp_supply);
        //计算用户输入的LP所占LP总供应份额
        let proportion = (lp.value() * PRODUCT_FACTOR)/lp_supply;
        //计算 X/Y 应提取数量
        let x_out = (pool.coin_x.value() * proportion) / PRODUCT_FACTOR;
        let y_out = (pool.coin_y.value() * proportion) / PRODUCT_FACTOR;
        //组装一个集合,元素为X,Y代币提出的数量
        let mut vec = vector::empty<u64>();
        vector::push_back(&mut vec,x_out);
        vector::push_back(&mut vec,y_out);
        let (coin_x,coin_y) = remove_liquidity(pool,lp,vec,ctx);
        //转移提出的代币数量发送到调用者
        public_transfer(coin_x,sender(ctx));
        public_transfer(coin_y,sender(ctx));
    }

    ///交换X代币到Y代币：因代币数量是1:1 ,就无须计算代币兑换比例
    public entry fun swap_x_to_y<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_x: &mut Coin<X>,
                                       amount: u64,
                                       ctx: &mut TxContext){
        //判断池中是否有足量的代币以供兑换
        assert!(amount < pool.coin_y.value(), ErrNotEnoughYInPool);
        //减去兑换地址X代币的数量
        let x_value = coin_x.split(amount,ctx);
        //将代币数量添加到pool
        coin::put(&mut pool.coin_x, x_value);
        //减去兑换Y代币数量
        let receive_y =  coin::take(&mut pool.coin_y, amount, ctx);
        public_transfer(receive_y,sender(ctx));
    }

    ///交换Y代币到X代币：因代币数量是1:1 ,就无须计算代币兑换比例
    public entry fun swap_y_to_x<X, Y>(pool: &mut Pool<X, Y>,
                                       coin_y: &mut Coin<Y>,
                                       amount: u64,
                                       ctx: &mut TxContext){
        assert!(amount < pool.coin_x.value(), ErrNotEnoughYInPool);
        //池中减去兑换地址Y代币的数量
        let y_value = coin_y.split(amount,ctx);
        //将代币数量添加到pool
        coin::put(&mut pool.coin_y, y_value);
        //池中减去兑换X代币数量
        let receive_x = coin::take(&mut pool.coin_x, amount, ctx);
        public_transfer(receive_x,sender(ctx));
    }
}