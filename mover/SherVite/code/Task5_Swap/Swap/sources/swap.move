module swap::swap{
 use sui::balance;
 use sui::balance::Balance;
 use sui::coin;
 use sui::coin::Coin;
 use sui::transfer::{transfer, share_object, public_transfer};
 use task2_coin::oiia_faucet::{OIIA_FAUCET};
 use task2_coin::oiia::{OIIA};
 
 const CoinNotEnough: u64 = 100;
 const FauceOIIANotEnough: u64 = 101;
 const WalletNotEnough: u64 = 102;
 
 public struct AdminCap has key {
     id: UID
 }
 
 // Swap pool
 public struct Swap has key {
     id: UID,
     coin: Balance<OIIA>,
     faucet_coin: Balance<OIIA_FAUCET>
 }
 
 fun init(ctx: &mut TxContext) {
     let adminCap = AdminCap { id: object::new(ctx) };
     let swap = Swap {
         id: object::new(ctx),
         coin: balance::zero<OIIA>(),
         faucet_coin: balance::zero<OIIA_FAUCET>()
     };
     transfer(adminCap, ctx.sender());
     // share the swap pool
     share_object(swap);
 }
 
 
 public entry fun coin_to_faucet(
     swap: &mut Swap,
     in_coin: &mut Coin<OIIA>,
     in_amount: u64,
     ctx: &mut TxContext
 ) {
     // wallet has enough coin
     assert!(in_coin.value() >= in_amount, WalletNotEnough);
     let coin_old_value = swap.coin.value();
     let fauct_coin_old_value = swap.faucet_coin.value();
     let const_value = coin_old_value * fauct_coin_old_value;  
     let coin_new_value = coin_old_value + in_amount;
     // make sure the x total value * y total value = k
     let fauct_coin_new_value = const_value / coin_new_value;
     // the amount of faucet_coin to give
     let out_amount = fauct_coin_old_value - fauct_coin_new_value;
     // swap pool has enough faucet_coin
     assert!(swap.faucet_coin.value() >= out_amount, FauceOIIANotEnough);
     // swap pool add coin
     swap.coin.join(coin::into_balance(in_coin.split(in_amount, ctx)));
     // swap pool give faucet_coin
     let takeCoin = coin::from_balance(swap.faucet_coin.split(out_amount), ctx);
     // transfer to user
     public_transfer(takeCoin, ctx.sender());
 }
 
 public entry fun faucet_to_coin(
     swap: &mut Swap,
     in_coin: &mut Coin<OIIA_FAUCET>,
     in_amount: u64,
     ctx: &mut TxContext
 ) {
     // wallet has enough faucet_coin
     assert!(in_coin.value() >= in_amount, WalletNotEnough);
     let coin_old_value = swap.coin.value();
     let fauct_coin_old_value = swap.faucet_coin.value();
     let const_value = coin_old_value * fauct_coin_old_value;
     let fauct_coin_new_value = fauct_coin_old_value + in_amount;
     let coin_new_value = const_value / fauct_coin_new_value;
     let out_amount = coin_old_value - coin_new_value;
     assert!(swap.coin.value() >= out_amount, CoinNotEnough);
     // swap pool add faucet_coin
     swap.faucet_coin.join(coin::into_balance(in_coin.split(in_amount, ctx)));
     // swap pool give coin
     let out_coin = coin::from_balance(swap.coin.split(out_amount), ctx);
     // transfer to user
     public_transfer(out_coin, ctx.sender());
 }
 
 public entry fun deposit(
     _: &AdminCap,
     swap: &mut Swap,
     coin: &mut Coin<OIIA>,
     coin_amt: u64,
     faucet_coin: &mut Coin<OIIA_FAUCET>,
     faucet_coin_amount: u64,
     ctx: &mut TxContext
 ) {
     if (coin_amt > 0) {
         swap.coin.join(coin::into_balance(coin.split(coin_amt, ctx)));
     };
     if (faucet_coin_amount > 0) {
         swap.faucet_coin.join(coin::into_balance(faucet_coin.split(faucet_coin_amount, ctx)));
     };
 }
 
 
 public entry fun withdraw(
     _: &AdminCap,
     swap: &mut Swap,
     coin_amount: u64,
     faucet_coin_amount: u64,
     ctx: &mut TxContext
 ) {
     if (coin_amount > 0 && swap.coin.value() > 0) {
         let take_coin = coin::from_balance(swap.coin.split(coin_amount), ctx);
         public_transfer(take_coin, ctx.sender());
     };
     if (faucet_coin_amount > 0 && swap.faucet_coin.value() > 0) {
         let take_faucet_coin = coin::from_balance(swap.faucet_coin.split(faucet_coin_amount), ctx);
         public_transfer(take_faucet_coin, ctx.sender());
     };
 }
}