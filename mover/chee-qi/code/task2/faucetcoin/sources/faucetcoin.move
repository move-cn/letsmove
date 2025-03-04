/*
/// Module: faucetcoin
module faucetcoin::faucetcoin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions



module faucetcoin::faucetcoin{

    // === Imports === 
    use sui::coin::create_currency;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::Url;
    use std::option::{none};
    use sui::transfer::{public_share_object,public_freeze_object};

    // === Errors ===

    // === Constants ===

    // === Structs ===

    public struct FAUCETCOIN has drop{}

    // === Events ===

    // === Method Aliases ===

    // === Public Functions ===

    fun init(witness: FAUCETCOIN, ctx: &mut TxContext){
        let decimals = 6;
        let symbol = b"FAUCETCOIN";
        let name = b"FAUCETCOIN";
        let description = b"chee faucetcoin";
        let icon_url = none<Url>();

        let (treasury, metadata) = create_currency<FAUCETCOIN>(
            witness,
            decimals,
            symbol,
            name,
            description,
            icon_url,
            ctx
        );
        public_freeze_object(metadata);
        public_share_object(treasury);
    }

    // === View Functions ===
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<FAUCETCOIN>,
        amount:u64,
        recipient:address,
        ctx:&mut TxContext
    ){
        let coin = coin::mint(treasury_cap,amount,ctx);
        transfer::public_transfer(coin,recipient);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<FAUCETCOIN>,coin:Coin<FAUCETCOIN>){
        coin::burn(treasury_cap,coin);
    }

    // === Admin Functions ===

    // === Package Functions ===

    // === Private Functions ===

    // === Test Functions ===

    //packageId: 0xa3673245fe57b05699f1440e2c3968ca62cf1e177bfb54df3595b9d4d6004398


    //mint帐户：
    // 0xa97451236151a06f8a33d1711d85f0eee5c3c273cd2aaaa28831d4c3b3f16efb
    // 0x59acb6870f13ceeb09ddc0bf6eb4f59b12e37a9b44f5d36dde85191584b304ba

}