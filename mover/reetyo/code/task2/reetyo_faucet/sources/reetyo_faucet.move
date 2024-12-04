/// Module: reetyo_faucet
module reetyo_faucet::reetyo_faucet {
    use sui::balance::{Balance};
    use sui::balance;
    use sui::coin::{Self, TreasuryCap};
    public struct REETYO_FAUCET has drop {}
    public struct PublicWallet has key {
        id: UID,
        coin: Balance<REETYO_FAUCET>,
        faucet_amount: u64,
    }
    const AMOUNT: u64 = 10^12;
    const EFaucetDry: u64 = 1;
    #[allow(lint(share_owned))]
    fun init(witness: REETYO_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<REETYO_FAUCET>(
            witness,
            10,
            b"Reetyo Faucet",
            b"Reetyo Faucet",
            b"Get some free coin",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        let wallet = PublicWallet {
            id: object::new(ctx),
            coin: balance::zero(),
            faucet_amount: AMOUNT,
        };
        transfer::share_object(wallet);
        transfer::public_share_object(treasury_cap)
    }
    public entry fun mint_faucet(
        treasury_cap: &mut TreasuryCap<REETYO_FAUCET>,
        amount: u64,
        wallet: &mut PublicWallet,
        ctx: &mut TxContext) {
        let coins = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(coins));
    }
    public entry fun get_faucet(wallet: &mut PublicWallet, ctx: &mut TxContext) {
        let balance_amount = balance::value(&wallet.coin);
        assert!(balance_amount >= wallet.faucet_amount, EFaucetDry);
        let mint_balance = balance::split(&mut wallet.coin, wallet.faucet_amount);
        let faucet_coin = coin::from_balance(mint_balance, ctx);
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
    }
}
