// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

/// This module implements a single player Satoshi Flip game that is resistant to MEV attacks.
/// Operates in a similar manner to single_player_satoshi_flip, but with the addition of
/// a guess submission step.
module martinyeung5::mev_attack_resistant_single_player_satoshi {
    // Imports
    use std::string::String;

    use sui::coin::{Self, Coin};
    use sui::balance::Balance;
    use sui::sui::SUI;
    use sui::bls12381::bls12381_min_pk_verify;
    use sui::event::emit;
    use sui::hash::blake2b256;
    use sui::dynamic_object_field as dof;

    // Counter library
    use martinyeung5::counter_nft::Counter;

    // HouseData library
    use martinyeung5::house_data::HouseData;

    // Faucet Coin
    use fungible_tokens::faucetucoin::{Self, FAUCETUCOIN};

    // Consts
    const EPOCHS_CANCEL_AFTER: u64 = 7;
    const GAME_RETURN: u8 = 2;
    const FUNDS_SUBMITTED_STATE: u8 = 0;
    const GUESS_SUBMITTED_STATE: u8 = 1;
    const PLAYER_WON_STATE: u8 = 2;
    const HOUSE_WON_STATE: u8 = 3;
    const CHALLENGED_STATE: u8 = 4;
    const HEADS: vector<u8> = b"H";
    const TAILS: vector<u8> = b"T";

    // Errors
    const EStakeTooLow: u64 = 0;
    const EStakeTooHigh: u64 = 1;
    const EInvalidBlsSig: u64 = 2;
    const ECanNotChallengeYet: u64 = 3;
    const EInvalidGuess: u64 = 4;
    const EInsufficientHouseBalance: u64 = 5;
    const EGameInvalidState: u64 = 6;
    const ECallerNotGamePlayer: u64 = 7;
    const EGameDoesNotExist: u64 = 8;
    const EGameNotInGuessSubmittedState: u64 = 9;

    // Events

    /// Emitted when a new game has its guess submitted.
    public struct NewGame has copy, drop {
        game_id: ID,
        player: address,
        vrf_input: vector<u8>,
        guess: String,
        user_stake: u64, // 2x user_stake should always equal the total_stake
        fee_bp: u16
    }

    /// Emitted when a game has ended.
    public struct Outcome has copy, drop {
        game_id: ID,
        status: u8
    }

    // Structs

    /// Represents a game and holds the acrued stake.
    /// The guess field could have also been represented as a u8 or boolean, but we chose to use "H" and "T" strings for readability and safety.
    /// Makes it easier for the user to assess if a selection they made on a DApp matches with the txn they are signing on their wallet.
    public struct Game has key, store {
        id: UID,
        guess_placed_epoch: Option<u64>,
        total_stake: Balance<FAUCETUCOIN>,
        guess: Option<String>,
        player: address,
        vrf_input: Option<vector<u8>>,
        fee_bp: u16,
        status: u8
    }

    /// Function used to create a new game.
    /// Stake is taken from the player's coin and added to the game's stake.
    /// The house's stake is also added to the game's stake.
    public fun create_game_and_submit_stake(house_data: &mut HouseData, coin: Coin<FAUCETUCOIN>, ctx: &mut TxContext): ID {
        let fee_bp = house_data.base_fee_in_bp();
        let (id, new_game) = internal_create_game_and_submit_stake(house_data, coin, fee_bp, ctx);

        dof::add(house_data.borrow_mut(), id, new_game);
        id
    }

