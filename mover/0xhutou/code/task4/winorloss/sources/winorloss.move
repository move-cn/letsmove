/// Module: winorloss
module winorloss::winorloss {
    ///use sui::transfer::transfer;
    use sui::balance::{Self, Balance};
    use sui::coin::{Self,Coin};
    use faucet::faucet::FAUCET;
    use sui::random::{Self, Random};
    use sui::tx_context::sender;
    use sui::transfer::{public_transfer, share_object};

    const EOverBalance: u64 = 0;
    const EOnlyOneFAUCET: u64 = 1;
    const EVaultIsEmpty: u64 = 2;


    ///game vault
    public struct Vault has key {
        id: UID,
        faucetbalance: Balance<FAUCET>,
    }

    public struct AdminCap has key {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        let admincap = AdminCap {id: object::new(ctx)};
        let vault = Vault {id: object::new(ctx), faucetbalance: balance::zero<FAUCET>()};

        share_object(vault);

        transfer::transfer(admincap, sender(ctx));
    }

    public entry fun deposit(_: &AdminCap, vault: &mut Vault, faucet: Coin<FAUCET>, _: &mut TxContext){
        let deposit_amount = coin::into_balance(faucet);
        balance::join(&mut vault.faucetbalance, deposit_amount);
    }

    public entry fun withdral(_: &AdminCap, vault: &mut Vault, amount: u64, ctx: &mut TxContext){
        assert!(amount <= balance::value(&vault.faucetbalance), EOverBalance );
        let withdral_amount = balance::split(&mut vault.faucetbalance, amount);
        public_transfer(coin::from_balance(withdral_amount, ctx), sender(ctx));
    }

    entry fun gameplay(r: &Random, vault: &mut Vault, inputcoin: Coin<FAUCET>, guess: bool, ctx: &mut TxContext){
        
        // check_if_the_vault_balance_is_enough_to_pay_for_winner
        assert!(balance::value(&vault.faucetbalance) >= 10000000, EVaultIsEmpty);

        let balance_dewrap = coin::into_balance(inputcoin);
        assert!(balance::value(&balance_dewrap) == 10000000, EOnlyOneFAUCET);
        balance::join(&mut vault.faucetbalance, balance_dewrap);


        let mut generator = random::new_generator(r, ctx);
        let random_result = random::generate_bool(&mut generator);
        if (guess == random_result)
        {
            let winback = balance::split(&mut vault.faucetbalance, 20000000);
            public_transfer(coin::from_balance(winback, ctx), sender(ctx));
        };
    }

}
