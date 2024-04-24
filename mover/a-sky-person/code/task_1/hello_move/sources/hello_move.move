module hello_move::hello_move {
    use std::string::String;

    public fun hello_move(): String {
        let message = b"Hello, a-sky-person".to_string();
        std::debug::print(&message);
        message
    }
}
