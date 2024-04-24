#[test_only]
module hello_move::hello_move_tests {
    use hello_move::hello_move;

    #[test]
    fun test_hello_move() {
        hello_move::hello_move();
    }
}
