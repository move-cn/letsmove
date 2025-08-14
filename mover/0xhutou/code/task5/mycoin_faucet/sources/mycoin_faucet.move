module mycoin_faucet::mycoin_faucet {
    // use faucet::faucet::FAUCET;
    use mycoin::mycoin::MYCOIN;
    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Balance};
    use sui::tx_context::sender;
    use sui::transfer::{public_transfer, share_object};

    const EOverBalance: u64 = 0;

    public struct MyCoinFaucet has key {
        id : UID,
        mycoinbalance: Balance<MYCOIN>,
    }

    public struct AdminCap has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext){
        let shared_faucet_pool = MyCoinFaucet {id: object::new(ctx),mycoinbalance: balance::zero<MYCOIN>()};
        share_object(shared_faucet_pool);

        let admincap = AdminCap {id: object::new(ctx)};
        transfer::transfer(admincap, sender(ctx));
    }

    public entry fun mycoinfaucet(faucet_pool: &mut MyCoinFaucet, ctx: &mut TxContext){
        assert!(balance::value(&faucet_pool.mycoinbalance) <= 10000000 , EOverBalance );
        let withdral_amount = balance::split(&mut faucet_pool.mycoinbalance, 10000000);
        public_transfer(coin::from_balance(withdral_amount, ctx), sender(ctx));
    }

    public entry fun deposit_mycoin(_:&AdminCap, faucet_pool: &mut MyCoinFaucet, deposit_coin: Coin<MYCOIN>, _: &mut TxContext){
        let deposit_amount = coin::into_balance(deposit_coin);
        balance::join(&mut faucet_pool.mycoinbalance, deposit_amount);
    }

}

