module task4::guess_number {
    use sui::event;
    use std::debug;
    use std::hash::sha3_256;
    use std::string::{Self};
    use sui::balance::{Self, Balance, zero};
    use sui::clock::{Self, Clock};
    use sui::transfer;
    use sui::coin::{Self, Coin};
    use sui::object;
    use sui::object::{UID, delete};
    use std::vector;
    use sui::transfer::{share_object, transfer};
    use sui::tx_context::{Self, TxContext};


    const EInvaildNumber: u64 = 1;
    const EBanlanceNotEnough: u64 = 2;
    const ENotAuth: u64 = 3;
    const NAME: vector<u8> = b"fengnian9527";
    const ONE_SUI: u64 = 1000_000;



    public struct GuessGameResult has drop, copy {
        you_number: u64,
        game_number: u64,
        output: string::String,
    }

    public struct AdminCap has key {
        id: UID,
    }

    public struct Pool<phantom T> has key{
        id: UID,
        balance: Balance<T>
    }


    fun init(ctx: &mut TxContext) {
        let adminCap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(adminCap, tx_context::sender(ctx));
    }

    public entry fun createPool<T>( _: &AdminCap,ctx: &mut TxContext) {
        let pool = Pool<T>{
            id: object::new(ctx),
            balance: zero<T>()
        };
        transfer::share_object(pool);
    }


    // 充值
    public entry fun depoist<T>(pool: &mut Pool<T>, depositCoin: Coin<T>, _: &mut TxContext) {
        let pay_balance = coin::into_balance(depositCoin);
        balance::join<T>(&mut pool.balance, pay_balance);
    }

    // 提现
    public entry  fun withdraw<T>(adminCap: &AdminCap, pool: Pool<T> ,ctx : &mut TxContext){
        let owner_address =  object::id_address(adminCap);
        assert!(owner_address == tx_context::sender(ctx),ENotAuth);
        let Pool{id, balance } = pool;
        let pool_balance = coin::from_balance<T>(balance, ctx);
        delete(id);
        transfer::public_transfer(pool_balance, tx_context::sender(ctx));
    }


    /**
    *  玩游戏猜数
    *  说出0-9的数字，如果你的数字和系统随机数一样，你就赢了
    *  你将支付1SUI参与游戏，如果你赢了，你将获得2个SUI 奖励
    */
    public entry fun play<T>(pay: Coin<T>, pool: &mut Pool<T>, number: u64, clock: &Clock, ctx: &mut TxContext) {
        assert!(number >= 0 && number < 10, EInvaildNumber);

        let game_number = random(clock);

        let out_put = if (game_number == number) {
            let mut  win_coin = coin::take(&mut pool.balance, ONE_SUI, ctx);
            coin::join(&mut win_coin, pay);
            //发送奖励
            transfer::public_transfer(win_coin, tx_context::sender(ctx));
            string::utf8(b"You Win!")
        }else {
            coin::put(&mut pool.balance, pay);
            string::utf8(b"You Lose!")
        };
        let result = GuessGameResult {
            you_number: number,
            game_number: game_number,
            output: out_put
        };
        event::emit(result);
    }

    /**
     * 根据时间戳 * 名字hash后的数 取余
     * @brief 生成随机数
     * @param clock 时钟
     * @return u64 随机数
    */
    fun random(clock: &Clock): u64 {
        let val = (vector::pop_back<u8>( &mut sha3_256(NAME)) as u64);
        let random_value = ((clock::timestamp_ms(clock) * val % 10) as u64);
        debug::print(&random_value);
        random_value
    }
}