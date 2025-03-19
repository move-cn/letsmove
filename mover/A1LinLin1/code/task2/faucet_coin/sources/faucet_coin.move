/*
/// Module: faucet_coin
module faucet_coin::faucet_coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module faucet_coin::A1LinLin1_faucet_coin {
    use sui::coin::{Self, TreasuryCap, Coin};
    use sui::balance::{Self, Balance};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url; // 导入 url 模块以支持 icon_url 参数

    /// 代币的见证类型，必须与模块名匹配（全大写）
    public struct A1LINLIN1_FAUCET_COIN has drop {}

    /// 水龙头钱包，存储代币余额
    public struct FaucetWallet has key {
        id: UID,
        coin: Balance<A1LINLIN1_FAUCET_COIN>
    }

    /// 初始化函数，创建代币和水龙头钱包
    fun init(witness: A1LINLIN1_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, meta) = coin::create_currency(
            witness,
            6,
            b"A1LinLin1_faucet_coin", // symbol
            b"A1LinLin1_faucet_coin", // name
            b"I love A1LinLin1_faucet_coin. I love blockchains.", // description
            option::none<url::Url>(), // icon_url，使用 none 表示无图标
            ctx
        );
        transfer::public_freeze_object(meta);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        let wallet = FaucetWallet {
            id: object::new(ctx),
            coin: balance::zero()
        };
        transfer::share_object(wallet);
    }

    /// 铸造代币并存入水龙头钱包
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<A1LINLIN1_FAUCET_COIN>,
        wallet: &mut FaucetWallet,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(coin));
    }

    /// 从水龙头领取固定数量的代币（10000 单位）
    public entry fun faucet(
        wallet: &mut FaucetWallet,
        ctx: &mut TxContext
    ) {
        let available = balance::value(&wallet.coin);
        assert!(available >= 10000, 0); // 检查余额是否足够
        let coin = coin::take(&mut wallet.coin, 10000, ctx);
        transfer::public_transfer(coin, tx_context::sender(ctx));
    }
}