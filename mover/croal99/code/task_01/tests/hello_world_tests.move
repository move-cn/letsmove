#[test_only]
#[allow(unused_use)]
module hello_world::hello_world_tests {
    // uncomment this line to import the module
    use hello_world::hello_world;
    use std::debug;
    use std::ascii::{String, string};

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_hello_world() {
        let mut _ctx = tx_context::dummy();
        let h1 = @myaddress;
        let s1 = string(b"hello world");
        hello_world::mint(&mut _ctx);
        debug::print(&5);
        debug::print(&5u16);
        debug::print(&5_4u16);
        debug::print(&0xA);
        debug::print(&0x0A0b);
        debug::print(&h1);
        debug::print(&s1);
        debug::print(&string(b"hello world2"));
        debug::print(&@hello_world);
    }

    #[test, expected_failure(abort_code = ::hello_world::hello_world_tests::ENotImplemented)]
    fun test_hello_world_fail() {
        abort ENotImplemented
    }
}
