/// Module `suiswap::autolife_robotics_swap` provides functionalities for a decentralized
/// exchange (DEX) with automated market making (AMM) and flash loan capabilities.
///
/// Constants:
/// - `EZeroAmount`: Error code for zero amount supplied.
/// - `EPoolFull`: Error code for exceeding maximum pool value.
/// - `EFlashLoanNotRepaid`: Error code for unpaid flash loan.
/// - `EPositionNotOwned`: Error code for unauthorized position access.
/// - `EInsufficientAmount`: Error code for insufficient coin amount.
/// - `FEE_SCALING`: Scaling factor for fee calculation.
/// - `FEE_PERCENT`: Fee percentage for swaps (0.3%).
/// - `MAX_POOL_VALUE`: Maximum value for pool balances.
/// - `Q96`: Constant for fixed point arithmetic in price calculations.
/// - `X128`: Constant for high precision calculations.
///
/// Structs:
/// - `Tick`: Represents a price range with lower and upper bounds.
/// - `Position`: Represents a liquidity position within a tick range.
/// - `BeforeSwapEvent`: Event emitted before a swap.
/// - `AfterSwapEvent`: Event emitted after a swap.
/// - `FlashLoanState`: Tracks flash loan state.
/// - `Pool`: Represents a liquidity pool with token balances, fee, total liquidity, and flash loan state.
///
/// Functions:
/// - `init`: Initializes the module.
/// - `create_pool`: Creates a new liquidity pool.
/// - `mint_position`: Mints a new liquidity position.
/// - `burn_position`: Burns an existing liquidity position.
/// - `add_liquidity_to_position`: Adds liquidity to an existing position.
/// - `add_liquidity`: Adds liquidity to a new position.
/// - `remove_liquidity`: Removes liquidity from a position.
/// - `remove_liquidity_inner`: Helper function to remove liquidity.
/// - `swap_a_to_b`: Swaps token A to token B.
/// - `swap_b_to_a`: Swaps token B to token A.
/// - `print_string`: Prints a string for debugging.
/// - `calculate_swap_output`: Calculates output amount for swaps.
/// - `calculate_a_to_b_output`: Calculates output for A to B swap.
/// - `calculate_b_to_a_output`: Calculates output for B to A swap.
/// - `calculate_sqrt_price`: Calculates square root price using reserves ratio.
/// - `binary_search_sqrt`: Helper function for binary search square root.
/// - `get_amounts`: Retrieves pool token amounts and total liquidity.
/// - `flash_loan`: Executes a flash loan.
/// - `calculate_liquidity`: Calculates liquidity based on token amounts.

module suiswap::autolife_robotics_swap {
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::event::emit;
    use std::debug;
    use std::string;

    /// For when supplied Coin is zero.
    const EZeroAmount: u64 = 0;
    /// For when someone attempts to add more liquidity than u128 Math allows.
    const EPoolFull: u64 = 4;
    /// For when flash loan is not repaid.
    const EFlashLoanNotRepaid: u64 = 6;
    /// Error code for when the position is not owned by the sender.
    const EPositionNotOwned: u64 = 7;
    /// Error code for when the supplied Coin amount is insufficient.
    const EInsufficientAmount: u64 = 8;

    /// The integer scaling setting for fees calculation.
    const FEE_SCALING: u128 = 10000;
    /// The fee percent that will be taken from the swap.
    /// Set to 0.3%.
    const FEE_PERCENT: u128 = 30;
    /// The max value that can be held in one of the Balances of a Pool.
    const MAX_POOL_VALUE: u128 = 18446744073709551615;


    /// Q96 constant for fixed point arithmetic
    /// Used for price calculations with high precision
    const Q96: u128 = 79228162514264337593543950336;

    /// X128
    #[allow(unused_const)]
    const X128: u256 = 340282366920938463463374607431768211456;

    /// The Pool token used to mark the pool share of a liquidity provider.
  // Constants in ALL_CAPS with underscores
    const BALANCE_VALUE_SMALL: u64 = 1000;
    /// Represents a price range (tick lower and upper bounds).
    public struct Tick has store, copy, drop {
        lower: u128, // Stored as offset tick
        upper: u128, // Stored as offset tick
    }

