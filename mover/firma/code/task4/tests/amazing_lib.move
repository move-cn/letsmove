module amazing::amazing_lib {
    // use std::ascii::String;
    // use std::string::{Self};
    // use sui::balance::Balance;
    // use sui::object::{Self, UID, ID};
    // use sui::tx_context::{Self, TxContext};
    // use sui::transfer;
    // use sui::package;
    // use sui::clock::Clock;
    // use sui::clock::{Self, Clock};
    // use sui::sui::SUI;
    //
    // // const EInvalidSendAmount: u64 = 0;
    // const EAlreadyClaimed: u64 = 1;
    // const ENotInSpecifiedRecipients: u64 = 2;
    // // --------------- Witness ---------------
    // // Import the `clock` module and the `Clock` type.
    // public struct Timestamp has key, store {
    //     id: UID,
    //     timestamp: u64,
    // }
    //
    // public fun new(clock: &Clock, ctx: &mut TxContext): Timestamp {
    //     // The `timestamp_ms` is the main function of the `Clock` module.
    //     let timestamp = clock.timestamp_ms();
    //     Timestamp { timestamp, id: object::new(ctx) }
    // }
    //
    //
    // struct PlayerRecord has key, store {
    //     id: UID,
    //     lotteryId: ID,
    //     tickets: vector<u64>,
    // }
    //
    // struct AmazingHoseData has key,store {
    //     id: UID,
    //     // House's balance which also contains the accrued winnings of the house.
    //     balance: Balance<SUI>,
    //     // Address of the house or the game operator.
    //     house: address,
    //     lottery_attach: u64,
    //     lottery_join: u64,
    //     lottery_amazing: u64,
    //     // Maximum stake amount a player can bet in a single game.
    //     max_stake: u64,
    //     // Minimum stake amount required to play the game.
    //     min_stake: u64,
    //     // The accrued fees from games played.
    //     // The default fee in basis points. 1 basis point = 0.01%.
    //     base_fee_in_bp: u16,
    // }
    //
    // public struct Game has key, store {
    //     id: UID,
    //     game_start_epoch: u64,
    //     stake: Balance<SUI>,
    //     player: address,
    //     // The VRF input used to generate the extended beacon
    //     vrf_input: vector<u8>,
    //     fee_bp: u16
    // }
    //
    // struct AMAZING has drop {}
    //
    // struct AdminCap has key, store { id: UID }
    //
    // struct AmazingOracle has key {
    //     id: UID,
    //     address: address,
    //     amount:u64,
    // }
    //
    // /// Emitted when a new game has started.
    // public struct NewGame has copy, drop {
    //     game_id: ID,
    //     player: address,
    //     vrf_input: vector<u8>,
    //     user_stake: u64,
    //     fee_bp: u16
    // }
    //
    //
    // fun init(otw: AMAZING, ctx: &mut TxContext) {
    //
    //     let admin = tx_context::sender(ctx);
    //     let publisher = package::claim(otw, ctx);
    //     transfer::public_transfer(publisher, admin);
    //
    //     let admin_cap = AdminCap { id: object::new(ctx) };
    //     transfer::transfer(admin_cap, admin);
    //
    //     let amazing_record  =  AmazingHoseData{
    //         id: object::new(ctx),lottery_attach:0,lottery_join:0,lottery_amazing:0
    //     };
    //     transfer::share_object(amazing_record);
    //
    //     let amazing_oracle = AmazingOracle { id: object::new(ctx), address: tx_context::sender(ctx), amount: 0, };
    //     transfer::share_object(amazing_oracle);
    // }




}
