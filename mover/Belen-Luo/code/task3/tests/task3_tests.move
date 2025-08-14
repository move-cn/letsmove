#[test_only]
module task3::BelenLuoNftTest {
    use std::debug::print;
    use std::string::utf8;

    #[test]
    fun testNftMint() {

      let text = &utf8(b"Start Test Init");

      print(text);
    }
}