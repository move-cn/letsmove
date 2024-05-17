module satoshi_flip::single_player_satoshi {
    use std::string::String;

    use sui::coin::{Self, Coin};
    use sui::balance::Balance;
    use sui::sui::SUI;
    use sui::bls12381::bls12381_min_pk_verify;
    use sui::event::emit;
    use sui::hash::{blake2b256};
    use sui::dynamic_object_field::{Self as dof};

    use satoshi_flip::counter_nft::Counter;
    use satoshi_flip::house_data::HouseData;

    const EPOCHS_CANCLE_AFTER: u64 = 7;
    const GAMW_RETURN: u8 = 2;
    const PLAYER_WON_STATE: u8 = 1;
    const HOUSE_WON_STATE: u8 = 2;
    const CHALLENGED_STATE: u8 = 3;
    const HEADS: vector<u8> = b"H";
    const TAILS: vector<u8> = b"T";

    const EStakeToolLow: u64 = 0;
    const EStakeTooHigh: u64 = 1;
    const EInvalidBlsSig: u64 = 2;
    const ECanNotChallengeYet: u64 = 3;
    const EInvalidGuess: u64 = 4;
    const EInsufficientHouseBalance: u64 = 5;
    const EGameDoesNotExist: u64 = 6;

    public struct NewGame has copy, drop {
        game_id:ID,
        player: address,
        vrf_input: vector<u8>,
        guess: String,
        user_stake: u64,
        fee_bp: u16
    }

    public struct Outcome has copy, drop {
        game_id: ID,
        status: u8
    }

    public struct Game has key, store {
        id: UID,
        guess_placed_epoch: u64,
        total_stake: Balance<SUI>,
        guess: String,
        player: address,
        vrf_input: vector<u8>,
        fee_bp: u16
    }

    public fun finish_game(game_id: ID, bls_sig: vector<u8>, house_data: &mut HouseData, ctx: &mut TxContext) {
        assert!(game_exists(house_data, game_id), EGameDoesNotExist);

        let Game {
            id,
            guess_placed_epoch: _,
            mut total_stake,
            guess,
            player, 
            vrf_input,
            fee_bp
        } = dof::remove<ID, Game>(house_data.borrow_mut(), game_id);

        object::delete(id);

        let is_sig_valid = bls12381_min_pk_verify(&bls_sig, &house_data.public_key(), &vrf_input);

    }
}