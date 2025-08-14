#[test_only]
module martinyeung5::test_common {

    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::test_scenario::{Self, Scenario};

    use martinyeung5::single_player_satoshi::{Self as sps};
    use martinyeung5::mev_attack_resistant_single_player_satoshi::{Self as mev_sps};
    use martinyeung5::house_data::{Self as hd,  HouseCap, HouseData};
    use martinyeung5::counter_nft::{Self, Counter};

    // Faucet Coin
    use fungible_tokens::faucetucoin::{Self, FAUCETUCOIN};

    // -------------- Constants ----------------

    const MIN_STAKE: u64 = 1_000_000_000; // 1 SUI
    const MAX_STAKE: u64 = 50_000_000_000; // 50 SUI
    const INITIAL_HOUSE_BALANCE: u64 = 5_000_000_000; // 1 SUI
    const INITIAL_PLAYER_BALANCE: u64 = 3_000_000_000; // 3 SUI

    const HEADS: vector<u8> = b"H";
    const TAILS: vector<u8> = b"T";
    const INVALID: vector<u8> = b"X";

    // House's public key.
    const PK: vector<u8> = vector<u8> [
        134, 225,   1, 158, 217, 213,  32,  70, 180,
        42, 251, 131,  44, 112, 114, 117, 186,  65,
        90, 223, 233, 110,  24, 254, 105, 205, 219,
        236,  49, 113,  59, 167, 137,  19, 119,  39,
        75, 146, 197, 214,  70, 164, 176, 221,  55,
        218,  63, 198
    ];

    // Signed counter id 0x75c3360eb19fd2c20fbba5e2da8cf1a39cdb1ee913af3802ba330b852e459e05 + starting count = 0000000000000000 (represented as u64) with house's private key.
    const BLS_SIG: vector<u8> = vector<u8> [
        136, 154,   7, 173,  12,  37,  13,  33, 154,  16, 189, 218,
        133,  39, 103,  67, 231, 161, 180, 182,  59, 227, 242, 213,
        91, 110,  13, 152, 200,   6,  24, 209,  49, 121, 110, 130,
        243, 251, 142, 221,  90,  45, 109,   2, 109,  44, 180, 110,
        22,  22,   0,  72,  86, 201, 109, 197,  43, 253, 177,  74,
        98, 233, 112, 120, 171, 188, 107,  94,  21,   9,  66, 248,
        190, 130, 117, 137, 118, 234, 205,  44,   1, 109, 251, 198,
        162, 219, 188,  29, 128, 225,  75, 193, 205,   0, 180, 145
    ];

    const INVALID_BLS_SIG: vector<u8> = vector<u8>[
        129, 108, 254,  61, 148, 134, 105, 218, 212,  49, 136, 118,
        224, 223, 148,  83, 245, 230, 113, 248,  33, 169, 169,  78,
        108,  67, 144, 229, 243,  47, 248, 249, 172, 175, 181,  15,
        213, 223, 198,  85,  69,  15,  81, 234, 141, 240, 196,  88,
        3, 152,  64, 226, 101, 248, 157, 192, 180,  77, 156, 209,
        233,  93, 106,  87, 205,  90,  97, 181, 218,   6, 108, 246,
        17,  39, 197, 223,  36,  36,  86, 143, 130, 147, 212, 213,
        184,  38, 252, 169,  20,  58, 226, 180, 174, 222,  57, 171
    ];

    public fun get_min_stake(): u64 {
        MIN_STAKE
    }

    public fun get_max_stake(): u64 {
        MAX_STAKE
    }

    public fun get_initial_house_balance(): u64 {
        INITIAL_HOUSE_BALANCE
    }

    public fun get_initial_player_balance(): u64 {
        INITIAL_PLAYER_BALANCE
    }

    /// Used to initialize the user and house balances.
    public fun fund_addresses(scenario: &mut Scenario, house: address, player: address, house_funds: u64, player_funds: u64) {
        let ctx = scenario.ctx();
        // Send coins to players.
        let coinA = coin::mint_for_testing<FAUCETUCOIN>(house_funds, ctx);
        let coinB = coin::mint_for_testing<FAUCETUCOIN>(player_funds, ctx);
        transfer::public_transfer(coinA, house);
        transfer::public_transfer(coinB, player);
    }

    /// Deployment & house object initialization.
    /// Variable valid_coin is used to test expected failures.
    public fun init_house(scenario: &mut Scenario, house: address, valid_coin: bool) {
        scenario.next_tx(house);
        {
            let ctx = scenario.ctx();
            hd::init_for_testing(ctx);
        };

        // House initializes the contract with PK.
        scenario.next_tx(house);
        {
            let house_cap = scenario.take_from_sender<HouseCap>();
            if (valid_coin) {
                let house_coin = scenario.take_from_sender<Coin<FAUCETUCOIN>>();
                let ctx = scenario.ctx();
                house_cap.initialize_house_data(house_coin, PK, ctx);
            } else {
                let ctx = scenario.ctx();
                let zero_coin = coin::zero<FAUCETUCOIN>(ctx);
                house_cap.initialize_house_data(zero_coin, PK, ctx);
            };
        };
    }

    /// Create a Counter NFT for the player.
    fun create_counter_nft(scenario: &mut Scenario, player: address) {
        scenario.next_tx(player);
        {
            let ctx = scenario.ctx();
            let counter = counter_nft::mint(ctx);
            counter.transfer_to_sender(ctx);
        };
    }

