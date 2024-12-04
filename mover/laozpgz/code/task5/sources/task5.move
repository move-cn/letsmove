/// Module: task5
module task5::laozpgz_swap {

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    use sui::math;

    ///Three constants were defined to represent different error codes.
    const E_ZERO_AMOUNT: u64 = 0; //Error code indicating an amount of 0.When the supplied coins are zero.
    const E_RESERVES_EMPTY: u64 = 2; //An error code indicating that the reserve is empty.When someone tries to exchange in an empty pool.
    const E_POOL_FULL: u64 = 4; //Error code indicating that the pool is full.When someone tries to increase more liquidity.


    const FEE_SCALING: u128 = 10000; //The integer scaling setting used for cost calculation.
    const FEE_PERCENT: u128 = 30; //Set 0.3%. The percentage of fees to be extracted from the swap.

    //Defined maximum pool value to limit trading volume.
    //18446744073709551615 is the maximum value of u64 type.
    //Can avoid overflow issues.
    const MAX_POOL_VALUE: u64 = 18446744073709551615 / 10000;

    public struct LSP<phantom TA, phantom TB> has drop {}

    public struct Pool<phantom TA, phantom TB> has key {
        id: UID,
        token_a: Balance<TA>,
        token_b: Balance<TB>,
        lsp_supply: Supply<LSP<TA, TB>>,
        fee_percent: u64
    }

    fun init(_: &mut TxContext) {} //Initialize function, used to initialize the trading platform.


    ///Create liquidity pool
    entry fun create_pool<TA, TB>(
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        let fee_percent = FEE_PERCENT as u64;
        let token_a_amt = coin::value(&token_a);
        let token_b_amt = coin::value(&token_b);

        //This code is used to check whether the two token quantities of the transaction pair meet the conditions.
        // it will check if the quantity of both tokens is greater than 0, and if not, throw the exception EZERO-AMOUNT.
        assert!(token_a_amt > 0 && token_b_amt > 0, E_ZERO_AMOUNT);
        //it will check whether the quantity of both tokens is less than the maximum pool value (MAX-POOL_Value), and if not, throw the exception EPOOL_PULL.
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, E_POOL_FULL);

        //Used to calculate the exchange ratio between two tokens
        
        //Use the math:: sqrt() function to calculate the square root of the number of two tokens and store the result in the variable share.
        let share = math::sqrt(token_a_amt) * math::sqrt(token_b_amt);//This is to ensure that the exchange ratio is correct, as the exchange ratio is usually a decimal.
        
        //Create a token of LSP type, which is a combination of TA and TB types.
        //Create a supply of LSP type tokens using the balance:: createSupply() function. This function will return a Supply type variable representing the supply of LSP tokens.
        let mut lsp_supply = balance::create_supply(LSP<TA, TB> {});

        //LSP is a token type that represents the exchange ratio and will be used to represent the exchanged tokens.
        
        //Use the balance:: increment_supply() function to increase the supply of LSP tokens and pass share as a parameter.
        //This function will multiply the share by the supply of LSP tokens and return the result as the new supply.
        let lsp = balance::increase_supply(&mut lsp_supply, share);
        


        let pool = Pool {
            id: object::new(ctx), //A new object created by object:: new (ctx) to store the ID of Pool.
            token_a: coin::into_balance(token_a), //An object converted from token a to balance by coin:: into_balance (token a)
            token_b: coin::into_balance(token_b), //used to store the quantity of token A in the Pool.
            lsp_supply, //Represents the supply of LSP tokens in the Pool.
            fee_percent, // Represents the percentage of transaction fees in the Pool.
        };
        

        //By calling transfer:: share_object (pool), the token pool can be shared with all participants
        transfer::share_object(pool);
        

