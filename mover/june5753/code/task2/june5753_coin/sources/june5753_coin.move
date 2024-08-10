/// Module: task2
module task2::june5753_coin {
    // 依赖
    use sui::tx_context::{sender};
    use sui::coin::{Self,TreasuryCap,Coin};
    // 结构体
    public struct JUNE5753_COIN has drop {}

    // 初始化
    fun init(witness: JUNE5753_COIN, ctx:&mut TxContext){
        let (treasury_cap,metadata) = coin::create_currency(
            witness,
            6,
            b"BR", //代币的名称
            b"june5753Coin",
            b"June5753 Coin is so cool",
            option::none(),ctx);

        //freeze the metadata to share immutabale objects
        transfer::public_freeze_object(metadata);
        // 将铸币的权限凭证转移到合约部署者
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    // 铸造
    public entry fun mint(treasury_cap: &mut TreasuryCap<JUNE5753_COIN>,
                          amount: u64, recipient: address, ctx: &mut TxContext){
        // 一次性实现代币的铸造及转移。
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx);
    }

    public entry fun burn(treasury_cap: &mut TreasuryCap<JUNE5753_COIN>, coin: Coin<JUNE5753_COIN>){
        coin::burn(treasury_cap,coin);
    }


    // 使用以下命令进行代币铸造
    // sui client call --package 记录的包id --module My_token  --function mint --args  刚刚记录的Obj id  铸造数量 接收者的地址  --gas-budget=100000000

    // hash HeDEM8t767Qs2pnjs4xHXe1HzPqheYTiTywhF41cbsgL
    // packageid 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4
    // TreasuryCap objectid 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0
    // 接收者的地址 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  为个人的真实钱包地址

    // 完整示例：
    // sui client call --package 0x9eca0a616305718c72e850e58b405f057fa4e32205dd6a9a843faeb2c45d58b4 --module june5753_coin  --function mint --args 0x36d8c03aa4e48926345bf588fd1802409fb7bb904298f1aa8b28107e6c2cb4f0 100
    // 0xba518d8c6db3e2b8b71b06af694198d56ce0e264a6d9c10ad782f7fd969a99c3  --gas-budget=100000000
}

