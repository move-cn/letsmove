// #[test_only]
module 0x0::hello_move_tests {
    use std::assert;
    use sui::object::{UID};
    use sui::tx_context::{TxContext};
    use 0x0::hello_move::{HelloObj, create_hello_object, update_message, get_message, get_github_id};

    const E_NOT_IMPLEMENTED: u64 = 0;

    #[test]
    public fun test_create_hello_object() {
        let mut ctx = TxContext::new(/* 添加所需的初始化参数 */);
        
        // 创建 HelloObj
        create_hello_object(&mut ctx);
        
        // 获取转移的对象
        let object = ctx.get_transferred_object::<HelloObj>();
        assert(object.is_some(), 1);
        
        let hello_obj = object.unwrap();
        assert(hello_obj.id != UID::zero(), 2);
        assert(get_message(&hello_obj) == string::utf8(b"Hello DYJJ!"), 3);
        assert(get_github_id(&hello_obj) == string::utf8(b"DYJJ"), 4);
    }

    #[test]
    public fun test_update_message() {
        let mut ctx = TxContext::new(/* 添加所需的初始化参数 */);
        
        // 创建 HelloObj
        create_hello_object(&mut ctx);
        let object = ctx.get_transferred_object::<HelloObj>().unwrap();

        // 更新消息
        let new_message = string::utf8(b"Updated Message");
        update_message(&mut object, new_message);

        // 验证消息更新
        assert(get_message(&object) == new_message, 5);
    }

    #[test, expected_failure(abort_code = E_NOT_IMPLEMENTED)]
    public fun test_update_message_fail() {
        abort E_NOT_IMPLEMENTED;
    }
}
