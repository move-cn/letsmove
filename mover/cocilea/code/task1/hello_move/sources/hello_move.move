module hello_move::hello_move {
    use std::string;

    public fun speak(): string::String {
       string::utf8(b"Hello Cocilea")
    }
    
    public fun test_speak() {
       assert!(*string::bytes(&speak()) == b"Hello Cocilea", 0);
    }
}
