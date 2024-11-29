* mint_and_transfer

[doc](https://docs.sui.io/references/framework/sui-framework/coin#0x2_coin_mint_and_transfer)
```
sui client call --package 0x2 --module coin --function mint_and_transfer --type-args 0xbfb4db281a9519bc902e519d9a5fe2cec8a7be41ce68bdf2e8cce63bbaeaf4df::faucet_coin::FAUCET_COIN --args  <TreasuryCap> <amount> <address>

public entry fun mint_and_transfer<T>(
    c: &mut TreasuryCap<T>,
    amount: u64,
    recipient: address,
    ctx: &mut TxContext,
) {
    transfer::public_transfer(mint(c, amount, ctx), recipient)
}
```