    /// Function used to submit the VRF input & the player's guess.
    /// Requires that the player has already submitted the stake and that they have already created at least one counter NFT.
    public fun submit_guess(house_data: &mut HouseData, counter: &mut Counter, game_id: ID, guess: String, ctx: &mut TxContext) {
        // Ensure that the game exists.
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        // Ensure guess is valid.
        map_guess(guess);

        // Get a mutable reference to the game object.
        let game_mut_ref = borrow_mut( house_data, game_id);

        // Ensure caller is the one that created the game.
        assert!(ctx.sender() == game_mut_ref.player, ECallerNotGamePlayer);
        // Ensure that the game is in a valid state.
        // For this function the game must be in FUNDS_SUBMITTED_STATE.
        // Other states are invalid while calling this function.
        assert!(status(game_mut_ref) == FUNDS_SUBMITTED_STATE, EGameInvalidState);

        // Update all the option fields
        game_mut_ref.guess.fill(guess);

        let vrf_input = counter.get_vrf_input_and_increment();
        game_mut_ref.vrf_input.fill(vrf_input);

        let guess_placed_epoch = ctx.epoch();
        game_mut_ref.guess_placed_epoch.fill(guess_placed_epoch);

        // Update game status
        game_mut_ref.status = GUESS_SUBMITTED_STATE;

        emit(NewGame {
            game_id,
            player: player(game_mut_ref),
            vrf_input,
            guess,
            user_stake: stake(game_mut_ref) / (GAME_RETURN as u64),
            fee_bp: fee_in_bp(game_mut_ref)
        });
    }

    /// Function that determines the winner and distributes the funds accordingly.
    /// If the player wins and fees are = 0, the entire stake balance is transferred to the player.
    /// If the player wins and fees are > 0, the fees are taken from the stake balance and transferred
    /// to the house before transferring the rewards to the player.
    /// If house wins, the entire stake balance is transferred to the house_data's balance field.
    /// Anyone can end the game (game & house_data objects are shared).
    /// The BLS signature of the counter id and the counter's count at the time of game creation appended together.
    /// If an incorrect BLS sig is passed the function will abort.
    /// An Outcome event is emitted to signal that the game has ended.
    public fun finish_game(house_data: &mut HouseData, game_id: ID, bls_sig: vector<u8>, ctx: &mut TxContext) {
        // Ensure that the game exists.
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        let Game {
            id,
            guess_placed_epoch: _,
            mut total_stake,
            guess,
            player,
            vrf_input,
            fee_bp,
            status
        } = dof::remove(house_data.borrow_mut(), game_id);

        object::delete(id);

        // Ensure that the game is in the correct state
        assert!(status == GUESS_SUBMITTED_STATE, EGameInvalidState);

        // Step 1: Check the BLS signature, if its invalid abort.
        let is_sig_valid = bls12381_min_pk_verify(&bls_sig, &house_data.public_key(), vrf_input.borrow());
        assert!(is_sig_valid, EInvalidBlsSig);

        // Hash the beacon before taking the 1st byte.
        let hashed_beacon = blake2b256(&bls_sig);
        // Step 2: Determine winner.
        let first_byte = hashed_beacon[0];
        let game_guess = *guess.borrow();
        let player_won = map_guess(game_guess) == (first_byte % 2);
        let stake_amount = total_stake.value();

        // Step 3: Distribute funds based on result.
        let status = if (player_won) {
            // Step 3.a: If player wins transfer the game balance as a coin to the player.
            // Calculate the fee and transfer it to the house.
            let amount = fee_amount(stake_amount, fee_bp);
            let fees = total_stake.split(amount);
            house_data.borrow_fees_mut().join(fees);

            // Calculate the rewards and take it from the game stake.
            transfer::public_transfer(total_stake.into_coin(ctx), player);
            PLAYER_WON_STATE
        } else {
            // Step 3.b: If house wins, then add the game stake to the house_data.house_balance (no fees are taken).
            house_data.borrow_balance_mut().join(total_stake);
            HOUSE_WON_STATE
        };

        emit(Outcome {
            game_id,
            status
        });
    }

    /// Function used to cancel a game after EPOCHS_CANCEL_AFTER epochs have passed. Can be called by anyone.
    /// On successful execution the entire game stake is returned to the player.
    public fun dispute_and_win(house_data: &mut HouseData, game_id: ID, ctx: &mut TxContext) {
        // Ensure that the game exists.
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        let Game {
            id,
            guess_placed_epoch,
            total_stake,
            guess: _,
            player,
            vrf_input: _,
            fee_bp: _,
            status
        } = dof::remove(house_data.borrow_mut(), game_id);

        object::delete(id);

        // Ensure that the game is in the correct state
        assert!(status == GUESS_SUBMITTED_STATE, EGameInvalidState);

        let current_epoch = ctx.epoch();
        let cancel_epoch = *guess_placed_epoch.borrow() + EPOCHS_CANCEL_AFTER;

        // Ensure that minimum epochs have passed before user can cancel.
        assert!(cancel_epoch <= current_epoch, ECanNotChallengeYet);

        transfer::public_transfer(total_stake.into_coin(ctx), player);

        emit(Outcome {
            game_id,
            status: CHALLENGED_STATE
        });
    }

