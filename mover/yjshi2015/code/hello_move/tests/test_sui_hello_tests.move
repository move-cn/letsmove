#[test_only]
#[allow(unused_assignment)]
module hello_move::my_coin {

    const ENotImplemented: u64 = 0;

    public struct MY_COIN has drop {}

    public struct MyTokenRule has drop {}

    public struct MyTokenConfig has store {
        amount_rule: u64
    }

    #[test]
    fun test_coin() {
        use sui::coin;

        let mut ctx = tx_context::dummy();

        let (mut treasury_cap, coin_metadata) = coin::create_currency<MY_COIN>(
            MY_COIN {},
            9,
            b"MC",
            b"My Coins",
            b"description",
            std::option::none(),
            &mut ctx
        );

        let coin = coin::mint(
            &mut treasury_cap,
            1_000_000_000,
            &mut ctx
        );

        transfer::public_transfer(coin, @0x1234);

        transfer::public_share_object(treasury_cap);
        transfer::public_freeze_object(coin_metadata);

    }

    #[test]
    fun test_token() {
        use sui::token;
        use sui::coin;

        let mut ctx = tx_context::dummy();

        let (mut treasury_cap, coin_metadata) = coin::create_currency<MY_COIN>(
            MY_COIN {},
            9,
            b"MC",
            b"My Coins",
            b"description",
            std::option::none(),
            &mut ctx
        );

        let (mut policy, policy_cap ) = token::new_policy(& treasury_cap, &mut ctx);

        token::allow(
            &mut policy,
            & policy_cap,
            token::to_coin_action(),
            &mut ctx
        );

        token::add_rule_config(
            MyTokenRule {},
            &mut policy,
            & policy_cap,
            MyTokenConfig {
                amount_rule: 1_000_000_000
            },
            &mut ctx
        );


        let token = token::mint(
            &mut treasury_cap,
            1_000_000_000,
            &mut ctx
        );

        let (coin, mut action_request) = token::to_coin(
            token,
            &mut ctx
        );

        token::add_approval(
            MyTokenRule {},
            &mut action_request,
            &mut ctx
        );

        token::confirm_request(
            & policy,
            action_request,
            &mut ctx
        );

        token::share_policy(policy);
        transfer::public_transfer(coin, @0x1234);
        transfer::public_transfer(policy_cap, @0x1234);
        transfer::public_share_object(treasury_cap);
        transfer::public_freeze_object(coin_metadata);
    }

    #[test, expected_failure(abort_code = hello_move::my_coin::ENotImplemented)]
    fun test_test_sui_hello_fail() {
        abort ENotImplemented
    }



    #[test]
    fun test_print(){
        std::debug::print(& std::string::utf8(b"hello world"));
    }

    fun new_u64():u64{
        let mut i = 10;
        std::debug::print_stack_trace();
        i = 20;
        i
    }

    #[test]
    fun test_print_stack_trace(){
        new_u64();
    }
}
#[test_only]
#[allow(unused_field)]
module test_sui_hello::nft{
    use std::string::String;

    public struct NFT has drop {}

    public struct MyNFT has key, store {
        id: UID,
        name: String,
    }
    
    public struct TestStruct has drop {}

    #[test]
    fun test_display(){
        use sui::test_scenario;
        use sui::display;
        use sui::package;

        let mut test = test_scenario::begin(@0x2);
        let pub = package::test_claim(NFT {}, test.ctx());

        // create a new display object
        let mut display = display::new<MyNFT>(&pub, test.ctx());

        display.add(b"name".to_string(), b"MyNFT {name}".to_string());
        display.add(b"link".to_string(), b"https://nft.com/{id}".to_string());
        display.add(b"image_url".to_string(), b"https://nft.com/{id}.svg".to_string());
        display.add(b"description".to_string(), b"My NFT".to_string());

        pub.burn_publisher();
        transfer::public_transfer(display, @0x2);
        test.end();
    }
}
