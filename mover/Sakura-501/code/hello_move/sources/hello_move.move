
/// Module: hello_move
module hello_move::hello_move {
    use std::string::{Self, String};
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct HelloWorldObject has key{
        id: UID,
        text: String,
    }

    public fun mint(ctx: &mut TxContext){
        let object = HelloWorldObject{
            id: object::new(ctx),
            text: string::utf8(b"Hello Move!")
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }
}
// script {
//     use std::debug;
//     fun main() {
//         debug::print(&b"hello move!");
//     }
// }

/* 
sui move build
sui move test
sui client publish --gas-budget 10000000
Digest: HAGUPVnXrLnQMDpDb7AHR11vxenFpqyZ5kwXNjiqcWSq
PACKAGE_ID=0x0b5d348fa7f3d2df0f13e7e80e22cbaa5a3dd28a2b2520809a7d9db00af00c52
sui client call --package $PACKAGE_ID --module hello_move --function mint --gas-budget 30000000
0x00bc1bf8803cf4e7ce672fafc5ae58e17158069741d642ccf81ffdd09267f74f
*/