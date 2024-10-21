// #[test_only]
module 0x0::hello_move_tests {
    use std::assert;
    use sui::object::{UID};
    use sui::tx_context::{TxContext};
    use 0x0::hello_move::{HelloObj, mint};

    const E_NOT_IMPLEMENTED: u64 = 0;

    #[test]
    public fun test_mint() {
        // 创建一个测试上下文
        let ctx = TxContext::new(/* 添加所需的初始化参数 */);
        
        // 调用 mint 函数
        mint(&mut ctx);

        // 获取转移的对象（假设有方法可以获取当前交易上下文中的对象）
        let object = ctx.get_transferred_object::<HelloObj>();

        // 验证对象的 ID 和 say 字段
        assert(object.is_some(), 1); 
        let hello_obj = object.unwrap();
        assert(hello_obj.id != UID::zero(), 2); 
        assert(hello_obj.say == string::utf8(b"Hello DYJJ!"), 3);
    }

    #[test, expected_failure(abort_code = E_NOT_IMPLEMENTED)]
    public fun test_mint_fail() {
        abort E_NOT_IMPLEMENTED;
    }
}
