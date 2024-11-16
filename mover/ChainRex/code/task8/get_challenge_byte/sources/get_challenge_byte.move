
/// Module: get_challenge_byte
module get_challenge_byte::get_challenge_byte {
    use lets_move::lets_move::Challenge;
    use sui::bcs;
    use sui::event;

    public struct ChallengeByte has copy, drop {
        challenge_bytes: vector<u8>
    }

    public entry fun get_challenge_byte(challenge: &Challenge) {
        let challenge_bytes = bcs::to_bytes(challenge);
        event::emit(ChallengeByte { challenge_bytes });
    }
}