    // --------------- Game Accessors ---------------

    /// Returns the epoch in which the guess was placed.
    public fun guess_placed_epoch(game: &Game): u64 {
        assert!(game.guess_placed_epoch.is_some(), EGameNotInGuessSubmittedState);
        *game.guess_placed_epoch.borrow()
    }

    /// Returns the total stake.
    public fun stake(game: &Game): u64 {
        game.total_stake.value()
    }

    /// Returns the player's guess.
    public fun guess(game: &Game): u8 {
        assert!(game.guess.is_some(), EGameNotInGuessSubmittedState);
        let guess = *game.guess.borrow();
        map_guess(guess)
    }

    /// Returns the player's address.
    public fun player(game: &Game): address {
        game.player
    }

    /// Returns the player's vrf_input bytes.
    public fun vrf_input(game: &Game): vector<u8> {
        assert!(game.vrf_input.is_some(), EGameNotInGuessSubmittedState);
        *game.vrf_input.borrow()
    }

    /// Returns the fee of the game.
    public fun fee_in_bp(game: &Game): u16 {
        game.fee_bp
    }

    /// Returns the status of the game.
    public fun status(game: &Game): u8 {
        game.status
    }

    // --------------- Public Helper Functions ---------------

    /// Helper function to calculate the amount of fees to be paid.
    /// Fees are only applied on the player's stake.
    public fun fee_amount(game_stake: u64, fee_in_bp: u16): u64 {
        (((game_stake / (GAME_RETURN as u64)) as u128) * (fee_in_bp as u128) / 10_000) as u64
    }

    /// Helper function to check if a game exists.
    public fun game_exists(house_data: &HouseData, game_id: ID): bool {
        dof::exists_(house_data.borrow(), game_id)
    }

    /// Helper function to check that a game exists and return a reference to the game Object.
    public fun borrow_game(house_data: &HouseData, game_id: ID): &Game {
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);
        dof::borrow(house_data.borrow(), game_id)
    }

    // --------------- Internal Helper Functions ---------------

    /// Helper function to check that a game exists and return a mutable reference to the game Object.
    fun borrow_mut(house_data: &mut HouseData, game_id: ID): &mut Game {
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);
        dof::borrow_mut(house_data.borrow_mut(), game_id)
    }

    /// Helper function to map (H)EADS and (T)AILS to 0 and 1 respectively.
    /// H = 0
    /// T = 1
    fun map_guess(guess: String): u8 {
    	let heads = HEADS;
    	let tails = TAILS;
        assert!(guess.bytes() == heads|| guess.bytes() == tails, EInvalidGuess);

        if (guess.bytes() == heads) {
            0
        } else {
            1
        }
    }

    /// Internal helper function used to create a new game.
    /// Stake is taken from the player's coin and added to the game's stake.
    /// The house's stake is also added to the game's stake.
    fun internal_create_game_and_submit_stake(house_data: &mut HouseData, coin: Coin<FAUCETUCOIN>, fee_bp: u16, ctx: &mut TxContext): (ID, Game) {
        let user_stake = coin.value();
        // Ensure that the stake is not higher than the max stake.
        assert!(user_stake <= house_data.max_stake(), EStakeTooHigh);
        // Ensure that the stake is not lower than the min stake.
        assert!(user_stake >= house_data.min_stake(), EStakeTooLow);
        // Ensure that the house has enough balance to play for this game.
        assert!(house_data.balance() >= user_stake, EInsufficientHouseBalance);


        // Get the house's stake.
        let mut total_stake = house_data.borrow_balance_mut().split(user_stake);
        coin::put(&mut total_stake, coin);

        let id = object::new(ctx);
        let new_game = Game {
            id,
            guess_placed_epoch: option::none(),
            total_stake,
            guess: option::none(),
            player: ctx.sender(),
            vrf_input: option::none(),
            fee_bp,
            status: FUNDS_SUBMITTED_STATE
        };

        (object::id(&new_game), new_game)
    }

}
