module move2024::match_keyworld {

    public fun run(x: u64): u64 {
        match (x) {
            1 => 2,
            2 => 3,
            x => x,
        }
    }


    #[test]
    fun test_run(){
        run(1); // 返回 2
        run(2); // 返回 3
        run(3); // 返回 3
        run(0); // 返回 0
    }


}
