/*
/// Module: tt
module tt::tt;
*/
module tt::tt {
    use std::hash::sha3_256;
    use std::bcs;
    use std::ascii::{String, string};
    use std::debug;

    public struct FlagString has drop {
        str: String,
        ture_num:u64,
    }

    public fun whn() {
        let flag_str = FlagString {
            ture_num: 92,
            str: string(b"MhC(~0.bG0dz$i#ytEVdHR"),
        };
        let my_id = string(b"PebblerWon");
        let mut bcs_flag = bcs::to_bytes(&flag_str.str);
        vector::append<u8>(&mut bcs_flag, *my_id.as_bytes());
        let e = sha3_256(bcs_flag);

        debug::print(&e);
    }
}