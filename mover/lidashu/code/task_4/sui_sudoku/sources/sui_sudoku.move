#[allow(lint(self_transfer))]
module sui_sudoku::lidashu_sui_sudoku {
    use sui::event;
    use sui::coin;
    use sui::vec_set;
    use std::string::{Self, String};
    use sui::clock::{Self, Clock};
    use sui::balance::{Self, Balance};
    
    public struct SudokuLevel<phantom T> has key, store {
        id: UID,
        width: u64,
        level_data: vector<u8>,
        amount: u64,
        win_balance: Balance<T>
    }


    /// Event: emitted when a level solved.
    public struct LidashuSudokuLevelSolved has copy, drop {
        level_id: ID,
        solved_by: address
    }

    /// Event: emitted when a level failed to solved.
    public struct LidashuSudokuLevelNotSolved has copy, drop {
        level_id: ID,
        mismatch: String,
        submitted_by: address
    }


    public fun mint_level<T>(
        width: u64,
        level_data: vector<u8>,
        amount: u64,
        win_coin: &mut coin::Coin<T>,
        ctx: &mut TxContext
    ){
        let sender = tx_context::sender(ctx);
        let id = object::new(ctx);

        let _balance = coin::balance_mut(win_coin);
        let total_amount = balance::value(_balance);
        let win_balance = balance::split(_balance, total_amount);

        let new_level = SudokuLevel<T> {
            id,
            width,
            level_data,
            amount,
            win_balance
        };

        transfer::public_transfer(new_level, sender);
        //transfer::share_object(new_level);

    }

    public fun check_resolve(level_data: & vector<u8>, set_data: & vector<u8>) : (bool, String) {
        let mut row_data = vector::empty<vec_set::VecSet<u8>>();
        let mut col_data = vector::empty<vec_set::VecSet<u8>>();
        let mut group_data = vector::empty<vec_set::VecSet<u8>>();


        let mut i = 0;
        while (i < 9) {
            let mut new_row_data = vec_set::empty<u8>();
            let mut new_col_data = vec_set::empty<u8>();
            let mut new_group_data = vec_set::empty<u8>();

            vector::push_back(&mut row_data, new_row_data);
            vector::push_back(&mut col_data, new_col_data);
            vector::push_back(&mut group_data, new_group_data);

            i= i + 1;
        };

        let mut i = 0;
        while (i < 81) {
            let set_numer = *vector::borrow(set_data, i);
            let level_numer = *vector::borrow(level_data, i);

            if (set_numer < 1 || set_numer > 9){
                return (false, string::utf8(b"set_numer < 1 || set_numer > 9"))
            };

            if (level_numer > 0 && level_numer != set_numer){
                return (false, string::utf8(b"level_numer > 0 && level_numer != set_numer"))
            };

            let row_num = i/9;
            let col_num = i%9;
            let group_num = row_num/3 * 3 + col_num/3;
           
            // get set
            let mut target_row = *vector::borrow(& row_data, row_num);
            let mut target_col = *vector::borrow(& col_data, col_num);
            let mut target_group = *vector::borrow(& group_data, group_num);

            // insert
            vec_set::insert(&mut target_row, set_numer);
            vec_set::insert(&mut target_col, set_numer);
            vec_set::insert(&mut target_group, set_numer);

            // write back
            *vector::borrow_mut(&mut row_data, row_num) = target_row;
            *vector::borrow_mut(&mut col_data, col_num) = target_col;
            *vector::borrow_mut(&mut group_data, group_num) = target_group;

            i = i + 1;

        };

        let mut i = 0;
        while (i < 9) {
            
            let target_row = *vector::borrow(& row_data, i);
            let target_col = *vector::borrow(& col_data, i);
            let target_group = *vector::borrow(& group_data, i);

            if (vec_set::size(&target_row) < 9){
                return (false, string::utf8(b"row_data mismatch"))
            };
            if (vec_set::size(&target_col) < 9){
                return (false, string::utf8(b"col_data mismatch"))
            };
            if (vec_set::size(&target_group) < 9){
                return (false, string::utf8(b"group_data mismatch"))
            };

            i=i+1;
        };

        (true, string::utf8(b"success"))
    }

    public fun solve_level<T>(
        level: &mut SudokuLevel<T>,
        resolve: vector<u8>,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        
        let level_data = & level.level_data;

        let (result, messsage) = check_resolve(level_data, & resolve);
        
        if (result == true){
            event::emit(LidashuSudokuLevelSolved {
                level_id: object::id(level),
                solved_by: sender
            });

            let time = clock::timestamp_ms(clock);
            let random_amount = time%level.amount;

            let new_coin = coin::take(&mut level.win_balance, random_amount, ctx);
            transfer::public_transfer(new_coin, tx_context::sender(ctx));

        }else{
            event::emit(LidashuSudokuLevelNotSolved {
                    level_id: object::id(level),
                    mismatch: messsage,
                    submitted_by: sender
                });
        }
            
    }

}
