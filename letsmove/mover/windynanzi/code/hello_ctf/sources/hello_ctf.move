module hello_ctf::hello_ctf {
  use std::ascii::String;
  use std::bcs;
  use std::hash;
  use std::hash::sha3_256;
  use std::u8;
  use std::vector;
  use sui::bcs::to_bytes;
  use sui::event::emit;
  use sui::object;

  public struct FindProof has copy, drop {
    proof: vector<u8>
  }


  public struct Get_Now_Info has copy,drop {
    sender: vector<u8>,
    challenge: vector<u8>,
  }

  public fun get_now_info<T:key>(
    challenge: &mut T,
    ctx: &mut TxContext,
  ) {
    let sender_byte = to_bytes(&ctx.sender());
    let challagne_byte = bcs::to_bytes(challenge);

    emit(Get_Now_Info {
      sender: sender_byte,
      challenge: challagne_byte
    })
  }
}

// hash: FATAXn8pFv9QyYQDj1iq3WA9gruw6tn5SPfKbd8wcuUz
// 0x9556cb6df647fe44532acee02b3e57de3dba25ca8ee257993097262fb98a2910
// sui client call --package 0x9556cb6df647fe44532acee02b3e57de3dba25ca8ee257993097262fb98a2910 --module hello_ctf --function get_now_info --args 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 --type-args 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f::lets_move::Challenge
// hash af2UrBUmM9caQGLwzC7dkTvwazg9dk7jRipW3uEgBts
// challenge [25,231,108,165,4,197,165,250,94,33,74,69,252,166,192,88,23,27,163,51,246,218,137,123,130,115,16,148,80,77,90,185,21,115,88,88,117,84,91,51,67,115,50,47,42,94,113,70,83,119,55,59,87,106,3,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0]
// sender [228,64,227,24,73,36,129,139,225,40,137,247,175,225,178,174,161,237,207,193,113,223,78,9,106,251,215,92,27,208,192,17]
//  [145, 48, 12]
//  sui client call --package 0x097a3833b6b5c62ca6ad10f0509dffdadff7ce31e1d86e63e884a14860cedc0f  --module lets_move --function get_flag --args  [145,48,12] windynanzi 0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9 0x8

