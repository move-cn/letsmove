/// Module: toma3610_faucet
module toma3610_faucet::toma3610_faucet {
    use sui::balance::{Balance};
    use sui::balance;
    use sui::coin::{Self, TreasuryCap};
    public struct TOMA3610_FAUCET has drop {}
    public struct PublicWallet has key {
        id: UID,
        coin: Balance<TOMA3610_FAUCET>,
        faucet_amount: u64,
    }
    const AMOUNT: u64 = 10^12;
    const EFaucetDry: u64 = 1;
    #[allow(lint(share_owned))]
    fun init(witness: TOMA3610_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<TOMA3610_FAUCET>(
            witness,
            10,
            b"Toma3610 Faucet",
            b"Toma3610 Faucet",
            b"Get some free coin",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        let wallet = PublicWallet {
            id: object::new(ctx),
            coin: balance::zero(),
            faucet_amount: AMOUNT,
        };
        transfer::share_object(wallet);
    }
    public entry fun mint_faucet(
        treasury_cap: &mut TreasuryCap<TOMA3610_FAUCET>,
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
/*
sui client call --function mint_faucet --package 0x0d759fda433607390946753c250ac07ba508aad83ca5c1041ab7a599a45d6f60 --module toma3610_faucet --args 0x3c820c34d3e0f79347133d4e62cedc3b41f4d5b967c8bf6e0cf0e46337c4f087 100000000 0x49b16e90ea585968af1a6cae148bc451bb2054e96c1f928a961c5596ecf3801e --gas-budget 50000000

sui client call --function mint_faucet --package 0x0eb15c8bba8d234b5a4a3d17c71b273334eb56dd4ae63a390856cda35055baf7 --module toma3610_faucet --args 0x3c820c34d3e0f79347133d4e62cedc3b41f4d5b967c8bf6e0cf0e46337c4f087 100000000 0x1f8b0e11e9e0db699e820617cfeb71eac6297a65d541ce19de2c6fabc258e004 --gas-budget 50000000


0x4c16905457cf4f786fb25bf963cc1ee4e68dff52d0bb96fb01b1511fe1049362
│  │ ObjectType: 0x2::coin::TreasuryCap<0x4937565c85650cdc064619333ccbf150ac3f5302d728948dba35f24014088491::toma3610_coin::TOMA3610_COIN>   │

sui client call --package 0x4937565c85650cdc064619333ccbf150ac3f5302d728948dba35f24014088491 --module toma3610_coin --function mint --args 0x4c16905457cf4f786fb25bf963cc1ee4e68dff52d0bb96fb01b1511fe1049362 1000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 50000000


*/