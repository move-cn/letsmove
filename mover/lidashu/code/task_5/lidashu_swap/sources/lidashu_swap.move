#[allow(lint(self_transfer))]
module lidashu_swap::lidashu_swap {

    use sui::coin::{Self, Coin};
    use sui::balance::{Self, Supply, Balance};
    
    public struct LSP<phantom Base, phantom Quote> has drop {}

    public struct LidashuPool<phantom Base, phantom Quote> has key {
        id: UID,
        ratio_base: u64,
        ratio_quote: u64,
        lsp_supply: Supply<LSP<Base, Quote>>,
        base_balance: Balance<Base>,
        quote_balance: Balance<Quote>,
    }

    public fun create_pool<Base, Quote>(
        token_base: Coin<Base>,
        token_quote: Coin<Quote>,
        ratio_base: u64, 
        ratio_quote: u64, 
        ctx: &mut TxContext) {

        let token_base_amount = coin::value(&token_base);
        let token_quote_amount = coin::value(&token_quote);

        let share = (token_base_amount/ratio_base + token_quote_amount/ratio_quote)/2;
        let mut lsp_supply = balance::create_supply(LSP<Base, Quote> {});
        let lsp = balance::increase_supply(&mut lsp_supply, share);
        
        // Share the object to make it accessible to everyone!
        transfer::share_object(LidashuPool {
            id: object::new(ctx),
            ratio_base,
            ratio_quote,
            lsp_supply,
            base_balance:  coin::into_balance(token_base),
            quote_balance:  coin::into_balance(token_quote)
        });

        transfer::public_transfer(
            coin::from_balance(lsp, ctx),
            tx_context::sender(ctx)
        );
    }

    public fun add_liquidity<Base, Quote> (
        pool: &mut LidashuPool<Base, Quote>,
        token_base: Coin<Base>,
        token_quote: Coin<Quote>,
        ctx: &mut TxContext
    ) {
        let token_base_balance = coin::into_balance(token_base);
        let token_quote_balance = coin::into_balance(token_quote);

        let token_base_amount = balance::value(&token_base_balance);
        let token_quote_amount = balance::value(&token_quote_balance);

        balance::join(&mut pool.base_balance, token_base_balance);
        balance::join(&mut pool.quote_balance, token_quote_balance);

        let share = (token_base_amount/pool.ratio_base + token_quote_amount/pool.ratio_quote)/2;
        let lsp = balance::increase_supply(&mut pool.lsp_supply, share);


        transfer::public_transfer(
            coin::from_balance(lsp, ctx),
            tx_context::sender(ctx)
        );
    }


    public fun remove_liquidity_inner<Base, Quote> (
        pool: &mut LidashuPool<Base, Quote>,
        lsp: Coin<LSP<Base, Quote>>,
        ctx: &mut TxContext
    ) {

        let lsp_amount = coin::value(&lsp);

        balance::decrease_supply(&mut pool.lsp_supply, coin::into_balance(lsp));

        let token_base_amount = lsp_amount * pool.ratio_base;
        let token_quote_amount = lsp_amount * pool.ratio_quote;

        let token_base = coin::take(&mut pool.base_balance, token_base_amount, ctx);
        let token_quote = coin::take(&mut pool.quote_balance, token_quote_amount, ctx);
    

        transfer::public_transfer(
            token_base,
            tx_context::sender(ctx)
        );

        transfer::public_transfer(
            token_quote,
            tx_context::sender(ctx)
        );

    }


    public fun swap_base<Base, Quote> (
        pool: &mut LidashuPool<Base, Quote>,
        from_token_base: &mut Coin<Base>,
        amount: u64,
        ctx: &mut TxContext
    ){

        let token_base = coin::split(from_token_base, amount, ctx);
        let token_quote_amount = amount*pool.ratio_quote/pool.ratio_base;

        balance::join(&mut pool.base_balance, coin::into_balance(token_base));

        let token_quote = coin::take(&mut pool.quote_balance, token_quote_amount, ctx);

        transfer::public_transfer(
            token_quote,
            tx_context::sender(ctx)
        );
    }


    public fun swap_quote<Base, Quote> (
        pool: &mut LidashuPool<Base, Quote>,
        from_token_quote: &mut Coin<Quote>,
        amount: u64,
        ctx: &mut TxContext
    ){

        let token_quote = coin::split(from_token_quote, amount, ctx);
        let token_base_amount = amount*pool.ratio_base/pool.ratio_quote;

        balance::join(&mut pool.quote_balance, coin::into_balance(token_quote));

        let token_base = coin::take(&mut pool.base_balance, token_base_amount, ctx);

        transfer::public_transfer(
            token_base,
            tx_context::sender(ctx)
        );
    }




}
