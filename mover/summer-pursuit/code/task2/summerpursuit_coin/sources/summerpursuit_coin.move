/// Module: task2
module task2::summerpursuit_coin {
    // 依赖
    use sui::tx_context::{sender};
    use sui::coin::{Self,TreasuryCap,Coin};
    // 结构体
    public struct SUMMERPURSUIT_COIN has drop {}

    // 初始化
    fun init(witness: SUMMERPURSUIT_COIN, ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            6,
            b"BR", //代币的名称
            b"summerpursuitCoin",
            b"summerpursuit Coin is so cool",
            option::none(),ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // 将铸币的权限凭证转移到合约部署者
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    // 铸造
    public entry fun mint(treasury_cap: &mut TreasuryCap<SUMMERPURSUIT_COIN>,
                          amount: u64, recipient: address, ctx: &mut TxContext){
        // 一次性实现代币的铸造及转移。
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<SUMMERPURSUIT_COIN>, coin: Coin<SUMMERPURSUIT_COIN>){
        coin::burn(treasury_cap,coin);
    }


    //sui client call --package 0xc97bd17b32a6e5118b936143aea9b2deb9694b20742ac2eab7412220b3f42445   --module summerpursuit_coin  --function mint --args 0x61619c9c1db724f690b3fb2d31ba817569f7e9beecd9b8993da85892a01adc88 100 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2  --gas-budget=100000000
}

