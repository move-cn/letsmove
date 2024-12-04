module task8::test{
    use sui::bcs;
    use sui::event;
    use std::ascii::{String, string};


    public struct Challenge has key {
        id: UID,
        str: String,
        difficulity: u64,
        ture_num: u64
    }

    public struct Flag2 has copy, drop {
        bsc_struct: vector<u8>
    }

    // let challenge = Challenge{
    //     "difficulity":"3",
    //     "id":{"id":"0x19e76ca504c5a5fa5e214a45fca6c058171ba333f6da897b82731094504d5ab9"},
    //     "str":b"1jpJ8]7S<Wy[gf)sQ~R",
    //     "ture_num":"22"
    //     }

    fun init(_ctx: &mut TxContext) {

    }

    entry fun test(
        challenge:&mut Challenge
    ){
        let bcs_struct1 = bcs::to_bytes(challenge);

        event::emit(
            Flag2{
                bsc_struct:bcs_struct1
            }
        );
    }


}