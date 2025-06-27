module blazeleon_faucet::blazeleon_faucet;

use sui::coin;
use sui::url::{Self, Url};

//需要具备 drop 能力，才能实现 Witness 模式。
public struct BLAZELEON_FAUCET has drop {}

// 当前 init 函数会在上链交易执行时被调用
fun init(blazeleonFaucet: BLAZELEON_FAUCET, ctx: &mut TxContext) {
    // 创建一个新的 BLAZELEON_FAUCET 币
    let (treasuryCap, coinMetadata) = coin::create_currency<BLAZELEON_FAUCET>(
        blazeleonFaucet,
        9,
        b"BLAZELEON_FAUCET",
        b"blazeleon_faucet",
        b"Make web3 great again!",
        option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/48305889")),
        ctx,
    );

    // 冻结元数据
    transfer::public_freeze_object(coinMetadata);

    // 共享 mint 权限
    transfer::public_share_object(treasuryCap);
    
}
