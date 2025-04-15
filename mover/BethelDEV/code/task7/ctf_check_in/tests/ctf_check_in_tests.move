#[test_only]
module ctf_check_in::ctf_check_in_tests {
    use std::debug;
    use std::vector;
    use std::bcs;
    use std::hash::sha3_256;
    use std::ascii::{String, string};
    // uncomment this line to import the module

    const ENotImplemented: u64 = 0;
    const ESTRING: u64 = 0;

    #[test]
    fun test_check_in() {
        // pass
        let flag_str= string(b"Bqcl\"n#K");
        let github_id = string(b"BethelDEV");

        let mut bcs_flag = bcs::to_bytes(&flag_str);
        vector::append<u8>(&mut bcs_flag, *github_id.as_bytes());

        debug::print(&sha3_256(bcs_flag));
        //assert!(flag == sha3_256(bcs_flag), ESTRING);
    }

    /*
    Running Move unit tests
[debug] 0x500fde1d14efe1e1f80a3cb2291ead870ac65990a4702559b60ba727c77fb7ca
[ PASS    ] ctf_check_in::ctf_check_in_tests::test_check_in
Test result: OK. Total tests: 1; passed: 1; failed: 0
*/
}
