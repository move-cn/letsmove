module my_coin::my_coin;

use sui::coin::{create_currency, TreasuryCap, mint_and_transfer};
use sui::transfer::{public_freeze_object, public_transfer};

public struct MY_COIN has drop {}

fun init (witness: MY_COIN, ctx: &mut TxContext) {
    let (treasure_cap, meta_data) = create_currency(
        witness,
        8,
        b"MYC",
        b"MY_COIN",
        b"My coin by beam-magnum",
        option::none(),
        ctx
    );

    public_freeze_object(meta_data);
    public_transfer(treasure_cap, ctx.sender());
}

public fun mint(treasure_cap: &mut TreasuryCap<MY_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
    mint_and_transfer(treasure_cap, amount, recipient, ctx);
}

// testnet
// package: 0xb8b6fe841d8779c7d76e7ef05c54e731eba304fa5e0101600f9b4c44f3e50871
// treasure_cap: 0x40df1fbf54f78acc117f7bc6c01aa370e26df8083fe3becad590618cc01000ae
// local address: 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5
// sui client call --package 0xb8b6fe841d8779c7d76e7ef05c54e731eba304fa5e0101600f9b4c44f3e50871 --module my_coin --function mint --args 0x40df1fbf54f78acc117f7bc6c01aa370e26df8083fe3becad590618cc01000ae 10 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5

// mainnet
// tx hash: 6WYg3rBJcCdLstgwJi92PMbwZ6iEsdCjUwEJ3utdWFc2
// package: 0x344abf49dceffda3db28c590f57de35942ab891524b04967d5f2e70c97489a6a
// treasure_cap: 0x2fccd50823adb63d8fb643babe87077cde5b0e49eb8acd2826e3e00c308261c8
// local address: 0x0668bac36af55a25fc6d9a6cff217517c1a014f2496049490eb185a1b1ad01e5
// sui client call --package 0x344abf49dceffda3db28c590f57de35942ab891524b04967d5f2e70c97489a6a --module my_coin --function mint --args 0x2fccd50823adb63d8fb643babe87077cde5b0e49eb8acd2826e3e00c308261c8 10 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2
// mint hash: CGfuvTH8UjFLb9k49779PZXScSk3QvEpLfJBMHd6LSUF