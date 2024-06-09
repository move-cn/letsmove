
/// Module: hello_holopopo
module hello_holopopo::hello_holopopo {
use std::string::String;

    public fun hello_holopopo(): String {
        b"Hello, holopopo!".to_string()
    }
}
