module w626w::coin_a {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct COIN_A has drop {}

    fun init(witness: COIN_A, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<COIN_A>(
            witness,
            3,
            b"COIN_A",
            b"CA",
            b"learning for swap",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
    }

    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN_A>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }

    public fun burn(treasury_cap: &mut TreasuryCap<COIN_A>, coin: Coin<COIN_A>) {
        coin::burn(treasury_cap, coin);
    }

    #[test_only]
    public fun test_init(ctx: &mut TxContext) {
        init(COIN_A {}, ctx);
    }
}
//packageID  0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317
//coin_a: 0xa7edc406153123af11055029fc6f141138b413df1d191885607bd154ab7178e4
//coin_b: 0xa5f37c9ecf31f9593fa8397048edaee926b697a50dd889ad933b239d07d0436a
// sui client call --gas-budget 7500000 --package 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317 --module coin_a --function mint --args 0xde7af37e8206d9d15e1a3cf6ea4f5d98ce5bc187dc2083f04e636be8b57d05f6 1000 0x472478f05c79a17b04f2a201e845cd6b7d82099bad3d23397ab254c5a5fa6486
// sui client call --gas-budget 7500000 --package 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317 --module coin_b --function mint --args 0x8dd342f8a1697e7584b2b94bd210d14c6e9e657747c5fa1776dead59ba1faf72 10000 0x472478f05c79a17b04f2a201e845cd6b7d82099bad3d23397ab254c5a5fa6486
//coinA1:0xa7edc406153123af11055029fc6f141138b413df1d191885607bd154ab7178e4     type: 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317::coin_a::COIN_A
//coinB10:0xa5f37c9ecf31f9593fa8397048edaee926b697a50dd889ad933b239d07d0436a    type: 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317::coin_b::COIN_B
// coinA1:0xe8a2d834c2126e84f1d33506b6649dbe371c562b38adc919a73bfeb77c170392
//增加流动性：sui client call --gas-budget 7500000 --package 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317 --module w626w --function create_pool --type-args 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317::coin_a::COIN_A 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317::coin_b::COIN_B --args 0x04d2105db01fd6d08e8f42439da32ddcdefff2d940ffb64dc3025d1e55e6e728 0x77919c8c6c232035c1586b7e023c950a2fcd534000b883d151822f10f1c482cc 
// lp:0xb9b5890f4aa897398bd18057c349fa0bb41baefa4368709f82f7cf794358734e
// swap  sui client call --gas-budget 7500000 --package 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317 --module w626w --function swap_a_to_b --type-args 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317::coin_a::COIN_A 0xd6f4b1d25a401c678fcccdb72680866abc45f1c737c48e3bad2a08f83b8a0317::coin_b::COIN_B --args 0xd5c9304899f35c3ccde345388e0ed0e53f3dd791faf753fbe1c4b12ad499c756 0x014b40ae0f81e7a247031cc98900ab4d7211c463c74b23bc481a136a3c1bb54d
