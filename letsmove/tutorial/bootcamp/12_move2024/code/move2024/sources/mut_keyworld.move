module move2024::mut_keyworld {

    #[allow(unused_assignment)]
    fun init(_ctx: &mut TxContext) {
        // let x: u64 = 10;
        // x = 20;

       //  Move 2024
        let mut x: u64 = 10;
        x = 20;

        let mut y: u64 ;
        y = 10u64;
        y = 12u64;
    }


    // fun takes_by_value_and_mutates(mut v: Value): Value {
    //     v.field = 10;
    //     v
    // }

    // `mut` 应放在变量名之前
    // fun destruct() {
    //     let (x, y) = point::get_point();
    //     let (mut x, y) = point::get_point();
    //     let (mut x, mut y) = point::get_point();
    // }
    //
    // // 在结构体解包中
    // fun unpack() {
    //     let Point { x, mut y } = point::get_point();
    //     let Point { mut x, mut y } = point::get_point();
    // }
}
