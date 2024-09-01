// #[test_only]
// module task4::task4_tests {
//     // uncomment this line to import the module
//     // use task4::task4;
//
//     use task4::game;
//     use std::string::{Self, String};
//
//     const ENotImplemented: u64 = 0;
//
//     #[test]
//     fun test_task4() {
//         // pass
//         game::rand_u64_range(0, 5, sui::tx_context::TxContext {
//             send
//         })
//     }
//
//     #[test, expected_failure(abort_code = ::task4::task4_tests::ENotImplemented)]
//     fun test_task4_fail() {
//         abort ENotImplemented
//     }
// }
