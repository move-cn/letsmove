module spam::spam
{
    // === Imports ===

    use sui::coin::{create_currency, Coin, TreasuryCap};
    use sui::table::{Self, Table};
    use spam::icon::{get_icon_url};

    // === Errors ===

    const EWrongEpoch: u64 = 100;
    const EDirectorIsPaused: u64 = 101;
    const EUserIsRegistered: u64 = 102;
    const EUserCounterIsRegistered: u64 = 103;
    const EUserCounterIsNotRegistered: u64 = 104;

    // === Constants ===

    const TOTAL_EPOCH_REWARD: u64 = 10_000_000_000_000; // 1 billion (4 decimals)

    // === Structs ===

    public struct SPAM has drop {}

    public struct AdminCap has store, key {
    id: UID,
}

    /// Singleton shared object to coordinate state and to mint coins.
    public struct Director has key, store {
    id: UID,
    paused: bool,
    tx_count: u64,
    treasury: TreasuryCap<SPAM>,
    epoch_counters: Table<u64, EpochCounter>, // keys are epochs
}

    /// Can only exist inside the Director.epoch_counters table.
    /// Tracks how many tx blocks each user completed in one epoch.
    public struct EpochCounter has store {
    epoch: u64,
    tx_count: u64,
    user_counts: Table<address, u64>,
}

    /// Non transferable owned object tied to a user address.
    /// Tracks how many tx blocks the user completed in one epoch.
    public struct UserCounter has key {
    id: UID,
    epoch: u64,
    tx_count: u64,
    registered: bool,
}

    public struct Stats has copy, drop {
    epoch: u64,
    paused: bool,
    tx_count: u64,
    supply: u64,
    epochs: vector<EpochStats>,
}

    public struct EpochStats has copy, drop {
    epoch: u64,
    tx_count: u64,
}

    // === Public-Mutative Functions ===

    /// Users can create multiple counters per epoch, but it is pointless
    /// because they can only register() one of them.
    entry fun new_user_counter(
        director: &Director,
        ctx: &mut TxContext,
    ) {
        assert!(director.paused == false, EDirectorIsPaused);
        let user_counter =  UserCounter {
            id: object::new(ctx),
            epoch: ctx.epoch(),
            tx_count: 1, // count this transaction
            registered: false,
        };
        transfer::transfer(user_counter, ctx.sender());
    }

    /// Users can only increase their tx counter for the current epoch.
    /// Users can only call this function once per tx block.
    entry fun increment_user_counter(
        mut user_counter: UserCounter,
        ctx: &TxContext,
    ) {
        assert!(user_counter.epoch == ctx.epoch(), EWrongEpoch);
        user_counter.tx_count = user_counter.tx_count + 1;
        transfer::transfer(user_counter, ctx.sender());
    }

    public fun destroy_user_counter(
        user_counter: UserCounter,
    ) {
        let UserCounter { id, epoch: _, tx_count: _, registered: _} = user_counter;
        id.delete();
    }

    /// Users can only register their counter during the 1st epoch after UserCounter.epoch.
    /// Users can only register one UserCounter per epoch.
    public fun register_user_counter(
        director: &mut Director,
        user_counter: &mut UserCounter,
        ctx: &mut TxContext,
    ) {
        assert!(director.paused == false, EDirectorIsPaused);
        assert!(user_counter.registered == false, EUserCounterIsRegistered);

        let previous_epoch = ctx.epoch() - 1;
        assert!(user_counter.epoch == previous_epoch, EWrongEpoch);

        let sender_addr = ctx.sender();
        let epoch_counter = director.get_or_create_epoch_counter(previous_epoch, ctx);
        assert!(epoch_counter.user_counts.contains(sender_addr) == false, EUserIsRegistered);

        epoch_counter.user_counts.add(sender_addr, user_counter.tx_count);
        epoch_counter.tx_count = epoch_counter.tx_count + user_counter.tx_count;
        director.tx_count = director.tx_count + user_counter.tx_count;
        user_counter.registered = true;
    }

    /// Users can only claim their rewards from the 2nd epoch after UserCounter.epoch.
    /// User rewards are proportional to their share of completed txs in the epoch.
    /// Director.paused is not checked here so users can always claim past rewards.
    public fun claim_user_counter(
        director: &mut Director,
        user_counter: UserCounter,
        ctx: &mut TxContext,
    ): Coin<SPAM> {
        let max_allowed_epoch = ctx.epoch() - 2;
        assert!(user_counter.epoch <= max_allowed_epoch, EWrongEpoch);
        assert!(user_counter.registered == true, EUserCounterIsNotRegistered);

        let epoch_counter = director.epoch_counters.borrow_mut(user_counter.epoch);
        // we can safely remove the user from the EpochCounter because users
        // are no longer allowed to register() a UserCounter for this epoch
        let user_txs = epoch_counter.user_counts.remove(ctx.sender());
        let user_reward = (
            ((TOTAL_EPOCH_REWARD as u128) * (user_txs as u128)) / (epoch_counter.tx_count as u128)
                as u64);

        user_counter.destroy_user_counter();

        let coin = director.treasury.mint(user_reward, ctx);
        return coin
    }

    // === Public-View Functions ===

    /// Get Stats for the Director and selected epochs.
    /// Epochs without an EpochCounter are represented with tx_count=0.
    public fun stats_for_specific_epochs(
        director: &Director,
        epoch_numbers: vector<u64>,
        ctx: &TxContext,
    ): Stats {
        let mut epoch_stats = vector<EpochStats>[];
        let mut i = 0;
        let count = epoch_numbers.length();
        while (i < count) {
        let epoch_number = *epoch_numbers.borrow(i);
        if ( director.epoch_counters.contains(epoch_number) ) {
        let epoch = director.epoch_counters.borrow(epoch_number);
        let stats = EpochStats {
        epoch: epoch.epoch,
        tx_count: epoch.tx_count,
        };
        epoch_stats.push_back(stats);
        } else {
        let stats = EpochStats {
        epoch: epoch_number,
        tx_count: 0,
        };
        epoch_stats.push_back(stats);
        };
        i = i + 1;
        };
        return Stats {
        epoch: ctx.epoch(),
        paused: director.paused,
        tx_count: director.tx_count,
        supply: director.treasury.total_supply(),
        epochs: epoch_stats,
        }
    }

    /// Get Stats for the Director and the latest epochs, in descending order, and starting
    /// from yesterday's epoch because today's EpochCounter cannot exist (see register()).
    public fun stats_for_recent_epochs(
        director: &Director,
        epoch_count: u64,
        ctx: &TxContext,
    ): Stats {
        let epoch_now = ctx.epoch();
        let mut epoch_numbers = vector<u64>[];
        let mut i = 0;
        while (i < epoch_count && i < epoch_now) {
        i = i + 1;
        epoch_numbers.push_back(epoch_now - i);
        };
        return stats_for_specific_epochs(director, epoch_numbers, ctx)
    }

    // === Admin functions ===

    public fun admin_pause(
        director: &mut Director,
        _: &AdminCap,
    ) {
        director.paused = true;
    }

    public fun admin_resume(
        director: &mut Director,
        _: &AdminCap,
    ) {
        director.paused = false;
    }

    public fun admin_destroy(
        cap: AdminCap,
    ) {
        let AdminCap { id } = cap;
        id.delete();
    }

    // === Private functions ===

    fun get_or_create_epoch_counter(
        director: &mut Director,
        epoch: u64,
        ctx: &mut TxContext,
    ): &mut EpochCounter {
        if ( !director.epoch_counters.contains(epoch) ) {
            let epoch_counter = EpochCounter {
                epoch,
                user_counts: table::new(ctx),
                tx_count: 0,
            };
            director.epoch_counters.add(epoch, epoch_counter);
        };
        return director.epoch_counters.borrow_mut(epoch)
    }

    // === Initialization ===

    fun init(witness: SPAM, ctx: &mut TxContext)
    {
        // Create the coin
        let (treasury, metadata) = create_currency(
            witness,
            4, // decimals
            b"SPAM", // symbol
            b"SPAM", // name
            b"The original Proof of Spam coin", // description
            option::some(get_icon_url()), // icon_url
            ctx,
        );

        // Freeze the metadata
        transfer::public_freeze_object(metadata);

        // Create the only Director that will ever exist, and share it
        let director = Director {
            id: object::new(ctx),
            treasury,
            epoch_counters: table::new(ctx),
            tx_count: 0,
            paused: true,
        };
        transfer::share_object(director);

        // Create the admin capability, and transfer it
        let adminCap = AdminCap {
            id: object::new(ctx),
        };
        transfer::transfer(adminCap, ctx.sender())
    }

    // === Test Functions ===

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(SPAM {}, ctx);
    }

    #[test_only]
    public fun new_user_counter_for_testing(director: &Director, ctx: &mut TxContext) {
        new_user_counter(director, ctx)
    }

    #[test_only]
    public fun increment_user_counter_for_testing(
        user_counter: UserCounter,
        ctx: &TxContext,
    ) {
        increment_user_counter(user_counter, ctx);
    }

    #[test_only]
    public fun epoch(user_counter: &UserCounter): u64 {
        user_counter.epoch
    }

    #[test_only]
    public fun tx_count(user_counter: &UserCounter): u64 {
        user_counter.tx_count
    }

    #[test_only]
    public fun registered(user_counter: &UserCounter): bool {
        user_counter.registered
    }

    #[test_only]
    public fun paused(director: &Director): bool {
        director.paused
    }

    #[test_only]
    public fun director_tx_count(director: &Director): u64 {
        director.tx_count
    }

    #[test_only]
    public fun spam_total_supply(director: &Director): u64 {
        director.treasury.total_supply()
    }

    #[test_only]
    public fun epoch_tx_count(director: &Director, epoch: u64): u64 {
        if (!director.epoch_counters.contains(epoch)) return 0;

        director.epoch_counters.borrow(epoch).tx_count
    }

    #[test_only]
    public fun epoch_user_counts(director: &Director, epoch: u64, user: address): u64 {
        *director.epoch_counters.borrow(epoch).user_counts.borrow(user)
    }
}
}