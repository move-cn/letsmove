module js_swap::js_pool {
    use sui::coin::Coin;
    use js_coin::js_coin::JS_COIN;
    use js_faucet_coin::js_faucet_coin::JS_FAUCET_COIN;

    public struct JS has drop {}

    entry fun create_pool(
        coin_a: Coin<JS_COIN>,
        coin_b: Coin<JS_FAUCET_COIN>,
        fee_percent: u64,
        ctx: &mut TxContext
    ) {

      transfer::public_transfer(
          js_swap::js_swap::create_pool(JS{}, coin_a, coin_b, fee_percent, ctx),
          ctx.sender()
      )
    }
}