// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// Example coin with a trusted manager responsible for minting/burning (e.g., a stablecoin)
/// By convention, modules defining custom coin types use upper case names, in contrast to
/// ordinary modules, which use camel case.
module escrow::treesirop_facet {
    use sui::coin::{Self,TreasuryCap,Coin};
    use sui::balance::{Self};
    /// Name of the coin. By convention, this type has the same name as its parent module
    /// and has no fields. The full type of the coin defined by this module will be `COIN<MANAGED>`.
    public struct TREESIROP_FACET has drop {}

    /// Register the managed currency to acquire its `TreasuryCap`. Because
    /// this is a module initializer, it ensures the currency only gets
    /// registered once.
    fun init(witness: TREESIROP_FACET, ctx: &mut TxContext) {
        // Get a treasury cap for the coin and give it to the transaction sender
        let (treasury_cap, metadata) = coin::create_currency<TREESIROP_FACET>(witness, 2, b"TREESIROP_FACET", b"FACET", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        // transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_share_object(treasury_cap)
    }

    /// Manager can mint new coins
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<TREESIROP_FACET>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    /// Manager can burn coins
    public entry fun burn(treasury_cap: &mut TreasuryCap<TREESIROP_FACET>, coin: Coin<TREESIROP_FACET>) {
        coin::burn(treasury_cap, coin);
    }
    
    public fun su(treasury_cap: &mut TreasuryCap<TREESIROP_FACET>):u64{
        let re = coin::total_supply(treasury_cap);
        re
    }
    ///increase supply and transfer the balance to sender
    // public fun in_supply(cool: &mut balance::Supply<MANAGED>,value: u64){
    //     let balance = balance::increase_supply<MANAGED>(cool,value);
    //     cool.total_supply = cool.total_supply + balance;
    // }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(TREESIROP_FACET {}, ctx)
    }
}