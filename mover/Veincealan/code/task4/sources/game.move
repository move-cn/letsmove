module task4::game {
    use sui::coin::{Self, Coin};
    use task2::iusd_Faucet::IUSD_FAUCET;
    use sui::balance::{Self, Balance};
    use sui::random::{Self, Random};
    use std::debug;
    use std::string;
    const EUserInsufficientBalance: u64 = 1000;
    const EGameInsufficientBalance: u64 = 1001;

    public struct Game has key {
        id: UID,
        balance: Balance<IUSD_FAUCET>,
    }

    public struct Admin has key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        let game = Game {
            id: object::new(ctx),
            balance: balance::zero(),
        };
        transfer::share_object(game);

        let admin = Admin {id: object::new(ctx)};
        transfer::transfer(admin, ctx.sender());
    }

    public entry fun Deposit(
        game: &mut Game,
        coin: &mut Coin<IUSD_FAUCET>,
        amount: u64,
    ) {
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );
        let split_balance = balance::split(coin::balance_mut(coin), amount);
        balance::join(&mut game.balance, split_balance);
    }

    // 只有管理员能够提现
    public entry fun Withdraw(
        game: &mut Game,
        _: &Admin,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(
            game.balance.value() >= amount,
            EGameInsufficientBalance
        );
        let cash = coin::take(&mut game.balance, amount, ctx);
        transfer::public_transfer(cash, ctx.sender());
    }

    // 如果用户猜对了，获得双倍奖励。如果用户猜错了，损失投入的代币

    public entry fun Play(
        game: &mut Game,
        rnd: &Random,
        guess: bool,
        coin: &mut Coin<IUSD_FAUCET>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        // 检查合约余额是否充足，确保用户获胜时有足够金额奖励
        assert!(
            game.balance.value() >= 2 * amount,
            EGameInsufficientBalance
        );
        // 检查用户的余额是否充足
        assert!(
            coin::value(coin) >= amount,
            EUserInsufficientBalance
        );

        // 生成随机数
        let mut gen = random::new_generator(rnd, ctx);
        let flag = random::generate_bool(&mut gen);

        // 如果获胜
        if (flag == guess) {
            // 投入的代币不变，另外奖励等额的代币
            let reward = coin::take(&mut game.balance, 2 * amount, ctx);
            coin::join(coin, reward);
            // 输出github id
            string::utf8(b"Veincealan is sad because you won the game and took the prize money.");
        }
        // 猜错了就损失投入的代币
        else {
            Self::Deposit(game, coin, amount);
            string::utf8(b"Veincealan is happy because you lost your principal.");
        }
    }
}

//Play-mainnet
/*
sui client call --package 0xc1e5ad7464b4816ce73ffec8752eeaa068306836909081736ce5d6dff0b98748 --module game --function Play --args 0x2090934e5c863eba3123005a374a5456ea4e1080d594afaebe3d4e844caa4a5c 0x8 true 0xcc1b3d887bd59599565e296493acfb632767259b2fe4e8361735060f7b04ab9f 8000000000 
--gas-budget 1000000
*/

//Deposit-mainnet
/*
sui client call 
--package 0xc1e5ad7464b4816ce73ffec8752eeaa068306836909081736ce5d6dff0b98748 
--module game --function Deposit 
--args 0x2090934e5c863eba3123005a374a5456ea4e1080d594afaebe3d4e844caa4a5c 0xcc1b3d887bd59599565e296493acfb632767259b2fe4e8361735060f7b04ab9f 488000000000 
--gas-budget 1000000
*/

//Withdraw-mainnet
/*
sui client call --package 0xc1e5ad7464b4816ce73ffec8752eeaa068306836909081736ce5d6dff0b98748 --module game --function Withdraw --args 0x2090934e5c863eba3123005a374a5456ea4e1080d594afaebe3d4e844caa4a5c 0x2900c761604ec24792faf75a9b288af4f942a52c49b4b05e49d46f1f5ba36535 472000000000 
--gas-budget 1000000
*/

//Play-testnet
/*
sui client call 
--package 0xe6f28e7bd5782928c59f3b85ab6c243de3c9be8182d6feab34948c85bfaa9858 
--module game 
--function Play 
--args 0xe4bd680ffa42484f65b1c2b2c40c177fadf47b9efd642353b1c6e4fb28940d6f 0x8 true 0x88c9520c30bc48beac7eb388d79213be32d0ae66bdd918398a8180c144b3df2e 8000000000 
--gas-budget 1000000
*/

//Deposit-testnet
/*
sui client call 
--package 0xe6f28e7bd5782928c59f3b85ab6c243de3c9be8182d6feab34948c85bfaa9858 
--module game --function Deposit 
--args 0xe4bd680ffa42484f65b1c2b2c40c177fadf47b9efd642353b1c6e4fb28940d6f 0x21ab8fe8ce147d335496db0cac2c6ba16a07f3bff47d1ae86d5ab72967b1fdb7 488000000000 
--gas-budget 1000000
*/

//Withdraw-testnet
/*
sui client call --package 0xe6f28e7bd5782928c59f3b85ab6c243de3c9be8182d6feab34948c85bfaa9858 --module game --function Withdraw --args 0xe4bd680ffa42484f65b1c2b2c40c177fadf47b9efd642353b1c6e4fb28940d6f 0x7d4ae89956552ae48931c0d144c79b36ed1522c978706ae5e39ec685e12d92a8 496000000000 
--gas-budget 1000000
*/