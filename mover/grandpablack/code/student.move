module hello_world::student{
    //struct 定义时内部添加全局唯一的 id: UID 属性。
    use sui::object::{UID};
    //这可以先使用 tx_context::sender 函数获得当前 entry 函数调用者也就是交易发起者 sender 的地址，然后用 Sui framework 中的 transfer 函数转移所有权。
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct TranscriptObject has key {
        id: UID;
        historuy: u8;
        math: u8;
        literature: u8;

    }

    public entry fun create_transcript_object(historuy: u8, math: u8, literature: u8, ctx: &mut TxContext){
        let transcriptObject = TranscriptObject {
            id: object::new(ctx),
            historuy,
            math,
            literature,
        };
        transfer::transfer(transcriptObject, tx_context::sender(stx))
    }
}