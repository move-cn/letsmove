module my_game::a_sky_person_game_decision {
    use sui::balance::{Self, Balance};
    use sui::clock;
    use sui::coin;
    use sui::coin::TreasuryCap;
    use sui::object;
    use sui::transfer;
    use sui::tx_context::sender;

    public struct GameWallet<phantom T> has key {
        id: UID,
        balance: Balance<T>
    }

    /// 初始化游戏钱包.
    public fun init_game_wallet<T>(ctx: &mut TxContext) {
        let game_wallet = GameWallet<T> {
            id: object::new(ctx),
            balance: balance::zero()
        };
        transfer::share_object(game_wallet);
    }

    /// 向游戏钱包里面存入默认100万task2中发行的faucet coin.
    public fun mint_and_transfer_coin_to_game_wallet<T>(
        trasury_cap: &mut TreasuryCap<T>,
        game_wallet: &mut GameWallet<T>,
        ctx: &mut TxContext
    ) {
        let game_coin = coin::mint(trasury_cap, 1000000, ctx);
        balance::join(&mut game_wallet.balance, coin::into_balance(game_coin));
    }

    /// 如果玩家选择的数字(0或1)与随机数相同, 从游戏钱包中取出100万代币并转给玩家.
    public fun choose<T>(
        gamer_num: u64,
        clock: &clock::Clock,
        game_wallet: &mut GameWallet<T>,
        ctx: &mut TxContext
    ) {
        let luky_num: u64 = clock::timestamp_ms(clock) % 2;
        if (gamer_num == luky_num) {
            transfer_bonus_to_gamer<T>(game_wallet, ctx);
        }
    }

    /// 从游戏钱包中取出100万代币并转给玩家.
    fun transfer_bonus_to_gamer<T>(
        game_wallet: &mut GameWallet<T>,
        ctx: &mut TxContext
    ) {
        let game_coin = coin::take(&mut game_wallet.balance, 1000000, ctx);
        transfer::public_transfer(game_coin, sender(ctx));
    }
}