    /// Represents a liquidity position within a certain tick range.
    public struct Position<phantom TA, phantom TB> has key, store {
        id: UID,
        owner: address,
        tick: Tick,
        liquidity: u128,
    }

    /// Event emitted before a swap.
    public struct BeforeSwapEvent has copy, drop, store {
        pool_address: address,
        token_in: u64,
        token_out: u64,
    }

    /// Event emitted after a swap.
    public struct AfterSwapEvent has copy, drop, store {
        pool_address: address,
        token_in: u64,
        token_out: u64,
    }

    /// Flash loan state tracking.
    public struct FlashLoanState has copy, drop, store {
        token_a_owed: u64,
        token_b_owed: u64,
    }

    /// The pool with exchange.
    public struct Pool<phantom TA, phantom TB> has key, store {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        fee_percent: u64,
        total_liquidity: u128, // Add total_liquidity field
        flash_loan_state: Option<FlashLoanState>,
    }

    fun init(_: &mut TxContext) {}

    public entry fun create_pool<TA, TB>(ctx: &mut TxContext) {
        let fee_percent = FEE_PERCENT as u64;

        let pool = Pool<TA, TB> {
            id: object::new(ctx),
            token_a: balance::zero<TA>(),
            token_b: balance::zero<TB>(),
            fee_percent,
            total_liquidity: 0u128,
            flash_loan_state: option::none(),
        };

        transfer::share_object(pool)
    }

    // Implement mint_position function with explicit type annotation
    fun mint_position<TA, TB>(
        owner: address,
        tick: Tick,
        liquidity: u128,
        ctx: &mut TxContext
    ): Position<TA, TB> {
        Position<TA, TB> {
            id: object::new(ctx),
            owner,
            tick,
            liquidity,
        }
    }

    // Implement burn_position function using object::delete
    fun burn_position<TA, TB>(
        position: Position<TA, TB>,
        ctx: &mut TxContext
    ) {
        let Position { id, owner, tick, liquidity } = position;
        object::delete(id);
        // 'position' is fully consumed
    }

    // Function to add liquidity to existing position
    public entry fun add_liquidity_to_position<TA, TB>(
        pool: &mut Pool<TA, TB>,
        mut position: Position<TA, TB>, // Add 'mut' here
        token_a: &mut Coin<TA>,
        token_b: &mut Coin<TB>,
        amount_a: u64,
        amount_b: u64,
        ctx: &mut TxContext
    ) {
        let sender = tx_context::sender(ctx);
        assert!(position.owner == sender, EPositionNotOwned);

        assert!(amount_a > 0 && amount_b > 0, EZeroAmount);
        assert!((amount_a as u128) < MAX_POOL_VALUE && (amount_b as u128) < MAX_POOL_VALUE, EPoolFull);

        // Split the coin balances to get the deposit amounts
        let token_a_split = balance::split(coin::balance_mut(token_a), amount_a);
        let token_b_split = balance::split(coin::balance_mut(token_b), amount_b);

        // Join the split balances into the pool's balances
        balance::join(&mut pool.token_a, token_a_split);
        balance::join(&mut pool.token_b, token_b_split);

        let new_liquidity = calculate_liquidity(amount_a as u128, amount_b as u128);

        position.liquidity = position.liquidity + new_liquidity;
        pool.total_liquidity = pool.total_liquidity + new_liquidity;

        // Return the updated position to the user
        transfer::public_transfer(position, sender);
    }