        //By calling transfer:: public_transfer, token transfer operations can be implemented, thereby enabling token trading and circulation.
        transfer::public_transfer(
            coin::from_balance(lsp, ctx),
            tx_context::sender(ctx)
        );
    }


    ///Used to add liquidity to a pool
    //By adjusting the number of tokens in the pool, the exchange ratio between the two tokens in the pool remains unchanged.
    entry fun add_liquidity<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        //Used to check if the amounts of two tokens (token_1 and token_b) are both greater than 0.
        assert!(coin::value(&token_a) > 0 && coin::value(&token_b) > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, lsp_supply) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, E_RESERVES_EMPTY);

        let token_a_balance = coin::into_balance(token_a);
        let token_b_balance = coin::into_balance(token_b);
        let token_a_added = balance::value(&token_a_balance);
        let token_b_added = balance::value(&token_b_balance);


        //Used to calculate the exchange ratio between two tokens (token a and token b), and to calculate the number of tokens obtained after exchange (share_mined).
        let share_minted = math::min(
            (token_a_added * lsp_supply) / token_a_amt,
            (token_b_added * lsp_supply) / token_b_amt
        );

        balance::join(&mut pool.token_a, token_a_balance);
        balance::join(&mut pool.token_b, token_b_balance);

        //Used to check if the number of two tokens is less than the maximum pool value (MAX-POOL_Value), and if it is less than, continue with subsequent operations; If it is greater than or equal to the maximum pool value, throw the exception E2POOL-FULL.
        assert!(token_a_amt < MAX_POOL_VALUE && token_b_amt < MAX_POOL_VALUE, E_POOL_FULL);

        let lsp = balance::increase_supply(&mut pool.lsp_supply, share_minted);
       

       //Used to implement transfer operations. It takes two parameters: one is the amount of the transfer, and the other is the recipient's address.
        transfer::public_transfer(
            coin::from_balance(lsp, ctx), //Used to retrieve a certain amount of cryptocurrency from the sender's balance.
            tx_context::sender(ctx) //Get the sender's address
        )
    }

    ///Remove liquidity from the trading pool.
    entry fun remove_liquidity<TA, TB>(
        pool: &mut Pool<TA, TB>,
        lsp: Coin<LSP<TA, TB>>,
        ctx: &mut TxContext
    ) {
        let lsp_amount = coin::value(&lsp);
        assert!(lsp_amount > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, total_supply) = get_amounts(pool);
        let token_a_share = (token_a_amt * lsp_amount) / total_supply;
        let token_b_share = (token_b_amt * lsp_amount) / total_supply;

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        transfer::public_transfer(coin::take(&mut pool.token_a, token_a_share, ctx), tx_context::sender(ctx));
        transfer::public_transfer(coin::take(&mut pool.token_b, token_b_share, ctx), tx_context::sender(ctx));
    }

    entry fun swap_a_to_b<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_a: Coin<TA>,
        ctx: &mut TxContext
    ) {
        let token_a_amt = coin::value(&token_a);
        assert!(token_a_amt > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, E_RESERVES_EMPTY);

        let token_b_amt = sell_token_a(pool, token_a_amt);
        balance::join(&mut pool.token_a, coin::into_balance(token_a));

        transfer::public_transfer(coin::take(&mut pool.token_b, token_b_amt, ctx), tx_context::sender(ctx));
    }

    entry fun swap_b_to_a<TA, TB>(
        pool: &mut Pool<TA, TB>,
        token_b: Coin<TB>,
        ctx: &mut TxContext
    ) {
        let token_b_amt = coin::value(&token_b);
        assert!(token_b_amt > 0, E_ZERO_AMOUNT);

        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        assert!(token_a_amt > 0 && token_b_amt > 0, E_RESERVES_EMPTY);

        let token_a_amt = sell_token_b(pool, token_b_amt);
        balance::join(&mut pool.token_b, coin::into_balance(token_b));

        transfer::public_transfer(coin::take(&mut pool.token_a, token_a_amt, ctx), tx_context::sender(ctx));
    }

    public fun sell_token_a<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_a_amt,
            token_b_amt,
            pool.fee_percent
        )
    }

    public fun sell_token_b<TA, TB>(pool: &Pool<TA, TB>, to_sell: u64): u64 {
        let (token_a_amt, token_b_amt, _) = get_amounts(pool);
        calc_output_amount(
            to_sell,
            token_b_amt,
            token_a_amt,
            pool.fee_percent
        )
    }

    public fun get_amounts<TA, TB>(pool: &Pool<TA, TB>): (u64, u64, u64) {
        (
            balance::value(&pool.token_a),
            balance::value(&pool.token_b),
            balance::supply_value(&pool.lsp_supply),
        )
    }

    ///Used to calculate the output amount for a given input amount, input reserve, output reserve, and expense percentage.
    // 1.Convert input amount, input reserve, output reserve, and expense percentage to U128 type for more accurate calculations.
    // 2.Calculate the input amount input_with_fee, which includes expenses, using the formula input_amount * FEE.SCALING/(FEE.SCALING - fee percentage). FEESCALING is a constant with a value of 1000000000000.
    // 3.Calculate the total amount using the formula input-reserve * output-reserve.
    // 4.Calculate the output amount output-amount using the formula output-reserve - total/(input-reserve+input_with_fee).
    // 5.Convert output.amount back to u64 type and return.
    public fun calc_output_amount(
        input_amount: u64,
        input_reserve: u64,
        output_reserve: u64,
        fee_percent: u64
    ): u64 {
        let (
            input_amount,
            input_reserve,
            output_reserve,
            fee_percent
        ) = (
            (input_amount as u128),
            (input_reserve as u128),
            (output_reserve as u128),
            (fee_percent as u128),
        );
        
        let input_with_fee = input_amount * FEE_SCALING / (FEE_SCALING - fee_percent);

        let total = input_reserve * output_reserve;
        let output_amount = output_reserve - total / (input_reserve + input_with_fee);

        (output_amount as u64)
    }
}
