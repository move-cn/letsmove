/*
/// Module: task8
module task8::task8;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module task8::get_challenge {
    use task8::lets_move::Challenge;
    use sui::bcs;
    use sui::event;

    public struct ChallengeByte has copy, drop {
        challenge_bytes: vector<u8>
    }

    public entry fun get_challenge(challenge: &Challenge) {
        let challenge_bytes = bcs::to_bytes(challenge);
        event::emit(ChallengeByte { challenge_bytes });
    }
}