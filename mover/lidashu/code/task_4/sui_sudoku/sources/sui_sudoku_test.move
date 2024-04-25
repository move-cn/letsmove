// Copyright (c) Sui Foundation, Inc.
// SPDX-License-Identifier: Apache-2.0

#[test_only]
module sui_sudoku::sui_sudoku_tests {

    use sui_sudoku::sui_sudoku::{Self};
    use sui::test_scenario::{Self, next_tx, ctx};
    
    #[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let mut scenario = test_scenario::begin(addr1);
        

        next_tx(&mut scenario, addr1);
        {
            let level_data: vector<u8> = vector[1,7,2,0,6,9,8,3,0,0,0,0,7,3,4,1,0,0,3,6,0,8,1,2,7,0,9,4,0,5,0,9,1,3,7,8,0,8,9,4,7,3,2,1,5,7,0,1,2,8,5,4,9,6,8,9,6,1,2,0,5,4,3,5,1,0,9,4,0,6,2,7,2,0,0,0,5,6,9,8,0];
            let set_data: vector<u8> =   vector[1,7,2,5,6,9,8,3,4,9,5,8,7,3,4,1,6,2,3,6,4,8,1,2,7,5,9,4,2,5,6,9,1,3,7,8,6,8,9,4,7,3,2,1,5,7,3,1,2,8,5,4,9,6,8,9,6,1,2,7,5,4,3,5,1,3,9,4,8,6,2,7,2,4,7,3,5,6,9,8,1];
            let (result, message) = sui_sudoku::check_resolve(&level_data, &set_data);
            std::debug::print(&result);
            std::debug::print(&message);
        };


        // Cleans up the scenario object
        test_scenario::end(scenario);
    }

}