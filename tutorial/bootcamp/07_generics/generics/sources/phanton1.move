module generics::phanton1 {

    use sui::object::UID;

    public struct Balance<phantom T> has store {
        value: u64
    }

    public struct Coin<phantom T> has key, store {
        id: UID,
        balance: Balance<T>
    }


    public struct Balance2<T> has store {
        value: T
    }


    public struct Coin2<T> has key, store {
        id: UID,
        balance: Balance2<T>
    }





}
