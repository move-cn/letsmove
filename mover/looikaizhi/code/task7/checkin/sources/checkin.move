module checkin::checkin{
    use std::ascii::String;
    use std::hash;
    use sui::bcs::to_bytes;

    public struct VectorAns has key{
        id: UID,
        vec: vector<u8>,
    }

    fun init(ctx: &mut TxContext){
        let vectorAns = VectorAns{
            id: object::new(ctx),
            vec: vector::empty<u8>(),
        };
        transfer::share_object(vectorAns);
    }

    public entry fun getHash(github_id: String, flagStr: String, vectorAns: &mut VectorAns){
        let mut v0 = to_bytes(&flagStr);
        vector::append<u8>(&mut v0, *github_id.as_bytes());
        vectorAns.vec = hash::sha3_256(v0);
    }

}

