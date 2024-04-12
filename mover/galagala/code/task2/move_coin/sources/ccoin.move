#[allow(unused_use)]
module move_coin::ccoin {

    use std::option;
    use sui::object;
    use sui::balance::Supply;
    use sui::balance::{Self};
    use sui::object::UID;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{TxContext};

    struct CCOIN has drop {

    }

    //can search can't transfer
    struct CCoinSupply has key {
        id: UID,
        supply: Supply<CCOIN>
    }

    #[allow(unused_use)]
    fun init(witness: CCOIN, ctx: &mut TxContext){

        let (tc, metadata) =
            coin::create_currency<CCOIN>(witness, 8, b"cc", b"CCoin", b"new coin name cc", option::none(),ctx);
        //lock metadata
        transfer::public_freeze_object(metadata);

        let tcSupply = coin::treasury_into_supply(tc);

        let ccs = CCoinSupply{
            id: object::new(ctx),
            supply: tcSupply,
        };

        //all people can req
        transfer::share_object(ccs)
    }

    public entry fun mint(ccSupply: &mut CCoinSupply, num: u64, toAddress: address, ctx: &mut TxContext){
        assert!(num > 0, 0x11);
        let newBalance = balance::increase_supply(&mut ccSupply.supply, num);
        let newCoin = coin::from_balance(newBalance, ctx);
        transfer::public_transfer(newCoin, toAddress);
    }

    public entry fun burn(managedCap: &mut TreasuryCap<CCOIN>, c : Coin<CCOIN>){
        coin::burn(managedCap, c);
    }

}