module ajin8898_faucet::ajin8898_faucet {
    use sui::balance::{Balance};
    use sui::balance;
    use sui::coin::{Self, TreasuryCap};
    public struct AJIN8898_FAUCET has drop {}
    public struct PublicWallet has key {
        id: UID,
        coin: Balance<AJIN8898_FAUCET>,
        faucet_amount: u64,
    }
    const AMOUNT: u64 = 10^12;
    const EFaucetDry: u64 = 1;
    #[allow(lint(share_owned))]
    fun init(witness: AJIN8898_FAUCET, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency<AJIN8898_FAUCET>(
            witness,
            10,
            b"ajin8898 Faucet",
            b"ajin8898 Faucet coin",
            b"Get some free",
            option::none(),
            ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        let wallet = PublicWallet {
            id: object::new(ctx),
            coin: balance::zero(),
            faucet_amount: AMOUNT,
        };
        transfer::share_object(wallet);
    }
    public entry fun mint_faucet(
        treasury_cap: &mut TreasuryCap<AJIN8898_FAUCET>,
        amount: u64,
        wallet: &mut PublicWallet,
        ctx: &mut TxContext) {
        let coins = coin::mint(treasury_cap, amount, ctx);
        balance::join(&mut wallet.coin, coin::into_balance(coins));
    }
    public entry fun get_faucet(wallet: &mut PublicWallet, ctx: &mut TxContext) {
        let balance_amount = balance::value(&wallet.coin);
        assert!(balance_amount >= wallet.faucet_amount, EFaucetDry);
        let mint_balance = balance::split(&mut wallet.coin, wallet.faucet_amount);
        let faucet_coin = coin::from_balance(mint_balance, ctx);
        transfer::public_transfer(faucet_coin, tx_context::sender(ctx));
    }
}

// 切换地址
// sui client switch --address 0x74a3ba8cd6f6331093c7bbc36d4bb805ff90b9eb3fe128d402fc03e13cc9ae87

// address1: sui client call --function mint_faucet --package 0x35492b3e019b3f5cec1e00190de1e751013114214b4e94dce2e4193215ef2d82 --module ajin8898_faucet --args 0x7aaf7fb6d11b56ba1d3be789347122044bc352c7a3928ca67ea226fecb27929a 100000000 0xe7d6073ff1188cc6159aff80580a61d53528a8171c949b6a3695fdc91f834f84 --gas-budget 50000000
// Transaction Effects > Created Objects > Owner: Shared > ID: 0xe7d6073ff1188cc6159aff80580a61d53528a8171c949b6a3695fdc91f834f84
// address2: sui client call --function mint_faucet --package 0x1e7aed8b04e58aabe6b7082875d6e3055c3f61d0239a26622dfb363c75fab2e4 --module ajin8898_faucet --args 0x8db67ea7888ff9ad60716fd5ac409734c15c9fdbd2e16aaa3b9ddd06ac1d06ef 100000000 0x9def82b646bc4c2e2fcdad7fcd6704a5d5267118bb07539f10f9c151ddc3e37b --gas-budget 50000000

// 0x9def82b646bc4c2e2fcdad7fcd6704a5d5267118bb07539f10f9c151ddc3e37b