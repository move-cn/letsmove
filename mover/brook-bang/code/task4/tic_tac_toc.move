module task4::tic_tac_toc {

    use sui::event;

    const IN_PROGRESS: u8 = 0;
    const X_WIN: u8 = 1;
    const O_WIN: u8 = 2;
    const DRAW: u8 = 3;
    const FINAL_TURN: u8 = 8;

    const EInvalidLocation: u64 = 0;
    const ENoMoreMark: u64 = 1;

    public struct TicTacToe has key {
        id: UID,
        gameboard: vector<vector<Option<Mark>>>,
        cur_turn: u8,
        game_status: u8,
        x_address: address,
        o_address: address,
    }

    public struct MarkMintCap has key {
        id: UID,
        game_id: ID,
        remaining_supply: u8,
    }

    public struct Mark has key, store {
        id: UID,
        player: address,
        row: u64,
        col: u64,
    }

    public struct Trophy has key {
        id: UID,
    }

    public struct MarkSentEvent has copy,drop {
        game_id: ID,
        mark_id: ID,
    }

    public struct GameEndEvent has copy, drop {
        game_id: ID,
    }

    public entry fun create_game(x_address: address, o_address: address, ctx: &mut TxContext) {

        let id = object::new(ctx);
        let game_id = object::uid_to_inner(&id);
        let gameboard = vector[
            vector[option::none(),option::none(),option::none()],
            vector[option::none(),option::none(),option::none()],
            vector[option::none(),option::none(),option::none()],
        ];
        let game = TicTacToe {
            id,
            gameboard,
            cur_turn: 0,
            game_status: IN_PROGRESS,
            x_address,
            o_address,
        };
        transfer::transfer(game, tx_context::sender(ctx));
        let cap = MarkMintCap {
            id: object::new(ctx),
            game_id,
            remaining_supply: 5,
        };
        transfer::transfer(cap, x_address);
        let cap = MarkMintCap {
            id: object::new(ctx),
            game_id,
            remaining_supply: 5,
        };
        transfer::transfer(cap, o_address);
    }

    public entry fun send_mark_to_game(
        cap: &mut MarkMintCap,
        game_address: address,
        row: u64,
        col: u64,
        ctx: &mut TxContext,
    ) {
        if(row > 2 || col >2 ) {
            abort EInvalidLocation
        };
        let mark = mint_mark(cap, row, col, ctx);
        event::emit(MarkSentEvent {
            game_id: *&cap.game_id,
            mark_id: object::id(&mark),
        });
        transfer::public_transfer(mark, game_address);
    }

    public entry fun place_mark(game: &mut TicTacToe, mark: Mark, ctx: &mut TxContext) {
        let addr = get_cur_turn_address(game);
        if (game.game_status != IN_PROGRESS || &addr != &mark.player) {
            delete_mark(mark);
            return
        };
        let cell = get_cell_mut_ref(game, mark.row, mark.col);
        if (option::is_some(cell)) {
            delete_mark(mark);
            return
        };
        option::fill(cell, mark);
        update_winner(game);
        game.cur_turn = game.cur_turn + 1;

        if (game.game_status != IN_PROGRESS) {
            event::emit(GameEndEvent { game_id: object::id(game)});
            if (game.game_status == X_WIN) {
                transfer::transfer(Trophy { id: object::new(ctx)}, *&game.x_address);
            } else if (game.game_status == O_WIN) {
                transfer::transfer(Trophy { id: object::new(ctx)}, *&game.o_address);
            }
        }
    }

    public entry fun delete_game(game: TicTacToe) {
        let TicTacToe { id, mut gameboard, cur_turn: _, game_status: _, x_address: _, o_address: _ } = game;
        while  (vector::length(&gameboard) > 0) {
            let mut row = vector::pop_back(&mut gameboard);
            while (vector::length(&row) > 0) {
                let mut element = vector::pop_back(&mut row);
                if (option::is_some(&element)) {
                    let mark = option::extract(&mut element);
                    delete_mark(mark);
                };
                option::destroy_none(element);
            };
            vector::destroy_empty(row);
        };
        vector::destroy_empty(gameboard);
        object::delete(id);
    }

    public entry fun delete_trophy(trophy: Trophy) {
        let Trophy { id } = trophy;
        object::delete(id);
    }

    public entry fun delete_cap(cap: MarkMintCap) {
        let MarkMintCap { id, game_id: _, remaining_supply: _ } =cap;
        object::delete(id);
    }

    fun mint_mark(cap: &mut MarkMintCap, row: u64, col: u64, ctx: &mut TxContext): Mark {
        if (cap.remaining_supply == 0) {
            abort ENoMoreMark
        };
        cap.remaining_supply = cap.remaining_supply -1;
        Mark {
            id: object::new(ctx),
            player: tx_context::sender(ctx),
            row,
            col,
        }
    }

    fun get_cur_turn_address(game: &TicTacToe): address {
        if (game.cur_turn % 2 == 0 ) {
            *&game.x_address
        } else {
            *&game.o_address
        }
    }

    fun get_cell_ref(game: &TicTacToe, row: u64, col: u64): &Option<Mark> {
        vector::borrow(vector::borrow(&game.gameboard,row),col)
    }

    fun delete_mark(mark: Mark) {
        let Mark { id, player: _, row: _, col: _} = mark;
        object::delete(id);
    }

    fun get_cell_mut_ref(game: &mut TicTacToe, row: u64, col: u64): &mut Option<Mark> {
        vector::borrow_mut(vector::borrow_mut(&mut game.gameboard,row), col)
    }

    fun update_winner(game: &mut TicTacToe) {

        check_for_winner(game, 0,0,0,1,0,2);
        check_for_winner(game, 1,0,1,1,1,2);
        check_for_winner(game, 2,0,2,1,2,2);

        check_for_winner(game, 0,0,1,0,2,0);
        check_for_winner(game, 0,1,1,1,2,1);
        check_for_winner(game, 0,2,1,2,2,2);

        check_for_winner(game, 0,0,1,1,2,2);
        check_for_winner(game, 2,0,1,1,0,2);

        if (game.game_status == IN_PROGRESS && game.cur_turn == FINAL_TURN) {
            game.game_status = DRAW;
        };
    }

    fun check_for_winner(game: &mut TicTacToe, row1: u64, col1: u64, row2: u64, col2: u64, row3: u64, col3: u64) {
        if (game.game_status != IN_PROGRESS) {
            return
        };
        let mut result = check_all_equal(game, row1, col1, row2, col2, row3, col3);
        if (option::is_some(&result)) {
            let winner = option::extract(&mut result);
            game.game_status = if (&winner == &game.x_address) {
                X_WIN
            } else {
                O_WIN
            };
        };
    }

    fun check_all_equal(game: &TicTacToe, row1: u64, col1: u64, row2: u64, col2: u64, row3: u64, col3: u64): Option<address> {
        let cell1 = get_cell_ref(game, row1, col1);
        let cell2 = get_cell_ref(game, row2, col2);
        let cell3 = get_cell_ref(game, row3, col3);
        if (option::is_some(cell1) && option::is_some(cell2) && option::is_some(cell3)) {
            let cell1_player = *&option::borrow(cell1).player;
            let cell2_player = *&option::borrow(cell2).player;
            let cell3_player = *&option::borrow(cell3).player;
            if (&cell1_player == &cell2_player && &cell1_player == &cell3_player) {
                return option::some(cell1_player)
            };
        };
        option::none()
    }










}