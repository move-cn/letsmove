/// Module: harder_challenge
module harder_challenge::harder_challenge{

    use sui::event;
    use sui::bcs;
    use lets_move::lets_move::Challenge;

    public struct ChallengeBytes has copy, drop {
        object_bytes :vector<u8>
    }

    public entry fun get_challenge_bytes(challenge: &Challenge){
        event::emit(ChallengeBytes {
            object_bytes:bcs::to_bytes(challenge)
    });
    }
}