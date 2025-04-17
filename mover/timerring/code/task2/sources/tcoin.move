/*
/// Module: task2
module task2::coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

// https://movesui.sui-book.com/02_sui_%E6%A0%87%E5%87%86/01_Coin/02_%E5%88%9B%E5%BB%BACoin.html
module task2::tcoin;
use std::option::some;
use sui::coin::{create_currency, TreasuryCap};
use sui::transfer::{public_transfer, public_freeze_object};
use sui::url;
use sui::url::Url;
use sui::coin;

public struct TCOIN has drop{}
// init coin
fun init(tcoin: TCOIN, ctx: &mut TxContext){
    let url = url::new_unsafe_from_bytes(b"https://miro.medium.com/v2/resize:fit:720/format:webp/1*PvCkfUq-s61EUoC1trFGnQ.png");
    let coinPic = some<Url>(url);
    let (treasury, coin_metadata) = create_currency(tcoin, 8, b"TCOIN", b"TCOIN", b"this is tcoin.", coinPic, ctx);
    // freeze coin metadata
    public_freeze_object(coin_metadata);
    // transfer coin to sender(the deployer)
    public_transfer(treasury, ctx.sender());
}

// then the deployer can mint coin
public fun mint(treasury_cap: &mut TreasuryCap<TCOIN>, amount: u64, recipient: address, ctx: &mut TxContext,) {
    coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
}