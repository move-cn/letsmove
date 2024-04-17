module task2::jeasonnow_faucet_coin {
    use sui::tx_context::{sender};
    use sui::coin::{Self, TreasuryCap};
    use sui::balance::{Self, Balance};

    // witness
    public struct JEASONNOW_FAUCET_COIN has drop {} 

    public struct Wallet has key {
        id: UID,
        coin: Balance<JEASONNOW_FAUCET_COIN>
    }

    fun init(otw:JEASONNOW_FAUCET_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            otw,
            6,
            b"JFC",
            b"JeasonnowFaucetCoin",
            b"Jeasonnow Faucet Coin",
            option::none(),
            ctx
        );


        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // public transfer, everyone can transfer the coin
        transfer::public_transfer(treasury, sender(ctx));

        let wallet = Wallet {
            id: object::new(ctx),
            coin: balance::zero()
        };

        transfer::share_object(wallet)

    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<JEASONNOW_FAUCET_COIN>, wallet: &mut Wallet, amount: u64, ctx: &mut TxContext
    ) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(coin));
    }

    public entry fun faucet(wallet: &mut Wallet, amount: u64, ctx: &mut TxContext) {
        let coin = coin::take(&mut wallet.coin, amount, ctx);
        transfer::public_transfer(coin, sender(ctx));
    }
}