#[test_only]
module move_castle::castle_tests {
    // 取消此行的注释以导入模块
    // use move_castle::move_castle;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_move_castle() {
        // pass
    }

    #[test, expected_failure(abort_code = ::move_castle::castle_tests::ENotImplemented)]
    fun test_move_castle_fail() {
        abort ENotImplemented
    }

    #[test]
    fun integer_test() {
        let c: u32 = 188;
        assert!(c < 200,0);
    }
}
