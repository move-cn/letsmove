/*
#[test_only]
module chee_game_dice::chee_game_dice_tests;
// uncomment this line to import the module
// use chee_game_dice::chee_game_dice;

const ENotImplemented: u64 = 0;

#[test]
fun test_chee_game_dice() {
    // pass
}

#[test, expected_failure(abort_code = ::chee_game_dice::chee_game_dice_tests::ENotImplemented)]
fun test_chee_game_dice_fail() {
    abort ENotImplemented
}
*/


 module  chee_game_dice::chee_game_dice_tests;


// use sui::random;
// use sui::random::Random;
// use sui::balance;
// use sui::balance::Balance;
// use sui::transfer::public_transfer;
// use sui::coin;
// use sui::coin::Coin;
// use sui::object;
// use sui::test_scenario;
// use sui::tx_context::TxContext;
// use chee_game_dice::chee_game_dice::{Game, CheeCoin, play, add_coin, remove_coin};

// // === Test Initialization ===
// #[test]
// fun test_init() { 
//     let account = @0xa97451236151a06f8a33d1711d85f0eee5c3c273cd2aaaa28831d4c3b3f16efb;
//     let mut ctx = test_scenario::begin(account);

//     // 初始化游戏
//     let game = chee_game_dice::chee_game_dice::Game {
//         id: object::new(&mut ctx),
//         balance: balance::zero<CheeCoin>(), 
//         admin: testing::address_of(&test_signer),
//     };


//     // 检查游戏对象是否创建成功
//     let game = test_scenario::take_created<Game>(&mut ctx);
//     assert!(game.admin == admin, 0x201);
//     assert!(balance::value(&game.balance) == 0, 0x202);
// }

// // === Test Adding Coins ===
// #[test]
// fun test_add_coin() {
//     let mut ctx = test_scenario::begin();
//     init(&mut ctx);
//     let mut game = test_scenario::take_created<Game>(&mut ctx);

//     // 创建 CheeCoin 代币
//     let coin = coin::mint<CheeCoin>(100, &mut ctx);

//     // 充值到游戏
//     add_coin(&mut game, coin, &mut ctx);
//     assert!(balance::value(&game.balance) == 100, 0x203);
// }

// // === Test Play Game ===
// #[test]
// fun test_play() {
//     let account = @0xa97451236151a06f8a33d1711d85f0eee5c3c273cd2aaaa28831d4c3b3f16efb;
//     let mut ctx = test_scenario::begin(account);
//     init(&mut ctx);
//     let mut game = test_scenario::take_created<Game>(&mut ctx);

//     // 给游戏存入 1000 CheeCoin
//     let game_coin = coin::mint<CheeCoin>(1000, &mut ctx);
//     add_coin(&mut game, game_coin, &mut ctx);

//     // 生成玩家下注的 CheeCoin
//     let player_coin = coin::mint<CheeCoin>(100, &mut ctx);

//     // 创建随机数生成器
//     let mut rand = random::new(ctx.id());

//     // 记录初始余额
//     let game_balance_before = balance::value(&game.balance);

//     // 玩家下注，猜大小
//     play(&mut game, &mut rand, true, player_coin, &mut ctx);

//     // 记录游戏余额变化
//     let game_balance_after = balance::value(&game.balance);
    
//     // 确保游戏余额变化合理
//     assert!(game_balance_after == game_balance_before + 100 || game_balance_after == game_balance_before - 100, 0x204);
// }

// // === Test Remove Coins (Admin) ===
// #[test]
// fun test_remove_coin() {
//     let mut ctx = test_scenario::begin();
//     init(&mut ctx);
//     let mut game = test_scenario::take_created<Game>(&mut ctx);

//     // 给游戏存入 1000 CheeCoin
//     let game_coin = coin::mint<CheeCoin>(1000, &mut ctx);
//     add_coin(&mut game, game_coin, &mut ctx);

//     // 移除 500 代币
//     remove_coin(&mut game, 500, &mut ctx);

//     // 确保余额减少
//     assert!(balance::value(&game.balance) == 500, 0x205);
// }