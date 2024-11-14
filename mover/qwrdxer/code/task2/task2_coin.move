
//ref  https://examples.sui-book.com/samples/coin.html

// my coin ,只有自己能 mint burn 的coin
module task2_coin::qwrdxercoin{
    use sui::coin;
    use sui::coin::{TreasuryCap, mint_and_transfer};

    public struct QWRDXERCOIN has drop{}
    fun init(witness:QWRDXERCOIN,ctx: &mut TxContext){
        let (treasury, metadata)=coin::create_currency(
            witness,
            6,
            b"QWRDXERCOIN",
            b"",
            b"",
            option::none(),ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury,tx_context::sender(ctx));


    }
    // 持有cap 的地址可以mint coin到指定地址
    public entry fun  mint(
        treasury_cap:&mut TreasuryCap<QWRDXERCOIN>,amount:u64,recipient:address,ctx: &mut TxContext
    ){
        mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }

}
//ref https://learnblockchain.cn/article/8717#%20%E5%90%88%E7%BA%A6
//ref https://learnblockchain.cn/article/9788
// 共享权限, 大家都能mint
module task2_coin::faucetqwrdxercoin{
    use sui::coin::{Self,TreasuryCap};
    use sui::transfer::public_share_object;
    public struct FAUCETQWRDXERCOIN has drop {}
    fun init(witness:FAUCETQWRDXERCOIN,ctx: &mut TxContext){
        let (treasury, metadata)=coin::create_currency(
            witness,
            6,
            b"FAUCETQWRDXERCOIN",
            b"",
            b"",
            option::none(),ctx);
        transfer::public_freeze_object(metadata);
        public_share_object(treasury); // 共享权限
    }
    // 持有cap 的地址可以mint coin到指定地址
    public entry fun mint(
        treasury_cap:&mut TreasuryCap<FAUCETQWRDXERCOIN>,amount:u64,recipient:address,ctx: &mut TxContext
    ){
        coin::mint_and_transfer(treasury_cap,amount,recipient,ctx)
    }

}

/*
 正确调用qwrdxercoin
 sui client call --package 0x2a9a3474683292a9f88e5a404c191db5b7e9c8017380344d1ebc0d68caa3f369 --module qwrdxercoin --function mint --args 0xed02c055c9e1aad5cad787be38a1566aa3d851d94aacd62832e2e6c596b26452 10000000 0x7b8e0864967427679b4e129f79dc332a885c6087ec9e187b53451a9006ee15f2 --gas-budget 10000000
 使用另一个地址调用faucet
 sui client call --package 0x2a9a3474683292a9f88e5a404c191db5b7e9c8017380344d1ebc0d68caa3f369 --module faucetqwrdxercoin --function mint --args  0x16426368b63b0708ddf71d948c9d273f502785f285741508811d3b5a12d9a6f6 100000 0x527a77fde60aa65daca3d2ec5bd86595ae125edc3e957b1e33c39ea7477a825a  --gas-budget 10000000
*/

