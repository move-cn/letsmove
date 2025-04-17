// shared coin
module my_coin::my_faucet_coin;

use sui::coin::{create_currency, TreasuryCap, mint};
use sui::transfer::{public_freeze_object, public_share_object, public_transfer};

public struct MY_FAUCET_COIN has drop {}

public struct FaucetCap has key, store {
    id: UID,
    treasure_cap: TreasuryCap<MY_FAUCET_COIN>,
}

fun init (witness: MY_FAUCET_COIN, ctx: &mut TxContext) {
    let (treasure_cap, meta_data) = create_currency(
        witness,
        8,
        b"MFC",
        b"MY_FAUCET_COIN",
        b"My faucet coin by beam-magnum",
        option::none(),
        ctx
    );

    let faucet_cap = FaucetCap {
        id: object::new(ctx),
        treasure_cap: treasure_cap,
    };

    public_freeze_object(meta_data);
    // public_transfer(treasure_cap, ctx.sender());
    public_share_object(faucet_cap);
}

public fun faucet_mint(faucet_cap: &mut FaucetCap, amount: u64, recipient: address, ctx: &mut TxContext) {
    let treasure_cap = &mut faucet_cap.treasure_cap;
    let coin = mint(treasure_cap, amount, ctx);
    public_transfer(coin, recipient);
}

// testnet
// package: 0xb890f5ca713c37cdffe0898227a001278c9c83676e3ad0b3c7818d2ac36612fb
// treasure_cap: 0xdb3fe9bd8711c06c0d4d90f6ffe06976cdb56a7abe68b6d62f6f0794cdc400b3
// local address: 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5
// test address:  0x2d3c2f8584ccff30205a22950dce18117c72ddee28ad172d8329b7281349f189
// sui client call --package 0xb890f5ca713c37cdffe0898227a001278c9c83676e3ad0b3c7818d2ac36612fb --module my_faucet_coin --function faucet_mint --args 0xdb3fe9bd8711c06c0d4d90f6ffe06976cdb56a7abe68b6d62f6f0794cdc400b3 10 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5
// sui client call --package 0xb890f5ca713c37cdffe0898227a001278c9c83676e3ad0b3c7818d2ac36612fb --module my_faucet_coin --function faucet_mint --args 0xdb3fe9bd8711c06c0d4d90f6ffe06976cdb56a7abe68b6d62f6f0794cdc400b3 10 0x2d3c2f8584ccff30205a22950dce18117c72ddee28ad172d8329b7281349f189

// mainnet
// tx hash: H5AGZWBq9du8C2e6617xR1s42Cpmt1HJ1HRrBQAm2ubt
// package: 0xef715e047db339f78a334abb944e085b54770ba318e5599c25113e1c670f0d7c
// treasure_cap: 0x353d962747b98b34151e7002b7c56da16d2d017303b6b5d95f383a39a128cf5f
// local address: 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5
// test address:  0x2d3c2f8584ccff30205a22950dce18117c72ddee28ad172d8329b7281349f189
// sui client call --package 0xef715e047db339f78a334abb944e085b54770ba318e5599c25113e1c670f0d7c --module my_faucet_coin --function faucet_mint --args 0x353d962747b98b34151e7002b7c56da16d2d017303b6b5d95f383a39a128cf5f 10 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5
// hash: 3Afe6ckXVDxXEAKxvJXrzd3bLP24Y1vLFgXhWac5NX8u
// sui client call --package 0xef715e047db339f78a334abb944e085b54770ba318e5599c25113e1c670f0d7c --module my_faucet_coin --function faucet_mint --args 0x353d962747b98b34151e7002b7c56da16d2d017303b6b5d95f383a39a128cf5f 10 0x2d3c2f8584ccff30205a22950dce18117c72ddee28ad172d8329b7281349f189
// hash: 8FUYZqTKXAuX4Z31yauyQPGCBgVAMcYYRAQowVBAfFCx