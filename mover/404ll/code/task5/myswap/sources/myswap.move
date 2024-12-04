module myswap::myswap{

    use sui::balance;
    use sui::balance::Balance;
    use sui::coin;
    use sui::coin::{Coin, from_balance, into_balance};
    use sui::transfer::{share_object, transfer, public_transfer};
    use sui::tx_context::sender;
    use FaucetCoin::FaucetCoin::FAUCETCOIN;
    use FireCoin::FireCoin::FIRECOIN;
   const EOverBalance: u64 = 0;

    public struct Bank has key{
        id: UID,
        mycoin: Balance<FIRECOIN>,
        myfaucetcoin: Balance<FAUCETCOIN>
    }

    public struct AdminCap has key{
        id:object::UID,
    }
    

    //1 mycoin = 7.3 myfaucetcoin


    public entry fun swap_mycoin_to_myfaucetcoin(bank: &mut Bank,  amount: u64,in:Coin<FIRECOIN>,ctx: &mut TxContext) {
        let in_value = coin::value(&in);
        let out_amount = in_value * 73/10;
        balance::join(&mut bank.mycoin, coin::into_balance(in));

        let out_balance = balance::split(&mut bank.myfaucetcoin, out_amount);
        let out_coin = coin::from_balance(out_balance,ctx); 

        public_transfer(out_coin,sender(ctx));

    }

    public entry fun swap_myfaucetcoin_to_mycoin(bank: &mut Bank,  amount: u64,in:Coin<FAUCETCOIN>,ctx: &mut TxContext) {
        let in_value = coin::value(&in);
        let out_amount = in_value * 10/73;
        balance::join(&mut bank.myfaucetcoin, coin::into_balance(in));

        let out_balance = balance::split(&mut bank.mycoin, out_amount);
        let out_coin = coin::from_balance(out_balance,ctx); 

        public_transfer(out_coin,sender(ctx));

    }

    fun init(ctx: &mut TxContext){
        let bank = Bank{
            id:object::new(ctx),
            mycoin:balance::zero<FIRECOIN>(),
            myfaucetcoin:balance::zero<FAUCETCOIN>()
    };  
    share_object(bank);

        let admin_cap = AdminCap{
            id:object::new(ctx),
        };

    transfer(admin_cap,sender(ctx));
    }

    public entry fun deposit_mycoin(bank: &mut Bank,in:Coin<FIRECOIN>,ctx: &mut TxContext){
    let in_balance = into_balance(in);
    balance::join(&mut bank.mycoin, in_balance);
    }

    public entry fun deposit_myfaucetcoin(bank: &mut Bank,in:Coin<FAUCETCOIN>,ctx: &mut TxContext){
    let in_balance = into_balance(in);
    balance::join(&mut bank.myfaucetcoin, in_balance);
    }

    public entry fun withdraw_mycoin(_:&AdminCap,bank: &mut Bank,amount: u64,out: &mut Coin<FIRECOIN>,ctx: &mut TxContext){
    let out_balance = balance::split(&mut bank.mycoin, amount);
    let out_coin = coin::from_balance(out_balance,ctx);
    public_transfer(out_coin,sender(ctx));
    }

    public entry fun withdraw_myfaucetcoin(_:&AdminCap, bank: &mut Bank, amount: u64,out: &mut Coin<FAUCETCOIN>,ctx: &mut TxContext){
    let out_balance =balance::split(&mut bank.myfaucetcoin, amount);
    let out_coin = coin::from_balance(out_balance,ctx);
    public_transfer(out_coin,sender(ctx));
    

    }

    

}