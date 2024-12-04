/// The module `helloecnemuse` under named address `helloecnemuse`.
/// The named address is set in the `Move.toml`.
module helloecnemuse::helloecnemuse {
    // Imports the `String` type from the Standard Library
    use std::string::String;

    /// Returns the "Hello, World!" as a `String`.
    public fun hello_world(): String {
        b"Hello, Ecnemuse!".to_string()
    }
}