
/// Module: task4
module amazing::amazing {
    use sui::object::{Self, UID, ID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::package;
    use sui::clock::Clock;
    use sui::clock::{Self, Clock};

    // const EInvalidSendAmount: u64 = 0;
    const EAlreadyClaimed: u64 = 1;
    const ENotInSpecifiedRecipients: u64 = 2;
    // --------------- Witness ---------------
    // Import the `clock` module and the `Clock` type.
    public struct Timestamp has key, store {
        id: UID,
        timestamp: u64,
    }

    public fun new(clock: &Clock, ctx: &mut TxContext): Timestamp {
        // The `timestamp_ms` is the main function of the `Clock` module.
        let timestamp = clock.timestamp_ms();

        Timestamp { timestamp, id: object::new(ctx) }
    }


    struct PlayerRecord has key, store {
        id: UID,
        lotteryId: ID,
        tickets: vector<u64>,
    }

    struct AmazingData has key,store {
        id: UID,
        lottery_attach: u64,
        lottery_join: u64,
        lottery_amazing: u64,
    }

    struct AMAZING has drop {}

    struct AdminCap has key {
        id: UID,
    }

    fun init(otw: AMAZING, ctx: &mut TxContext) {
        let admin = tx_context::sender(ctx);
        let publisher = package::claim(otw, ctx);
        transfer::public_transfer(publisher, admin);
        let admin_cap = AdminCap { id: object::new(ctx) };
        transfer::transfer(admin_cap, admin);
        let amazing_record  =  AmazingData{id: object::new(ctx),lottery_attach:0,lottery_join:0,lottery_amazing:0};
        transfer::share_object(amazing_record);
    }

    public fun join(self: &mut AmazingData) {
        self.lottery_join = self.lottery_join+1;
    }
}