    // Modify add_liquidity to only handle new position creation
    public entry fun add_liquidity<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_a: &mut Coin<TA>,
        token_b: &mut Coin<TB>,
        amount_a: u64,
        amount_b: u64,
        lower_tick: u128,
        upper_tick: u128,
        ctx: &mut TxContext
    ) {
        assert!(amount_a > 0 && amount_b > 0, EZeroAmount);
        assert!((amount_a as u128) < MAX_POOL_VALUE && (amount_b as u128) < MAX_POOL_VALUE, EPoolFull);

        // Split the coin balances to get the deposit amounts
        let token_a_split = balance::split(coin::balance_mut(token_a), amount_a);
        let token_b_split = balance::split(coin::balance_mut(token_b), amount_b);

        // Join the split balances into the pool's balances
        balance::join(&mut pool.token_a, token_a_split);
        balance::join(&mut pool.token_b, token_b_split);

        let liquidity = calculate_liquidity(amount_a as u128, amount_b as u128);

        pool.total_liquidity = pool.total_liquidity + liquidity;

        let position: Position<TA, TB> = mint_position<TA, TB>(
            tx_context::sender(ctx),
            Tick { lower: lower_tick, upper: upper_tick },
            liquidity,
            ctx
        );

        // Transfer the Position NFT to the user
        transfer::public_transfer(position, tx_context::sender(ctx));
    }

    // Modify remove_liquidity function
    public entry fun remove_liquidity<TA, TB>(
        pool: &mut Pool<TA, TB>,
        position: Position<TA, TB>,
        ctx: &mut TxContext
    ) {
        // Verify ownership
        let sender = tx_context::sender(ctx);
        assert!(position.owner == sender, EPositionNotOwned);

        let liquidity = position.liquidity;

        // Remove liquidity based on position.liquidity
        let (token_a, token_b) = remove_liquidity_inner(pool, liquidity, ctx);

        // Update total_liquidity
        pool.total_liquidity = pool.total_liquidity - liquidity;

        // Burn the Position NFT
        burn_position(position, ctx);

        // Transfer tokens back to the user
        transfer::public_transfer(token_a, sender);
        transfer::public_transfer(token_b, sender);
    }

    fun remove_liquidity_inner<TA, TB>(
        pool: &mut Pool<TA, TB>,
        liquidity: u128,
        ctx: &mut TxContext
    ): (Coin<TA>, Coin<TB>) {
        let (token_a_amt, token_b_amt, total_liquidity) = get_amounts(pool);

        let token_a = (((token_a_amt as u128) * liquidity) / total_liquidity) as u64;
        let token_b = (((token_b_amt as u128) * liquidity) / total_liquidity) as u64;

        (
            coin::take(&mut pool.token_a, token_a, ctx),
            coin::take(&mut pool.token_b, token_b, ctx),
        )
    }

    // Modify swap_a_to_b function
    public entry fun swap_a_to_b<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_a: &mut Coin<TA>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(coin::value(token_a) >= amount, EInsufficientAmount);
        
        let token_a_split = balance::split(coin::balance_mut(token_a), amount);
        balance::join(&mut pool.token_a, token_a_split);
        let amount_out = calculate_swap_output(pool, amount, true);

        let pool_address = object::uid_to_address(&pool.id);
        emit(AfterSwapEvent {
            pool_address,
            token_in: amount,
            token_out: amount_out,
        });

        transfer::public_transfer(
            coin::take(&mut pool.token_b, amount_out, ctx),
            tx_context::sender(ctx)
        );
    }

    // Modify swap_b_to_a function
    public entry fun swap_b_to_a<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_b: &mut Coin<TB>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        assert!(coin::value(token_b) >= amount, EInsufficientAmount);

        let token_b_split = balance::split(coin::balance_mut(token_b), amount);
        balance::join(&mut pool.token_b, token_b_split);
        let amount_out = calculate_swap_output(pool, amount, false);

        let pool_address = object::uid_to_address(&pool.id);
        emit(AfterSwapEvent {
            pool_address,
            token_in: amount,
            token_out: amount_out,
        });

        transfer::public_transfer(
            coin::take(&mut pool.token_a, amount_out, ctx),
            tx_context::sender(ctx)
        );
    }

    fun print_string(str: vector<u8>) {
        debug::print(&string::utf8(str));
    }

    // Calculate output amount for swaps based on:
    // - Current pool reserves
    // - Square root price calculation
    // - Active liquidity
    // - Fee deduction
    fun calculate_swap_output<TA, TB>(
        pool: &Pool<TA, TB>,
        amount_in: u64,
        is_a_to_b: bool
    ): u64 {
        let (reserve_a, reserve_b, _) = get_amounts(pool);

        // For simplicity, assume current_sqrt_price is calculated directly
        let current_sqrt_price = calculate_sqrt_price(reserve_a, reserve_b);

        // Use total_liquidity directly
        let active_liquidity = pool.total_liquidity;

        if (active_liquidity == 0) return 0;

        let fee_amount = ((amount_in as u128) * (pool.fee_percent as u128)) / FEE_SCALING;
        let amount_after_fee = (amount_in as u128) - fee_amount;

        if (is_a_to_b) {
            calculate_a_to_b_output(amount_after_fee, current_sqrt_price, active_liquidity)
        } else {
            calculate_b_to_a_output(amount_after_fee, current_sqrt_price, active_liquidity)
        }
    }

    // Calculate output when swapping token A to token B using:
    // - Square root price changes
    // - Constant product formula with liquidity adjustment
    fun calculate_a_to_b_output(
        amount_in: u128,
        sqrt_price_current: u128,
        liquidity: u128
    ): u64 {
      let sqrt_price_next = sqrt_price_current + (amount_in * Q96 / liquidity);

        // Calculate output amount based on price change
        let amount_out = liquidity * (sqrt_price_next - sqrt_price_current) / Q96;
        (amount_out as u64)
    }

    // Calculate output when swapping token B to token A using:
    // - Square root price changes
    // - Constant product formula with liquidity adjustment
    fun calculate_b_to_a_output(
        amount_in: u128,
        sqrt_price_current: u128,
        liquidity: u128
    ): u64 {
        // Calculate next sqrt price after swap
        // Formula: sqrt_price_current + (amount_in / liquidity)
        let sqrt_price_next = sqrt_price_current + (amount_in * Q96 / liquidity);

        // Calculate output amount based on price change
        let amount_out = liquidity * (sqrt_price_next - sqrt_price_current) / Q96;
        (amount_out as u64)
    }

    // Calculate square root price using reserves ratio
    // Handles potential overflows by using u256 for intermediate calculations
    fun calculate_sqrt_price(reserve_a: u64, reserve_b: u64): u128 {
        
        // Use u256 for intermediate calculations
        let price = ((reserve_b as u256) * (Q96 as u256)) / (reserve_a as u256);
        print_string(b"Price:");
        debug::print(&price);
        // Calculate square root using binary search
        binary_search_sqrt(price as u128)
    }

    // Helper function for binary search square root
    fun binary_search_sqrt(x: u128): u128 {
        if (x == 0) return 0;
        
        let mut z = (x + 1) / 2;
        let mut y = x;
        
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        };
        
        y
    }

    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u128) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            pool.total_liquidity
        )
    }

    public entry fun flash_loan<TA, TB>(
        pool: &mut Pool<TA, TB>,
        amount_a: u64,
        amount_b: u64,
        borrower: address,
        ctx: &mut TxContext
    ) {
        let flash_state = FlashLoanState {
            token_a_owed: amount_a,
            token_b_owed: amount_b,
        };
        option::fill(&mut pool.flash_loan_state, flash_state);

        let token_a = coin::take(&mut pool.token_a, amount_a, ctx);
        let token_b = coin::take(&mut pool.token_b, amount_b, ctx);

        transfer::public_transfer(token_a, borrower);
        transfer::public_transfer(token_b, borrower);

        let expected_a = balance::value(&pool.token_a) + amount_a;
        let expected_b = balance::value(&pool.token_b) + amount_b;

        assert!(balance::value(&pool.token_a) >= expected_a, EFlashLoanNotRepaid);
        assert!(balance::value(&pool.token_b) >= expected_b, EFlashLoanNotRepaid);

        option::extract(&mut pool.flash_loan_state);
        assert!(balance::value(&pool.token_b) >= expected_b, EFlashLoanNotRepaid);
    }

    // Helper function to calculate liquidity
    // Calculate liquidity based on geometric mean of token amounts
    // Returns at least 1 if either amount is non-zero
    public fun calculate_liquidity(token_a_amt: u128, token_b_amt: u128): u128 {
        // Calculate liquidity based on geometric mean of token amounts
        let liquidity = binary_search_sqrt(token_a_amt * token_b_amt);
        // Ensure minimum liquidity
        if (liquidity == 0 && (token_a_amt > 0 || token_b_amt > 0)) {
            1
        } else {
            liquidity
        }
    }
}
