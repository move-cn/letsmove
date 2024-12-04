/// Module: my_coin
module my_coin::justin_faucet_coin {
    use std::option;
    use sui::balance;
    use sui::balance::Balance;
    use sui::coin::{Self, Coin, TreasuryCap, balance};
    use sui::object;
    use sui::object::UID;
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    public struct JUSTIN_FAUCET_COIN has drop {}

    public struct Faucet_Account has key {
        id: UID,
        balance: Balance<JUSTIN_FAUCET_COIN>,
        mint_amount: u64,
    }

    const MINT_AMOUNT: u64 = 100000000;

    const EFaucetBalanceNotEnough: u64 = 1;

    #[allow(unused_function)]
    fun init(witness: JUSTIN_FAUCET_COIN, ctx: &mut TxContext) {
        let admin_address = sender(ctx);
        let (treasury_cap, metadata) = coin::create_currency<JUSTIN_FAUCET_COIN>(witness, 8, b"JFCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, admin_address);

        let account = Faucet_Account {
            id: object::new(ctx),
            balance: balance::zero(),
            mint_amount: MINT_AMOUNT,
        };
        transfer::share_object(account);
    }

    public entry fun mint_faucet(treasury_cap: &mut TreasuryCap<JUSTIN_FAUCET_COIN>, amount: u64, account: &mut Faucet_Account, ctx: &mut TxContext) {
        let coins = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut account.balance, coin::into_balance(coins));
    }

    public entry fun update_mint_amount(_: &mut TreasuryCap<JUSTIN_FAUCET_COIN>, account: &mut Faucet_Account, amount: u64, ctx: &mut TxContext) {
        account.mint_amount = amount;
    }

    public entry fun get_faucet(account: &mut Faucet_Account, ctx: &mut TxContext) {
        let balance_amount = balance::value(&account.balance);
        assert!(balance_amount >= account.mint_amount, EFaucetBalanceNotEnough);

        let mint_balance = balance::split(&mut account.balance, account.mint_amount);
        let mint_coin = coin::from_balance(mint_balance, ctx);
        transfer::public_transfer(mint_coin, sender(ctx));
    }
}

/*
export PACKAGE_ID=0x2bb921b49d4f5acffd78b3a9bcb899a2d5125ef6e1f6cd2a931a0a2d35737a7c
export FAUCET_ACCOUNT=0xabb11dededc1414e684d2a2a56093f85e787f61c59ba0fb9e02d0af0858d9a28
export JUSTIN_FAUCET_COIN_TREASURY_CAP=0x5f7e9adc5656ce032794070453b84a26f9018daf86d81107720195cf54ffc2f2
sui client switch --address 0xf659e4dff81e081f7c5dc4f82a93c050fc7c58fc669f1b1c00c4a75b5b89f1c4
sui client call --function mint_faucet --package $PACKAGE_ID --module justin_faucet_coin --args $JUSTIN_FAUCET_COIN_TREASURY_CAP 1000000000000 $FAUCET_ACCOUNT --gas-budget $GAS_BUDGET
sui client call --function get_faucet --package $PACKAGE_ID --module justin_faucet_coin --args $FAUCET_ACCOUNT --gas-budget $GAS_BUDGET
*/