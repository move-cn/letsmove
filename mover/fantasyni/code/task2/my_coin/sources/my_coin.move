/// Module: my_coin
module my_coin::justin_coin {
    use std::option;
    use sui::coin::{Self, TreasuryCap};
    use sui::transfer;
    use sui::tx_context;
    use sui::tx_context::TxContext;

    public struct JUSTIN_COIN has drop {}

    #[allow(unused_function)]
    fun init(witness: JUSTIN_COIN, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<JUSTIN_COIN>(witness, 8, b"JCOIN", b"", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx))
    }

    public entry fun mint(treasury_cap: &mut TreasuryCap<JUSTIN_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }
}

/*
sui move build --skip-fetch-latest-git-deps
sui client publish  --skip-fetch-latest-git-deps
export GAS_BUDGET=100000000
export PACKAGE_ID=0x2bb921b49d4f5acffd78b3a9bcb899a2d5125ef6e1f6cd2a931a0a2d35737a7c
export JUSTIN_COIN_TREASURY_CAP=0x5438efda5a5b9f909f79953ab5844475052a7668cb094b941d0ae1505366def1
export TARGET_ADDRESS=0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
sui client call --function mint --package $PACKAGE_ID --module justin_coin --args $JUSTIN_COIN_TREASURY_CAP 10 $TARGET_ADDRESS --gas-budget $GAS_BUDGET
*/
