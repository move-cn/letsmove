
/// Module: phigrosx_swap
module Phigrosx_swap::Phigrosx_swap {

    use sui::balance;
    use sui::coin;
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    //PackageID: 0x6715620f619b7ac88e5c114a4c63c779239d26cf70319d77f6b99f2b15470d3b
    // transaction block: 6ANUoGk3vXgWFqAUUuP2TWbkMv1BneHMzGwWSJJcmzUK


    // exchange pool
    public struct Pool<phantom PhigrosX_coin, phantom PhigrosX_Faucet_coin> has store, key {
        id: UID,
        // balances of two types of coins
        phigrosx_coin: balance::Balance<PhigrosX_coin>,
        phigrosx_faucet_coin: balance::Balance<PhigrosX_Faucet_coin>,
        // only used to indentify the owner
        owner: address
    }

    //not the owner
    const INVALIDOWNER: u64 = 1;

    // initialize a default pool
    public entry fun createPool<PhigrosX_coin, PhigrosX_Faucet_coin>(ctx: &mut TxContext){
        let pool = Pool<PhigrosX_coin, PhigrosX_Faucet_coin>{
            id: object::new(ctx),
            phigrosx_coin: balance::zero<PhigrosX_coin>(),
            phigrosx_faucet_coin: balance::zero<PhigrosX_Faucet_coin>(),
            owner: sender(ctx)
        };
        // make it shared object
        transfer::public_share_object(pool);
    }

    // add some coins to the pool, use the amount to split
    public entry fun addCoins<PhigrosX_coin, PhigrosX_Faucet_coin>(pool: &mut Pool<PhigrosX_coin, PhigrosX_Faucet_coin>, mut pc: coin::Coin<PhigrosX_coin>, mut pfc: coin::Coin<PhigrosX_Faucet_coin>, pc_amount: u64, pfc_amount: u64, ctx: &mut TxContext){
        // only the owner can do
        assert!(pool.owner == sender(ctx), INVALIDOWNER);
        // spilt and input as balance into the pool
        let pc_input = coin::split(&mut pc, pc_amount, ctx);
        coin::put(&mut pool.phigrosx_coin, pc_input);
        let pfc_input = coin::split(&mut pfc, pfc_amount, ctx);
        coin::put(&mut pool.phigrosx_faucet_coin, pfc_input);
        // return the left coin back to the owner
        transfer::public_transfer(pc, sender(ctx));
        transfer::public_transfer(pfc, sender(ctx));
    }

    // swaping functions, the ratio is 1:1
    // swap some PhigrosX_coin through PhigrosX_Faucet_coin with certain amount
    public entry fun swap_PhigrosX_coin<PhigrosX_coin, PhigrosX_Faucet_coin>(pool: &mut Pool<PhigrosX_coin, PhigrosX_Faucet_coin>, mut pfc: coin::Coin<PhigrosX_Faucet_coin>, pfc_amount:u64, ctx: &mut TxContext){
        // split the input coin and input into the pool
        let coin_input = coin::split(&mut pfc, pfc_amount, ctx);
        coin::put(&mut pool.phigrosx_faucet_coin, coin_input);
        // transfer the phigrosX_coin to sender
        let to_coin = coin::take(&mut pool.phigrosx_coin, pfc_amount, ctx);
        transfer::public_transfer(to_coin, sender(ctx));
        // return the left coins back to the sender
        transfer::public_transfer(pfc, sender(ctx));
    }

    public entry fun swap_PhigrosX_Faucet_coin<PhigrosX_coin, PhigrosX_Faucet_coin>(pool: &mut Pool<PhigrosX_coin, PhigrosX_Faucet_coin>, mut pc: coin::Coin<PhigrosX_coin>, pc_amount:u64, ctx: &mut TxContext){
        let coin_input = coin::split(&mut pc, pc_amount, ctx);
        coin::put(&mut pool.phigrosx_coin, coin_input);
        let to_coin = coin::take(&mut pool.phigrosx_faucet_coin, pc_amount, ctx);
        transfer::public_transfer(to_coin, sender(ctx));
        transfer::public_transfer(pc, sender(ctx));
    }
}

