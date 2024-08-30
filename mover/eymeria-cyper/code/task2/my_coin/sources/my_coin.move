module my_coin::eymeria_coin {
    use std::ascii::{ String, string };
    use std::string;
    use sui::coin::{Self, Coin, TreasuryCap};
    use std::option;
    use sui::transfer;
    //self导入前面的module本身。如果没有self，后面使用的时候就要写sui::tx_context::xx.写了self就只需tx_context::就好了
    use sui::tx_context::{Self, TxContext};
    use sui::url;
    const MIST:u64 = 1_000_000_000;
    public struct EYMERIA_COIN has drop{}
    fun init(witness: EYMERIA_COIN, ctx: &mut TxContext){
    let (mut treasury, metadata) = coin::create_currency (
      witness,
      9,
      b"Eymeria-cyper",
      b"One Piece!",
      b"Eymeria game coin",
      option::some(url::new_unsafe(string(b"https://avatars.githubusercontent.com/u/90686202"))),
      ctx
    );
        transfer::public_freeze_object(metadata);
        //Sender: tx_context 模块中的 sender 函数会根据接收的上下文提取并返回发起交易的账户的地址。
        //以下是将铸币权限转移给合约部署者。treasury控制着代币的铸造权，只有拥有TreasuryCap的实体才能铸造新的代币。
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }
    public entry fun mint_in_my_module(treasury_cap: &mut TreasuryCap<EYMERIA_COIN>, amount: u64, recipient: address, ctx: &mut TxContext) {
        let coin = coin::mint(treasury_cap, amount*MIST, ctx);
        transfer::public_transfer(coin, recipient);
    }
}