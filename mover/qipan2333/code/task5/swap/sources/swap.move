module swap::swap {

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::Coin;
    use sui::transfer::{transfer, share_object, public_transfer};
    use sui::tx_context::{sender};

    public struct AdminCap has key {
        id: UID,
    }

    public struct Bank<phantom CoinA, phantom CoinB> has key {
        id: UID,
        a: Balance<CoinA>,
        b: Balance<CoinB>
    }


    fun init(ctx: &mut TxContext) {

        let admin_cap = AdminCap { id: object::new(ctx) };

        transfer(admin_cap, sender(ctx));
    }


    public entry fun create<CoinA,CoinB>(ctx: &mut TxContext){
        let pool = Bank<CoinA,CoinB>{
            id:object::new(ctx),
            a:balance::zero(),
            b:balance::zero(),
        };
        share_object(pool);
    }

    public entry fun deposit_a<CoinA,CoinB>(bank:&mut Bank<CoinA,CoinB>,a:Coin<CoinA>,_:&mut TxContext){
        let a_balance = coin::into_balance(a);
        balance::join(&mut bank.a,a_balance);
    }

    public entry fun deposit_b<CoinA,CoinB>(bank:&mut Bank<CoinA,CoinB>,b:Coin<CoinB>,_:&mut TxContext){
        let b_balance = coin::into_balance(b);
        balance::join(&mut bank.b,b_balance);
    }

    public entry fun withdraw_a<CoinA,CoinB>(_:&AdminCap, bank:&mut Bank<CoinA,CoinB>, amt:u64, ctx:&mut TxContext){
        let  a_balance = balance::split(&mut bank.a, amt);
        let a = coin::from_balance(a_balance, ctx);
        public_transfer(a, sender(ctx));
    }

    public entry fun withdraw_b<CoinA,CoinB>(_:&AdminCap, bank:&mut Bank<CoinA,CoinB>, amt:u64, ctx:&mut TxContext){
        let  b_balance = balance::split(&mut bank.b, amt);
        let b = coin::from_balance(b_balance, ctx);
        public_transfer(b, sender(ctx));
    }

    public entry fun swap_a_b<CoinA,CoinB>(bank: &mut Bank<CoinA,CoinB>, a: Coin<CoinA>, ctx: &mut TxContext) {
        let amt = coin::value(&a);

        balance::join(&mut bank.a, coin::into_balance(a));


        let amt_b = amt;


        let b_balance = balance::split(&mut bank.b, amt_b);


        let b = coin::from_balance(b_balance, ctx);

        public_transfer(b, sender(ctx));
    }

    public entry fun swap_b_a<CoinA,CoinB>(bank: &mut Bank<CoinA,CoinB>, b: Coin<CoinB>, ctx: &mut TxContext) {
        let amt = coin::value(&b);

        balance::join(&mut bank.b, coin::into_balance(b));


        let amt_a = amt;


        let a_balance = balance::split(&mut bank.a, amt_a);


        let a = coin::from_balance(a_balance, ctx);

        public_transfer(a, sender(ctx));
    }
}

