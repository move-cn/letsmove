
module task7::test {
    use std::ascii::string;
    use std::bcs;
    use std::hash::sha3_256;
    use std::vector;
    use std::debug::print;

    #[test]
    fun test() {
        let githubId = string(b"xdd-object");
        let str = string(b"jLJ@:{{hNPA~B");
        let mut bcs_flag = bcs::to_bytes(&str);
        vector::append<u8>(&mut bcs_flag, *githubId.as_bytes());
        //验证
        let abc = sha3_256(bcs_flag);
        print(&githubId);
        print(&abc);
        print(&str);


    }

    //

}






