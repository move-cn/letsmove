module task2::rzx_faucet_coin{
    use sui::coin::{Self, TreasuryCap};
    use sui::balance::{Self, Balance};

    public struct RZX_FAUCET_COIN has drop {}

    public struct Wallet has key {
        id: UID,
        coin: Balance<RZX_FAUCET_COIN >
    }

    #[allow(unused_function)]
    fun init(witness: RZX_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = 
            coin::create_currency<RZX_FAUCET_COIN>(witness, 2, b"RZX-sym", b"RZX-name", 
            b"RZX-desp", option::none(), ctx);

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

        let wallet = Wallet {
            id: object::new(ctx),
            coin: balance::zero()
        };
        transfer::share_object(wallet);
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<RZX_FAUCET_COIN>,  wallet: &mut Wallet, 
        amount: u64, ctx: &mut TxContext
    ) {
        let mint_coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(mint_coin));
    }

    public entry fun faucet(wallet: &mut Wallet, ctx: &mut TxContext) {
        let take_coin = coin::take(&mut wallet.coin, 10000, ctx);
        transfer::public_transfer(take_coin, tx_context::sender(ctx));
    }
}