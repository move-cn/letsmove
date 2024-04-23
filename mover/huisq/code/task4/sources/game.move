module admin::game {
    use std::string::{Self, String};
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::vector;
    use std::option::{Self, Option};
    //use std::debug;

    #[test_only]
    use sui::test_scenario;
    #[test_only]
    use sui::test_utils::assert_eq;

    //==============================================================================================
    // Constants
    //==============================================================================================
    const GithubName: vector<u8> = b"huisq"; 

    //==============================================================================================
    // Error codes - DO NOT MODIFY
    //==============================================================================================
    const EGameEnded: u64 = 1;

    //==============================================================================================
    // Structs 
    //==============================================================================================
    struct Logs has key {
        id: UID,
        //no of games started
        count: u64,
        //games: vector<Game>
    }

    struct Game has key, store {
        id: UID,
        ended: bool,
        participants: u64,
        winner: Option<address>
    }

    //==============================================================================================
    // Event Structs 
    //==============================================================================================
    struct GameJoined has copy, drop {
        // ticket info (scrambled version of GithubName)
        string: String,
        // The owner of the ticket
        player: address,
        // The Object ID of the game
        game: ID
    }

    struct GameWon has copy, drop {
        // The owner of the ticket
        player: address,
        // The Object ID of the game
        game: ID
    }


    //==============================================================================================
    // Init
    //==============================================================================================

    fun init(ctx: &mut TxContext) {
        let logs = Logs{
            id: object::new(ctx), 
            count: 0, 
            //games: vector::empty()
        };
        transfer::share_object(logs);
    }

    //==============================================================================================
    // Entry Functions 
    //==============================================================================================

    /// Create a new game
    public entry fun create_game(
        logs: &mut Logs,
        ctx: &mut TxContext
    ) {
        let game = Game {
            id: object::new(ctx),
            ended: false,
            participants: 0,
            winner: option::none()
        };
        //vector::push_back(&mut logs.games, game);
        logs.count = logs.count + 1;
        transfer::share_object(game);
    }


    /// Participate in the lottery
    public entry fun join_game(
        game: &mut Game,
        ctx: &mut TxContext
    ) {
        assert!(!game.ended, EGameEnded);
        let sender = tx_context::sender(ctx);
        let drawn = generate_name(ctx);
        event::emit(GameJoined {
            string: drawn,
            player: sender,
            game: object::uid_to_inner(&game.id)
        });
        game.participants = game.participants + 1;
        if(drawn == string::utf8(GithubName)){
            game_won(game,ctx);
        };
    }

    /// Game won by a player
    public fun game_won(
        game: &mut Game,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        event::emit(GameWon {
            player: sender,
            game: object::uid_to_inner(&game.id)
        });
        game.ended = true;
    }


    //==============================================================================================
    // Public View Functions 
    //==============================================================================================

    /// Get Game's status
    public fun is_game_ended(game: &Game): &bool {
        &game.ended
    }

    /// Get Game's no of participants
    public fun participants(game: &Game): &u64 {
        &game.participants
    }

    /// Get Game Winner
    public fun winner(game: &Game): &address {
        option::borrow(&game.winner)
    }

    //==============================================================================================
    // Helper Functions 
    //==============================================================================================

    fun generate_name(ctx: &mut TxContext): String{
        let start_num = vector[0,1,2,3,4];
        let output = string::utf8(b"");
        while(vector::length(&start_num) != 0){
            let size = vector::length(&start_num);
            let index = vector::remove(&mut start_num, admin::random::generate_number(size, ctx));
            string::append(&mut output, string::sub_string(&string::utf8(GithubName), index, index+1));
        };
        output
    }

    //==============================================================================================
    // Tests 
    //==============================================================================================
    #[test]
    fun test_init_success() {
        let module_owner = @0xa;

        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        let tx = test_scenario::next_tx(scenario, module_owner);
        let expected_events_emitted = 0;
        let expected_created_objects = 1;
        assert_eq(
            test_scenario::num_user_events(&tx), 
            expected_events_emitted
        );
        assert_eq(
            vector::length(&test_scenario::created(&tx)),
            expected_created_objects
        );
        {
            let logs = test_scenario::take_shared<Logs>(scenario);

            assert_eq(
                logs.count, 
                0
            );

            test_scenario::return_shared(logs);
        };
        test_scenario::end(scenario_val);
    }

     #[test]
    fun test_generate_new_name_success() {
        let module_owner = @0xa;
        
        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        

        test_scenario::next_tx(scenario, module_owner);
        {
            &generate_name(test_scenario::ctx(scenario));
        };
        
        test_scenario::end(scenario_val);
    }

    #[test]
    fun test_create_game_success() {
        let module_owner = @0xa;
        
        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        test_scenario::next_tx(scenario, module_owner);
        {
            let logs = test_scenario::take_shared<Logs>(scenario);
            
            create_game(&mut logs, test_scenario::ctx(scenario));

            test_scenario::return_shared(logs);
        };
        
        let tx = test_scenario::next_tx(scenario, module_owner);
        let expected_created_objects = 1;
        assert_eq(
            vector::length(&test_scenario::created(&tx)),
            expected_created_objects
        );
                
        test_scenario::end(scenario_val);
    }

    #[test]
    fun test_join_game_success() {
        let module_owner = @0xa;
        
        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        test_scenario::next_tx(scenario, module_owner);
        {
            let logs = test_scenario::take_shared<Logs>(scenario);
            
            create_game(&mut logs, test_scenario::ctx(scenario));

            test_scenario::return_shared(logs);
        };
        test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            
            join_game(&mut game, test_scenario::ctx(scenario));

            test_scenario::return_shared(game);
        };
        
        let tx = test_scenario::next_tx(scenario, module_owner);
        assert!(
            test_scenario::num_user_events(&tx) > 0, 0
        );
                
        test_scenario::end(scenario_val);
    }

        #[test]
    fun test_game_won_success() {
        let module_owner = @0xa;
        
        let scenario_val = test_scenario::begin(module_owner);
        let scenario = &mut scenario_val;

        {
            init(test_scenario::ctx(scenario));
        };
        test_scenario::next_tx(scenario, module_owner);
        {
            let logs = test_scenario::take_shared<Logs>(scenario);
            
            create_game(&mut logs, test_scenario::ctx(scenario));

            test_scenario::return_shared(logs);
        };
        test_scenario::next_tx(scenario, module_owner);
        
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        let tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        {
            let game = test_scenario::take_shared<Game>(scenario);
            join_game(&mut game, test_scenario::ctx(scenario));
            test_scenario::return_shared(game);
        };
        tx = test_scenario::next_tx(scenario, module_owner);
        assert_eq(
            test_scenario::num_user_events(&tx),
            2
        );
                
        test_scenario::end(scenario_val);
    }

}

module admin::random {
    use sui::tx_context::{Self, TxContext};
    use admin::vector_utils::from_be_bytes;

    public fun generate_pseudorandom(ctx: &mut TxContext): vector<u8> {
        std::bcs::to_bytes(&tx_context::fresh_object_address(ctx))
    }

    public fun generate_number(range: u64, ctx: &mut TxContext) : u64 {
        from_be_bytes(generate_pseudorandom(ctx)) % range
    }
}
