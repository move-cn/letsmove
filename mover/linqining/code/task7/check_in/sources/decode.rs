use std::io::{self, Write};
use std::bcs;

fn main() {
    let str = r">1}y^:jDt$C}M\6(r.-F";
    let strbyte = str.to_bytes();
    let unescaped_string = unescape(string_with_escapes).unwrap();
    let bcs_flag = unescaped_string.bytes();
    let github_id = b"linqining";

    vector::append<u8>(&mut bcs_flag, github_id);
    print(&bcs_flag);
    let str: std::string::String = std::string::utf8(bcs_flag);
    // print(&str);

    let data = sha3_256(bcs_flag);
    // let databyte = bcs::to_bytes(&data);
    print!(data)
}
