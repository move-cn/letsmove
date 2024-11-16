/*
/// Module: gen_proof
module gen_proof::gen_proof;
*/
module gen_proof::gen_proof {
    use std::ascii::{String, string};
    use std::hash;
    use sui::event;
    use sui::bcs;
    use sui::random;
    use sui::transfer::share_object;
    use sui::tx_context::{TxContext, sender};
    use sui::random::Random;
    use lets_move::lets_move::Challenge;
    


    public struct ChallengeBytes has copy, drop {
        object_bytes :vector<u8>
    }


    /// 初始化 Challenge 对象
    public fun init_challenge(ctx: &mut TxContext) {

    }


    public entry fun get_challenge_bytes(challenge: &Challenge,ctx:&TxContext){
        event::emit(ChallengeBytes {
            object_bytes:bcs::to_bytes(challenge)
    });
    }
}