module ability::key_store {

    use sui::object;
    use sui::object::UID;
    use sui::transfer::{transfer, public_transfer};
    use sui::tx_context::{sender, TxContext};

    public struct KeyStore has key,store {
        id:UID,
        age:u8,
    }

    public struct HolderStore has key {
        id:UID,
        st: KeyStore
    }

    public fun mint(ctx:&mut TxContext){
        let only = KeyStore{
            id:object::new(ctx),
            age:10,
        };

        public_transfer(only,sender(ctx));
    }


    // public fun my_transfer(only: KeyStore, addr: address) {
    //     if (only.age > 10) {
    //         public_transfer(only, addr);
    //     }else {
    //         abort 10
    //     }
    // }

}
