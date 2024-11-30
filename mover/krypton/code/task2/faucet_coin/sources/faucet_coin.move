module faucet_coin::krypton_faucet_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url::{Self, Url};

    // 定义代币结构体
    public struct KRYPTON_FAUCET_COIN has drop {}
    
    // 初始化函数：创建代币并共享铸币权限
    fun init(witness:KRYPTON_FAUCET_COIN,ctx: &mut TxContext) {
        
        let (treasury_cap, metadata) = coin::create_currency<KRYPTON_FAUCET_COIN>(
            witness,
            9, // 精度
            b"krypton faucet coin",
            b"KRYPTON_FAUCET_COIN",
            b"Krypton Faucet Coin",
            option::some<Url>(url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/154910746?v=4")),  // 代币的头像URL
            ctx
        );

        // 冻结metadata对象，阻止后续修改
        transfer::public_freeze_object(metadata);

        // 共享铸币权限
        transfer::public_share_object(treasury_cap);
    }

    // 铸币功能
    public entry fun mint(
        treasury_cap: &mut TreasuryCap<KRYPTON_FAUCET_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
}

