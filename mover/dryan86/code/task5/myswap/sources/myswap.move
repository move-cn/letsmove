module myswap::myswap;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::transfer::{share_object, public_transfer, transfer};

public struct BankDryan07<phantom CoinA, phantom CoinB> has key{
    id: UID,
    coin_a:Balance<CoinA>,
    coin_b:Balance<CoinB>,
    x:u64,
    y:u64,
}

public struct AdminCap has key{
    id:UID
}

fun init(ctx: &mut TxContext){
    // admin cap
    let admin_cap = AdminCap{
        id:object::new(ctx),
    };
    transfer(admin_cap, ctx.sender());
}

public fun add_bank<CoinA, CoinB>(_: &AdminCap, x:u64, y:u64, ctx: &mut TxContext){
    let bank = BankDryan07<CoinA, CoinB>{
        id:object::new(ctx),
        coin_a:balance::zero(),
        coin_b:balance::zero(),
        x,
        y,
    };

    share_object(bank);
}

// 存钱
public fun add_coin_a<CoinA, CoinB>(bank: &mut BankDryan07<CoinA, CoinB>, in:Coin<CoinA>, _:&mut TxContext){
    bank.coin_a.join(coin::into_balance(in));
}

public  fun add_coin_b<CoinA, CoinB>(bank:&mut BankDryan07<CoinA, CoinB>, in:Coin<CoinB>, _:&mut TxContext){
    bank.coin_b.join(coin::into_balance(in));
}

// 交换
public fun a_to_b<CoinA, CoinB>(bank: &mut BankDryan07<CoinA, CoinB>, in:Coin<CoinA>, ctx:&mut TxContext){
    let a_amt = in.value();
    let b_amt = a_amt * bank.x / bank.y;

    bank.coin_a.join(coin::into_balance(in));

    let b_bal  = bank.coin_b.split(b_amt);

    public_transfer(coin::from_balance(b_bal, ctx), ctx.sender());
}

public fun b_to_a<CoinA, CoinB>(bank: &mut BankDryan07<CoinA, CoinB>, in:Coin<CoinB>, ctx:&mut TxContext){
    let b_amt = in.value();
    let a_amt = b_amt * bank.y / bank.x;

    bank.coin_b.join(coin::into_balance(in));

    let a_bal  = bank.coin_a.split(a_amt);

    public_transfer(coin::from_balance(a_bal, ctx), ctx.sender());
}

// 取钱
public fun remove_a<CoinA, CoinB>(_:&AdminCap, bank: &mut BankDryan07<CoinA, CoinB>, amt:u64, ctx:&mut TxContext){
    let a_bal = bank.coin_a.split(amt);
    public_transfer(coin::from_balance(a_bal, ctx), ctx.sender());
}

public fun remove_b<CoinA, CoinB>(_:&AdminCap, bank: &mut BankDryan07<CoinA, CoinB>, amt:u64, ctx:&mut TxContext){
    let b_bal = bank.coin_b.split((amt));
    public_transfer(coin::from_balance(b_bal, ctx), ctx.sender());
}
