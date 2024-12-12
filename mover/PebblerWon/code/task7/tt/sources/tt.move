
module tt::tt {
    use std::hash::sha3_256;
    use std::bcs;
    use std::ascii::{String, string};
    use std::debug;
    // use lets_move::lets_move;

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


     public fun task8(ctx:&mut TxContext) {
        let mut proof: vector<u8> = vector::empty<u8>();
        let mut full_proof: vector<u8> = vector::empty<u8>();
        vector::append<u8>(&mut full_proof, proof);
        let a = tx_context::sender(ctx);
        let b:address = @0x09be6b8995b7f56d8491a67f54519c56059d3fc24124470366b7ee5b51c27a91;
        vector::append<u8>(&mut full_proof, tx_context::sender(ctx).to_bytes());
        vector::append<u8>(&mut full_proof, bcs::to_bytes(challenge));

        let hash: vector<u8> = sha3_256(full_proof);
        let mut prefix_sum: u32 = 0;
        let mut i: u64 = 0;
        while (i < 3) {
            prefix_sum = prefix_sum + (*vector::borrow(&hash, i) as u32);
            i = i + 1;
        };

        assert!(prefix_sum == 0, 0x99);
    }
}