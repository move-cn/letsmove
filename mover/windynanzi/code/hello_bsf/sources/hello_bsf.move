module hello_bsf::hello_bsf {

  use std::ascii::{String, string, as_bytes};
  use std::bcs;
  use std::hash::sha3_256;
  use std::string;
  use std::string::bytes;
  use std::vector;
  use sui::event::emit;

  public struct Flag_Get has copy,drop {
    flag: vector<u8>,
  }

  public struct FlagString has key {
    id: UID,
    str: String,
    ture_num: u64
  }

  public entry fun getresult(
    flag_str: String,
    github_id: String,
  ) {
    let str = &flag_str;
    let mut bsf_flag = bcs::to_bytes(str);
    let github = as_bytes(&github_id);
    vector::append<u8>(&mut bsf_flag, *github);

    let flag = sha3_256(bsf_flag);

    emit(Flag_Get {
      flag,
    })

  }
}
// 0xc8dcd54baa7724177593a9f70598a09ae6a4286f996542e058f248209db08147
// sui client call --package 0x1223f4c8f1b0058a147526912c7dff3e49a97bdfe86f6ef90777c825138aff9e --module hello_bsf --function getresult --args "?4#BzblB)Ql" windynanzi
// 4xXWQaKfCgZjro79Mh4yZdrqz4CWX5UAj91KSSK6sFvj