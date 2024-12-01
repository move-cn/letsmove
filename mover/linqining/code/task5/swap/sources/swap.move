module swap::swap;
use sui::vec_map::{VecMap};
use sui::balance::{Balance, Balance, Balance};
use sui::object;
use sui::transfer;
// use sui::coin::{Coin};
use faucet_coin::eig::{EIG};
use my_coin::usd::{USD};


public struct Swap {

}

public struct AdminCap has key{
    id: UID
}

public struct Bank has key{
    id:UID,
    usd:Balance<USD>,
    eig:Balance<EIG>,
}




fun init(ctx: &mut TxContext){
    let admin_cap = AdminCap{
        id:object::new(ctx),
    };
    transfer(admin_cap,ctx.sender())
}

