module move2024::macro_keyworld {

    use std::debug::print;


    // public fun max<T>(x: T, y: T): T {
    //
    // }

    public macro fun num_max($x: _, $y: _): _ {
        let x = $x;
        let y = $y;
        if (x > y) x
        else y
    }

    #[test]
    fun test_max(){

     // let a =   max<u16>(10,20);


        let z = num_max!(10u32,20u32);
        //
        // print(&z);

    }


}
