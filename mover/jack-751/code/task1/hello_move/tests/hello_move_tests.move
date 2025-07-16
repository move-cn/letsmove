#[test_only]
module hello_move::hello_move_tests {
    use hello_move::hello_move;
    use std::string;

    #[test]
    fun test_hello_move() {
        let message = hello_move::hello_move();
        assert!(message == string::utf8(b"Hello Move"), 0);
    }

    #[test]
    fun test_hello_world() {
        let message = hello_move::hello_world();
        assert!(message == string::utf8(b"Hello, World!"), 0);
    }

    #[test]
    fun test_hello_with_name() {
        let message = hello_move::hello_with_name(b"Alice");
        assert!(message == string::utf8(b"Hello, Alice!"), 0);
    }

    #[test]
    fun test_hello_with_chinese_name() {
        let message = hello_move::hello_with_name(b"小明");
        assert!(message == string::utf8(b"Hello, 小明!"), 0);
    }
}
