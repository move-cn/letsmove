// #[test_only]
// module task1::hello_move {
//     // uncomment this line to import the module
//     use hello_move::hello_move;

//     const ENotImplemented: u64 = 0;

//     #[test]
//     fun test_task1() {
//         // Create a dummy TxContext for testing
//         let mut ctx = tx_context::dummy();

//         // Create a sword
//         let sword = Sword {
//             id: object::new(&mut ctx),
//             magic: 42,
//             strength: 7,
//         };

//         // Check if accessor functions return correct values
//         assert!(sword.magic() == 42 && sword.strength() == 7, 1);
//     }

//     #[test, expected_failure(abort_code = task1::hello_move::ENotImplemented)]
//     fun test_task1_fail() {
//         abort ENotImplemented
//     }
// }