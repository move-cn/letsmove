module 0x1::test {

    #[test]
    fun test_sha256() {
        let a = string(b"IoAzxGa#yi#R5*%*|s@Q\"tz6~SZx");
        let github_id = string(b"BenjaminHang");
        let mut bcs_flag = bcs::to_bytes(&a);
        vector::append<u8>(&mut bcs_flag, *as_bytes(&github_id));

        let c = sha3_256(bcs_flag);
        print(&c);

        assert!(1 == 1, 0);
    }
}
