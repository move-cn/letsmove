/*
/// Module: task5_coin
module task5_coin::task5_coin;
*/

//ref  https://examples.sui-book.com/samples/coin.html
//ref https://learnblockchain.cn/article/8717#%20%E5%90%88%E7%BA%A6
//ref https://learnblockchain.cn/article/9788

// Coin1  RMB
module task5_coin::qwrdxer_RMB{
    use sui::coin;
    use sui::coin::{TreasuryCap, mint_and_transfer};

    public struct QWRDXER_RMB has drop{}
    fun init(witness:QWRDXER_RMB,ctx: &mut TxContext){
        let (treasury, metadata)=coin::create_currency(
            witness,
            6,
            b"QWRDXERRMB",
            b"",
            b"",
            option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }
    // 持有cap 的地址可以mint coin到指定地址
    public entry fun  mint(
        treasury_cap:&mut TreasuryCap<QWRDXER_RMB>,amount:u64,recipient:address,ctx: &mut TxContext
    ){
        mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }

}

// Coin 2 USDT
module task5_coin::qwrdxer_USDT{
    use sui::coin;
    use sui::coin::{TreasuryCap, mint_and_transfer};

    public struct QWRDXER_USDT has drop{}
    fun init(witness:QWRDXER_USDT,ctx: &mut TxContext){
        let (treasury, metadata)=coin::create_currency(
            witness,
            6,
            b"QWRDXERUSDT",
            b"",
            b"",
            option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }
    // 持有cap 的地址可以mint coin到指定地址
    public entry fun  mint(
        treasury_cap:&mut TreasuryCap<QWRDXER_USDT>,amount:u64,recipient:address,ctx: &mut TxContext
    ){
        mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }

}
// Coin 3 DOGE
module task5_coin::qwrdxer_DOGE{
    use sui::coin;
    use sui::coin::{TreasuryCap, mint_and_transfer};

    public struct QWRDXER_DOGE has drop{}
    fun init(witness:QWRDXER_DOGE,ctx: &mut TxContext){
        let (treasury, metadata)=coin::create_currency(
            witness,
            6,
            b"QWRDXERDOGE",
            b"",
            b"",
            option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));
    }
    // 持有cap 的地址可以mint coin到指定地址
    public entry fun  mint(
        treasury_cap:&mut TreasuryCap<QWRDXER_DOGE>,amount:u64,recipient:address,ctx: &mut TxContext
    ){
        mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }

}

/*
 正确调用qwrdxercoin
 sui client call --package 0x2a9a3474683292a9f88e5a404c191db5b7e9c8017380344d1ebc0d68caa3f369 --module qwrdxercoin --function mint --args 0xed02c055c9e1aad5cad787be38a1566aa3d851d94aacd62832e2e6c596b26452 10000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000
 使用另一个地址调用faucet
 sui client call --package 0x319ea40d6a669cd26f787fb432d2bd29b0bf71f9354486eae9bbab8517ff6bb0 --module faucetqwrdxercoin --function mint --args  0xdaba562b748d108e6cea27d23a7c8487729a60ff041cbb31d6c7c7bd92d1e8a1 10000000 0x3f130ae9c17e02f07fa4bb2e758365e5d1aa8c0b921f1a7dc0cf917a9c1aa07e  --gas-budget 10000000
*/

