module my_coin::eymeria_faucet {
    use sui::coin::{Self, Coin, TreasuryCap};
    use std::option;
    use sui::transfer;
    //self导入前面的module本身。如果没有self，后面使用的时候就要写sui::tx_context::xx.写了self就只需tx_context::就好了
    use sui::tx_context::{Self, TxContext};

    public struct EYMERIA_FAUCET has drop{}
    fun init(witness: EYMERIA_FAUCET, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(witness,6,b"Eymeria-cyper",b"emeria",b"Eymeria_token",option::none(),ctx);
        transfer::public_freeze_object(metadata);
        //Sender: tx_context 模块中的 sender 函数会根据接收的上下文提取并返回发起交易的账户的地址。
        //以下是将铸币权限转移给合约部署者。treasury控制着代币的铸造权，只有拥有TreasuryCap的实体才能铸造新的代币。
        transfer::public_share_object(treasury);
    }
    public entry fun mint_in_my_module(treasury_cap: &mut TreasuryCap<EYMERIA_FAUCET>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }
}