// /*
// /// Module: task4
// module task4::task4;
// */
//
// // For Move coding conventions, see
// // https://docs.sui.io/concepts/sui-move-concepts/conventions
//
// // 1、掌握怎么存钱 Balace  Coin -> Balance
// // 2、掌握怎么取钱 from_balance   Balance -> Coin
// // 3、掌握交互
//
// module task4::task4{
//     use sui::balance;
//     use sui::balance::Balance;
//     use sui::coin;
//     use sui::coin::Coin;
//     use sui::object;
//     use sui::object::UID;
//     use sui::random;
//     use sui::random::Random;
//     use sui::sui::SUI;
//     use sui::transfer::{share_object, public_transfer, transfer};
//     use sui::tx_context::TxContext;
//     #[test_only]
//     use std::debug::print;
//     #[test_only]
//     use std::string;
//     // use 0x7e81cbf616ef12f9049ede655c0d9ee31283fbe8f15067f749b010c40c280d76::usd::USD;
//
//     public struct Game has key{
//         id: UID,
//         // 在合约存钱都要用 Balance
//         amount: Balance<SUI>
//         // amount: Balance<USD>
//     }
//
//     //权限
//     public struct AdminCap has key{
//         id: UID,
//     }
//
//     fun init(ctx: &mut TxContext) {
//         let game = Game{
//             id: object::new(ctx),
//             amount: balance::zero()
//         };
//
//         //设置游戏所有权
//         share_object(game);
//
//         //将管理员权限给自己
//         let adminCap = AdminCap{id:object::new(ctx)};
//         transfer(adminCap, ctx.sender());
//     }
//
//     // #[test]
//     // fun test() {
//     //     assert!(1 <= 5, 0x10086);
//     //     print(&string::utf8(b"11111"));
//     // }
//
//
//     //玩游戏， game：游戏, rand：随机数 @0x8, in：输入的值（true：正面， false：反面）， amt:参与金额， ctx：当前玩的人
//     entry fun play(game: &mut Game, rand: &Random, in: bool, amt: Coin<SUI>, ctx: &mut TxContext) {
//         //获取用参与金额
//         let amt_num = amt.value();
//         let game_num = game.amount.value();
//
//         //断言，判断奖池金额
//         assert!(game_num >= amt_num, 0x10086);
//         assert!(amt_num <= 5000000000, 0x10087);
//
//
//         //随机生成布尔值
//         let mut gen = random::new_generator(rand, ctx);
//         let flag = random::generate_bool(&mut gen);
//
//         if(in == flag) { //赢 加倍奖励
//             let win_balance = game.amount.split(amt_num);
//             let win_coin = coin::from_balance(win_balance, ctx);
//             public_transfer(win_coin, ctx.sender());
//             public_transfer(amt, ctx.sender());
//         } else { //输 输了就没了
//             //将coin转成balance
//             let amt_balance = coin::into_balance(amt);
//             //将输的钱转到奖池
//             game.amount.join(amt_balance);
//
//         }
//
//     }
//
//     //给奖池加钱
//     public entry fun add_sui(game: &mut Game, amt: Coin<SUI>, _: &mut TxContext) {
//         let amt_balance = coin::into_balance(amt);
//         game.amount.join(amt_balance);
//     }
//
//     //从奖池取钱
//     public entry fun remove_sui(_: &AdminCap, game: &mut Game, amt: u64, ctx: &mut TxContext) {
//         let out_balance = game.amount.split(amt);
//         let out_coin = coin::from_balance(out_balance, ctx);
//         public_transfer(out_coin, ctx.sender());
//     }
//
//     //获取当前奖池余额
//     public entry fun get_pool(game: &mut Game,_: &mut TxContext) : u64{
//         game.amount.value()
//     }
//
// }