    /// Helper function to get the game's fees.
    public fun game_fees(scenario: &mut Scenario, game_id: ID, house: address): u16 {
        scenario.next_tx(house);
        let house_data = scenario.take_shared<HouseData>();
        let game = sps::borrow_game(game_id, &house_data);
        let game_fee = game.fee_in_bp();
        test_scenario::return_shared(house_data);
        game_fee
    }

    /// Advance the scenario by n epochs.
    public fun advance_epochs(scenario: &mut Scenario, sender: address, epochs: u64) {
        scenario.next_tx(sender);
        {
            let mut i = 0 ;
            while(i < epochs) {
                scenario.next_epoch(sender);
                i = i + 1;
            }
        };
    }

    // ------------------- For Single Player Satoshi -------------------

    /// Used to create a counter nft and a game for the player.
    /// Variables house_wins and valid_guess are used to test different outcomes and expected failures.
    public fun create_counter_nft_and_game(scenario: &mut Scenario, player: address, stake: u64, house_wins: bool, valid_guess: bool): ID {
        // Player creates Counter NFT
        create_counter_nft(scenario, player);

        scenario.next_tx(player);
        let mut player_coin = scenario.take_from_sender<Coin<FAUCETUCOIN>>();
        let mut player_counter = scenario.take_from_sender<Counter>();
        let mut house_data = scenario.take_shared<HouseData>();
        let ctx = scenario.ctx();
        let stake_coin = player_coin.split(stake, ctx);
        let guess = if(house_wins) {HEADS.to_string()} else {TAILS.to_string()};
        let guess_value = if(valid_guess) {guess} else {INVALID.to_string()};
        let game_id = sps::start_game(guess_value, &mut player_counter, stake_coin, &mut house_data, ctx);
        test_scenario::return_shared(house_data);
        scenario.return_to_sender(player_counter);
        scenario.return_to_sender(player_coin);
        game_id
    }

    /// House ends the game.
    /// Variable valid_sig is used to test expected failures.
    public fun end_game(scenario: &mut Scenario, game_id: ID, house: address, valid_sig: bool) {
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();

            let sig = if (valid_sig) {BLS_SIG} else {INVALID_BLS_SIG};
            sps::finish_game(game_id, sig, &mut house_data, ctx);

            test_scenario::return_shared(house_data);
        };
    }

    // ------------------- For MEV attack resistant Single Player Satoshi -------------------


    /// Helper function to get the game's fees.
    public fun game_fees_mev(scenario: &mut Scenario, game_id: ID, house: address): u16 {
        scenario.next_tx(house);
        let house_data = scenario.take_shared<HouseData>();
        let game = mev_sps::borrow_game(&house_data, game_id);
        let game_fee = game.fee_in_bp();
        test_scenario::return_shared(house_data);
        game_fee
    }

    /// Player creates the game and submits stake.
    /// Stake is passed as a parameter to test various scenarios.
    public fun mev_create_game_counter_and_submit_stake(scenario: &mut Scenario, player: address, stake: u64): ID {
        // Player creates Counter NFT.
        create_counter_nft(scenario, player);

        scenario.next_tx(player);
        let mut player_coin = scenario.take_from_sender<Coin<FAUCETUCOIN>>();
        let mut house_data = scenario.take_shared<HouseData>();
        let ctx = scenario.ctx();
        let stake_coin = player_coin.split(stake, ctx);
        let game_id = mev_sps::create_game_and_submit_stake(&mut house_data, stake_coin, ctx);
        test_scenario::return_shared(house_data);
        scenario.return_to_sender(player_coin);

        game_id
    }

    /// Players sumbits guess.
    public fun mev_submit_guess(scenario: &mut Scenario, game_id: ID, player: address, house_wins: bool, valid_guess: bool) {

        scenario.next_tx(player);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let mut player_counter = scenario.take_from_sender<Counter>();
            let ctx = scenario.ctx();
            let guess = if(house_wins) {HEADS.to_string()} else {TAILS.to_string()};
            let guess_value = if(valid_guess) {guess} else {INVALID.to_string()};
            mev_sps::submit_guess(&mut house_data, &mut player_counter, game_id, guess_value, ctx);
            scenario.return_to_sender(player_counter);
            test_scenario::return_shared(house_data);
        };
    }

    /// Players tries to sumbit guess on someone else's game.
    public fun mev_submit_guess_of_another_players_game(scenario: &mut Scenario, game_id: ID, playerB: address, house_wins: bool, valid_guess: bool) {

        scenario.next_tx(playerB);
        {
            let mut player_counter = scenario.take_from_sender<Counter>();
            let guess = if(house_wins) {HEADS.to_string()} else {TAILS.to_string()};
            let guess_value = if(valid_guess) {guess} else {INVALID.to_string()};
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();
            mev_sps::submit_guess(&mut house_data, &mut player_counter, game_id, guess_value, ctx);
            scenario.return_to_sender(player_counter);
            test_scenario::return_shared(house_data);
        };

    }

    /// House ends the game.
    public fun mev_end_game(scenario: &mut Scenario, game_id: ID, house: address, valid_sig: bool) {
        scenario.next_tx(house);
        {
            let mut house_data = scenario.take_shared<HouseData>();
            let ctx = scenario.ctx();

            let sig = if (valid_sig) {BLS_SIG} else {INVALID_BLS_SIG};
            mev_sps::finish_game(&mut house_data, game_id, sig, ctx);

            test_scenario::return_shared(house_data);
        };
    }
}
