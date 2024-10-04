#[test_only]
module my_game::lottery_tests {
    // uncomment this line to import the module
    // use my_game::my_game;

    use std::debug;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_my_game() {
        // pass
        let num: u64 = 100 * 100_000_000 / 1_000_000_000;
        debug::print(&num);
        assert!(! (num == 100), ENotImplemented);
    }

    // #[test]
    // fun test_my_game_fail() {
    //     abort ENotImplemented
    // }
}